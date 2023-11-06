function curp=compute_competition_tol(curp,nr,lr,X,numround)
% code to numerically compute steady state

% put a strict boundary for the tolerance 
options=optimset('TolFun',1e-9);
options=optimset(options,'TolX',1e-9);
options=optimset(options,'MaxFunEvals',1e9);
tol=1e-9; % tolerance for evaluating steady state
tol2=1e-5; % tolerance for finding z


% conditions to ensure while loop runs
notdone=true;
i1=0; % counter

% repeats until a steady state is reached
while notdone
    i1+1;
    % solve for z in growth phase
    findz=@(z) ((1-curp*nr/(1+curp*nr-curp))*z.^lr+curp*nr/(1+curp*nr-curp)*z-X).^2;
    z=fminsearch(findz,X,options); % X is a guess for z
    z=abs(real(z));
    if findz(z)>tol2 % check to see if the z solution is not good enough
        % try recalculating z
        cct=0;
        notdone2=true;
        while notdone2
            z=fminsearch(findz,rand()*X,options);
            z=abs(real(z));
            if findz(z)<tol2
                % good z found
                notdone2=false;
            end
            cct=cct+1;
            if cct>1000
               error('problem calculating z');
            end
        end
    end
    % calculate p' which here is called q
    q=curp*z/(curp*z+(1-curp)*z^lr);
    % use p' to calculate p_{i+1}
    p=nr^(2/3)/(nr^(2/3)+(1-q)/q);
    if abs(curp-p)<tol
        % steady state is reached
        notdone=false;
    end
    if curp<tol | curp>1-tol
        % p is close to 0 or 1
        notdone=false;
    end
   
    if i1>numround
        % too many iterations
        notdone=false;
    end
    curp=p; % update the current value of p, curp
end