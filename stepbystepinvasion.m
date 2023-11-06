% Code for invasion, boundaries
clear;close all

% Colors
small=[216,179,101]/255;
large=[90,180,172]/255 ;
grey=[100,100,100]/255 ;
new_small=[191,129,45]/255;
new_large=[1,102,94]/255;
grey_2=.85*ones(1,3);
red=[252,78,42]/255;


%% First plot
set(gca,'Fontsize',24,'FontName','Times New Roman');

% starting growth rate and size of small cluster
l_small=3; 
n_small=3;

% expansion of population
X=32;

% size ratios n_r to consider
nrvect=[1:200]';

% the boundaries for lambda_r such that a cluster of size n_r can invade
bound_up=(2/3*log(nrvect)+log(X))./log(X);
bound_down=log(X)./(log(X)-2/3*log(nrvect));

% the growth of the large cluster
nls=n_small*nrvect; 

% code to create a shaded region bounded by bound_up and bound_down 
vect1=[nls;nls(end:-1:1);nls(1)];
vect2=[l_small./bound_up;l_small./bound_down(end:-1:1);l_small./bound_up(1)]; % note: lambda_large = lambda_small / lambda_r
fill(vect1,vect2,grey,'EdgeColor',grey,'FaceAlpha',.25)
hold on;

% plot the initial small cluster type
subplot(1,4,1)

fill(vect1,vect2,grey,'EdgeColor',grey,'FaceAlpha',.25); % same region
hold on;
scatter(n_small,l_small,150,small,'filled','LineWidth',3); % plot small
set(gca, 'FontSize', 24, 'FontName','Times New Roman')
% code for the new type
n_large=100; % size of example large cluster type
l_large=1.4; % growth rate of example large cluster type

scatter(n_large,l_large,150,large,'LineWidth',3); % plot large
nr=n_large/n_small; % n_r
lr=l_small/l_large; % l_r
coexist_line=l_small./((lr*log(nr))./(lr*log(nr)+(1-lr)*log(nrvect))); % the tradeoff line that determines who can invade

% format the graph and save plot
xlabel('cluster size','FontSize',24,'FontName','Times New Roman')
ylabel('growth rate','FontSize',24,'FontName','Times New Roman')
box off
axis([0 200 0 5])
% print -f1 -dpng -r300 evo_dynamics2.png


%% Plot two
subplot(1,4,2)

% repeat earlier plot
plot(nls,coexist_line,':','Color',grey, 'LineWidth',3)
hold on;
scatter(n_small,l_small,150,small,'filled','LineWidth',3);
set(gca, 'FontSize', 24, 'FontName','Times New Roman')
scatter(n_large,l_large,150,large,'filled','LineWidth',3);

% sample very large type that cannot invade
n_verylarge=200;
l_verylarge=1;

scatter(n_verylarge,l_verylarge,150,large,'filled','LineWidth',3);
scatter(n_verylarge,l_verylarge,100,[1 1 1],'x','LineWidth',3);

% format the graph and save plot
xlabel('cluster size','FontSize',24,'FontName','Times New Roman')
ylabel('growth rate','FontSize',24,'FontName','Times New Roman')
box off
axis([0 200 0 5])
% print -f1 -dpng -r300 evo_dynamics3.png

%% Plot three
subplot(1,4,3)
% % a mutant small cluster that grows faster but is the same size
l_small_mutant=4; %lambda for new cluster

% coexistence line between small mutant and large
nr=n_large/n_small;
lr=l_small_mutant/l_large;
coexist_line=l_small_mutant./((lr*log(nr))./(lr*log(nr)+(1-lr)*log(nrvect)));
plot(nls,coexist_line,':','Color',grey, 'LineWidth', 3)
hold on;

scatter(n_small,l_small_mutant,150,small,'filled','LineWidth',3);
set(gca, 'FontSize', 24, 'FontName','Times New Roman')
scatter(n_small,l_small,150,'MarkerFaceColor',small,'MarkerEdgeColor',small,...
    'MarkerFaceAlpha',.65,'MarkerEdgeAlpha',.65); % dead one


scatter(n_large,l_large,150,large,'filled','LineWidth',3);

box off
axis([0 200 0 5])

%% Plot four
subplot(1,4,4)
% repeat earlier plot
% coexistence line between small mutant and large
nr=n_large/n_small;
lr=l_small_mutant/l_large;
coexist_line=l_small_mutant./((lr*log(nr))./(lr*log(nr)+(1-lr)*log(nrvect)));
plot(nls,coexist_line,':','Color',red, 'LineWidth', 2)
hold on;

% coexistence line between small mutant and very large
n_verylarge=200;
l_verylarge=1;
nr=n_verylarge/n_small;
lr=l_small_mutant/l_verylarge;
coexist_line=l_small_mutant./((lr*log(nr))./(lr*log(nr)+(1-lr)*log(nrvect)));
plot(nls,coexist_line,':','Color',grey, 'LineWidth',3)


scatter(n_small,l_small_mutant,150,small,'filled','LineWidth',3);

% plot points for large types
scatter(n_verylarge,l_verylarge,150,large,'filled','LineWidth',3);
scatter(n_large,l_large,150,'MarkerFaceColor',large,'MarkerEdgeColor',large,...
    'MarkerFaceAlpha',.65,'MarkerEdgeAlpha',.65); % dead one


% format the graph and save plot
set(gca, 'FontSize', 24, 'FontName','Times New Roman')

xlabel('cluster size','FontSize',24,'FontName','Times New Roman')
ylabel('growth rate','FontSize',24,'FontName','Times New Roman')

box off
axis([0 200 0 5])

%% Save figure
set(gcf, 'color', 'none');    
orient(gcf,'landscape')
set(gcf,'Position',[100 100 1350 300])
exportgraphics(gcf,'fig5.pdf',...   
    'ContentType','vector',...
    'BackgroundColor','none')
