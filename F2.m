% Make Figure 2

clear
close all
clc

% standard oxygen color :  "#969696"
% High oxygen color : "#3288bd"
% Large cluster color : "#5ab4ac"
% Small cluster color : '#5ab4ac'

%% Import data

% Competition assays
% 8 first columns - standard O2
% 5 last columns - supp O2

filename  = 'rawdt_for_plot_interpolationNAs_filtered.txt';
data      = readtable(filename); % table
data      = data{:,:}; % matrix 


% ------------------------------------------------------------------------%
%% PANEL A - competition assay in standard oxygen
% ------------------------------------------------------------------------%
subplot(1,3,1)

for i=1:8
        plot(data(:,i),'-','LineWidth',2,'Color', "#969696", ...
        'MarkerSize',0.5, 'MarkerFaceColor', "#969696"); hold on;
end

% Add line at value 0 and 1 - no coexistence
line(0:100,repelem(1,101), 'Color', 'black', 'LineStyle','--')
line(0:100,repelem(0,101), 'Color', 'black', 'LineStyle','--')

% Specs
ylim([-0.02,1.02]); xlim([1 6]) ;
xlabel('Days')
ylabel('Proportion of Large clusters','Fontsize',16)
set(gca,'Fontsize',24,'FontName','Times New Roman');

% Legend
leg = legend('Standard O_{2}', 'Location','east');
leg.FontSize = 18;
legend boxoff  
box off
% ------------------------------------------------------------------------%
%% PANEL C -  competition assay in high oxygen
% ------------------------------------------------------------------------%
subplot(1,3,3)

for i=9:15
        plot(data(:,i),'-','LineWidth',2,'Color', "#3288bd", ...
        'MarkerSize',0.5, 'MarkerFaceColor', "#3288bd"); hold on;
end

% Add line at value 0 an 1 - no coexistence
line(0:100,repelem(1,101), 'Color', 'black', 'LineStyle','--')
line(0:100,repelem(0,101), 'Color', 'black', 'LineStyle','--')

% Specs
ylim([-0.02,1.02]); xlim([1 6]);
xlabel('Days')
ylabel('Proportion of Large clusters','Fontsize',24)
set(gca,'Fontsize',24,'FontName','Times New Roman');

% Legend
leg = legend('Supp. O_{2}', 'Location','east');
leg.FontSize = 18;
legend boxoff   
box off

% ------------------------------------------------------------------------%
%% PANEL B - negative frequency dependent selection in standard O2
% ------------------------------------------------------------------------%

lowO2_vec         = 1:8 ;                        % 8 first columns of the dataset is the frequency at start of Large in standard O2 
%end_frq           = mean(data(end, lowO2_vec)) ; % take the average of the frequencies at the end of the competition assay

freq_lrg          = data(end,lowO2_vec) - data(1,lowO2_vec); % calculate the difference between the mean equilibrium frequency and the frequency at start 
freq_sml          = (1-data(end,lowO2_vec)) - (1-data(1,lowO2_vec)) ;

[out, idx]        = sort(freq_lrg) ;              % Sort (this is to link points in the plot)
freq_at_start     = data(1,lowO2_vec) ;

% Linear fit
coefS             = polyfit(freq_at_start(idx),freq_sml(idx),1);
linearFitS        = polyval(coefS,freq_at_start(idx));
coefL             = polyfit(freq_at_start(idx),freq_lrg(idx),1);
linearFitL        = polyval(coefL,freq_at_start(idx));

% Linear fit with estimation of R^2
fitS              = fitlm( freq_at_start(idx),freq_sml(idx) ) ;

% Estimated Coefficients:
%                    Estimate        SE       tStat       pValue  
%                    _________    ________    ______    __________
% 
%     (Intercept)    -0.095083    0.029686    -3.203       0.01853
%     x1                1.0274    0.074847    13.726    9.2956e-06
% 
% 
% Number of observations: 8, Error degrees of freedom: 6
% Root Mean Squared Error: 0.0524
% R-squared: 0.969,  Adjusted R-Squared: 0.964
% F-statistic vs. constant model: 188, p-value = 9.3e-06

fitL              = fitlm( freq_at_start(idx),freq_lrg(idx) ) ;


% Plot
subplot(1,3,2)


% Estimated Coefficients:
%                    Estimate       SE        tStat       pValue  
%                    ________    ________    _______    __________
% 
%     (Intercept)    0.095083    0.029686      3.203       0.01853
%     x1              -1.0274    0.074847    -13.726    9.2956e-06
% 
% 
% Number of observations: 8, Error degrees of freedom: 6
% Root Mean Squared Error: 0.0524
% R-squared: 0.969,  Adjusted R-Squared: 0.964
% F-statistic vs. constant model: 188, p-value = 9.3e-06

hold on
box on
plot(0:1, repelem(0, length(0:1)), '--', 'LineWidth', 1, 'Color', 'black')
lg = plot(freq_at_start(idx), freq_lrg(idx), '.', 'MarkerSize', 25, 'Color', '#5ab4ac')
sm = plot(freq_at_start(idx), freq_sml(idx),'.', 'MarkerSize', 25,'Color', '#d8b365')
% Plot the regression
plot(freq_at_start(idx), -0.095083+1.0274.*freq_at_start(idx) , '-', 'LineWidth', 2,  'Color', '#d8b365')
plot(freq_at_start(idx), 0.095083-1.0274.*freq_at_start(idx) , '-', 'LineWidth', 2,  'Color', '#5ab4ac')

% Specs
xlabel('Starting freq. of Large clusters') ; ylabel('Change in frequency')
xlim([0 1]) ; ylim([-1 1])
set(gca,'Fontsize',24,'FontName','Times New Roman');
% Legend
leg = legend([sm, lg],{'Small', 'Large'}, 'Location','southwest');
leg.FontSize = 16;
legend boxoff 
box off

%% Save figure
set(gcf, 'color', 'none');    
orient(gcf,'landscape')
set(gcf,'Position',[100 100 1350 370])
exportgraphics(gcf,'F2.pdf',...   
    'ContentType','vector',...
    'BackgroundColor','none')






