clear;close all

% Colors
grey=[186,186,186]/255 ;
settling=[127,205,187]/255;
combined=[65,182,196]/255;
growth=[34,94,168]/255;

subplot(1,2,1)
% Parameters
dn=.25; % step size for n_r ratio
nrvect=[1+dn:dn:50]'; % vector of n_r ratios
X=32; % fold change for population growth

% Boundarys for lambda_r
bounddown=log(nrvect)/log(X)*(2/3)+1; % lower boundary for l_r
boundup=log(X)./(log(X)-2/3*log(nrvect)); % upper boundary for l_r

% Plot coexistence zone
blue=[55 126 184]/255; % color
vect1=[nrvect;nrvect(end:-1:1);nrvect(1)]; % horizontal data for fill command
vect2=[boundup;bounddown(end:-1:1);boundup(1)]; % vertical data for fill command
fill(vect1,vect2,grey,'EdgeColor',grey) % creates a coexistence boundary for lambda_r


set(gca,'FontName','Times New Roman','LineWidth',3,'FontSize',24)
xlabel('ratio of cluster sizes (large/small), n_r','FontSize',24,'FontName','Times New Roman')
ylabel('ratio of cell growth rates (small/large), \lambda_r','FontSize',24,'FontName','Times New Roman')
text(25,2.25,'coexistence','FontSize',24,'FontName','Times New Roman','Color',[1 1 1])
box off
text(5,3,'only small clusters','FontSize',24,'FontName','Times New Roman')
text(25,1.3,'only large clusters','FontSize',24,'FontName','Times New Roman')    
    

%% Code to evaluate numerically the value of the steady state for p_i

% large wins
numround=10000; % maximum number of rounds
nr=25; % n_r
lr=1.3; % lamdba_r
initial_p=.01; % some small number between 0 and 1, close to 0
curp=compute_competition_tol(initial_p,nr,lr,X,numround);
tol=1e-6; % tolerance
if curp>1-tol
    'only large'
elseif curp<tol
    'only small'
else
    'coexistence'
end

% small wins
numround=10000; % maximum number of rounds
nr=5; % n_r
lr=3; % lamdba_r
initial_p=.01; % some small number between 0 and 1, close to 0
curp=compute_competition_tol(initial_p,nr,lr,X,numround);
tol=1e-6; % tolerance
if curp>1-tol
    'only large'
elseif curp<tol
    'only small'
else
    'coexistence'
end

% coexistence
numround=10000; % maximum number of rounds
nr=32; % n_r
lr=2; % lamdba_r
initial_p=.01; % some small number between 0 and 1, close to 0
curp=compute_competition_tol(initial_p,nr,lr,X,numround);
tol=1e-6; % tolerance
if curp>1-tol
    'only large'
elseif curp<tol
    'only small'
else
    'coexistence'
end


% check either side of boundary
numround=10000; % maximum number of rounds
initial_p=.01; % some small number between 0 and 1, close to 0
nr=nrvect(end);
lr=boundup(end)+.01;
curp=compute_competition_tol(initial_p,nr,lr,X,numround);
tol=1e-6; % tolerance
if curp>1-tol
    'only large'
elseif curp<tol
    'only small'
else
    'coexistence'
end
lr=boundup(end)-.01;
curp=compute_competition_tol(initial_p,nr,lr,X,numround);
tol=1e-6; % tolerance
if curp>1-tol
    'only large'
elseif curp<tol
    'only small'
else
    'coexistence'
end

    

% check either side of other boundary
numround=10000; % maximum number of rounds
initial_p=.01; % some small number between 0 and 1, close to 0
nr=nrvect(end);
lr=bounddown(end)+.01;
curp=compute_competition_tol(initial_p,nr,lr,X,numround);
tol=1e-6; % tolerance
if curp>1-tol
    'only large'
elseif curp<tol
    'only small'
else
    'coexistence'
end
lr=bounddown(end)-.01;
curp=compute_competition_tol(initial_p,nr,lr,X,numround);
tol=1e-6; % tolerance
if curp>1-tol
    'only large'
elseif curp<tol
    'only small'
else
    'coexistence'
end


%% panel b
subplot(1,2,2)

lr=2;
nr=32;
X=32;
pi=.1;

fun=@(z) ((1-pi*nr/(1+pi*nr-pi))*z.^lr+pi*nr*z/(1+pi*nr-pi)-X)^2;
x=2;
pis=[0:.01:1];
fun2=@(z,pi) ((1-pi*nr/(1+pi*nr-pi))*z.^lr+pi*nr*z/(1+pi*nr-pi)-X)^2;

for i1=1:length(pis);
pi=pis(i1);
[x,y]=fminsearch(@(t) fun2(t,pi),2);
val(i1)=x;
end

s1=log(val.^(1-lr));
s2=log(nr^(2/3));

st=s1+s2;
colors=[228 26 28;55 126 184;77 175 74;152 78 163]/255;


ax1=plot(pis,s1,'Color',growth,'LineWidth',3);
hold on;
ax2=plot(pis,s2*ones(size(pis)),'Color',settling,'LineWidth',3);
hold on;
ax3=plot(pis,st,'Color',combined,'LineWidth',3);

set(gca,'LineWidth',3,'FontSize',24, 'FontName','Times New Roman')
xlabel('frequency of large clusters','FontSize',24,'FontName','Times New Roman')
ylabel('selection coefficient','FontSize',24,'FontName','Times New Roman')
hold on
plot(pis, zeros(size(pis)),':','Color',[.5 .5 .5],'LineWidth',2)
k=find(st<0,1);
if st(k-1)>0
hold on;
h=scatter((pis(k)+pis(k-1))/2,0,100)
h.MarkerFaceColor=[0 0 0];
end
text(.4,1.85,'settling','FontSize',24,'FontName','Times New Roman','Color',settling)
text(.2,-2,'growth','FontSize',24,'FontName','Times New Roman','Color',growth)
text(.65,-.4,'combined','FontSize',24,'FontName','Times New Roman','Color',combined)
ylim([-4 2.5])
box off

%% Save figure
set(gcf, 'color', 'none');    
orient(gcf,'landscape')
set(gcf,'Position',[100 100 1200 450])
exportgraphics(gcf,'fig3.pdf',...   
    'ContentType','vector',...
    'BackgroundColor','none')



