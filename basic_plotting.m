%%% make data
%%
x = linspace(-pi,pi,400); % set a grid of 400 points along the x-axis
y1 = sin(5*x) + 0.5*sin(3*x) + 0.3; % make a function of x 
y2 = sin(5*x) + 0.5*sin(3*x) + 0.3 + 0.01; % make another function of x 

%%% worst plot
%%
c1 = [0.5 0.0 0.5];
c2 = [0.0 0.0 0.9];
plot(x,y1,'color',c1)
hold all
plot(x,y2,'color',c2)
hold off

%%% better plot
%%
plot(x,y1,'color',c1,'linewidth',3)
hold all
plot(x,y2,'color',c2,'linewidth',3)
hold off

%%% better plot 2
%%
plot(x,y1,'color',c1,'linewidth',3)
hold all
plot(x,y2,'--','color',c2,'linewidth',3)
hold off

%%% better plot 3
%%
plot(x,y1,'color',c1,'linewidth',3)
hold all
plot(x,y2,'--','color',c2,'linewidth',6)
hold off
set(gca,'linewidth',3,'fontsize',25)


%%% better colors plot 3
%%
c1 = [212, 17, 89]./255;
c2 = [26, 133, 255]./255;
plot(x,y1,'color',c1,'linewidth',3)
hold all
plot(x,y2,'--','color',c2,'linewidth',6)
hold off
set(gca,'linewidth',3,'fontsize',25)

%%% labeled plot
%%
plot(x,y1,'color',c1,'linewidth',3)
hold all
plot(x,y2,'--','color',c2,'linewidth',6)
hold off
set(gca,'linewidth',3,'fontsize',25)
xlabel('x')
ylabel('Amplitude (mu m)')
title('A signal with two modes')
legend('original signal','reconstructed signal')

%%% labeled plot
%%
plot(x,y1,'color',c1,'linewidth',3)
hold all
plot(x,y2,'--','color',c2,'linewidth',6)
hold off
set(gca,'linewidth',3,'fontsize',25,'TickLabelInterpreter','latex')
xlabel('$$x$$','interpreter','latex','fontsize',30)
ylabel('Amplitude $$(\mu m)$$','interpreter','latex','fontsize',30)
title('A signal with two modes','interpreter','latex','fontsize',35)
legend('original signal','reconstructed signal','interpreter','latex','fontsize',35)
axis tight


%%% labeled plot with inset
%%
plot(x,y1,'color',c1,'linewidth',3)
hold all
plot(x,y2,'--','color',c2,'linewidth',6)
hold off
set(gca,'linewidth',3,'fontsize',25,'TickLabelInterpreter','latex')
xlabel('$$x$$','interpreter','latex','fontsize',30)
ylabel('Amplitude $$(\mu m)$$','interpreter','latex','fontsize',30)
title('A signal with two modes','interpreter','latex','fontsize',35)
legend('original signal','reconstructed signal','interpreter','latex','fontsize',35)
axis tight

xstart=.6
xend=.8
ystart=.6
yend=.8
ax_ins = axes('position',[xstart ystart xend-xstart yend-ystart ])
plot(x,y1,'color',c1,'linewidth',3)
hold all
plot(x,y2,'--','color',c2,'linewidth',6)
hold off
xlim([0.9 1.1])
set(ax_ins,'linewidth',3,'fontsize',25,'TickLabelInterpreter','latex')

%%
%%%%%%%%%% Set new defaults
set(0,'defaulttextInterpreter','latex')
set(0, 'defaultAxesTickLabelInterpreter','latex'); 
set(0, 'defaultLegendInterpreter','latex');
set(0, 'defaultLineLineWidth',3);
set(0,'defaultAxesFontSize',35)

%%% test new defaults
plot(x,y1)



%%% make new data
%% 
clf % clear current figure
x = linspace(-pi,pi,40); % set a grid of 400 points along the x-axis
y1 = sin(5*x) + 0.5*sin(3*x) + 0.3; % make a function of x 
y2 = sin(5*x) + 0.5*sin(3*x) + 0.3 + 0.01*randn(size(x)); % make another function of x 

%%% symbol plot
%%
% c1 = [255, 194, 10]./255;
% c2 = [12, 123, 220]./255;
c2 = [0.2422    0.1504    0.6603];
c1 = [245, 160, 10]./255;
plot(x,y1,'-o','color',c1,'linewidth',3,'markersize',20)
hold all
plot(x,y2,'--o','color',c2,'linewidth',5,'markersize',8,'markerfacecolor','r')
set(gca,'linewidth',3)
xlabel('$$x$$')
ylabel('Amplitude $$(\mu m)$$')
title('A signal with two modes','interpreter','latex','fontsize',35)
legend('original signal','reconstructed signal')
axis tight
ylim(1.1*get(gca,'ylim'))

%%% sub plot
%%
% c1 = [255, 194, 10]./255;
% c2 = [12, 123, 220]./255;
c2 = [0.2422    0.1504    0.6603];
c1 = [245, 160, 10]./255;
subplot(1,2,1)
plot(x,y1,'-o','color',c1,'linewidth',3,'markersize',20)
hold all
plot(x,y2,'--o','color',c2,'linewidth',5,'markersize',8,'markerfacecolor','r')
hold off
set(gca,'linewidth',3)
xlabel('$$x$$')
ylabel('Amplitude $$(\mu m)$$')
title('A signal with two modes','interpreter','latex','fontsize',35)
legend('original signal','reconstructed signal')
axis tight
ylim(1.1*get(gca,'ylim'))
subplot(1,2,2)
plot(x,y1-y2,'-p','color','k','linewidth',3,'markersize',10)
axis tight
set(gca,'linewidth',3)
ylim(1.1*get(gca,'ylim'))
xlabel('$$x$$','interpreter','latex','fontsize',30)
ylabel('Error $$(\mu m)$$','interpreter','latex','fontsize',30)
title('Error in signal reconstruction','interpreter','latex','fontsize',35)


%%% sub plot
%%
c2 = [0.2422    0.1504    0.6603];
c1 = [245, 160, 10]./255;
subplot(4,1,2:4)
plot(x,y1,'-o','color',c1,'linewidth',3,'markersize',20)
hold all
plot(x,y2,'--o','color',c2,'linewidth',5,'markersize',8,'markerfacecolor','r')
hold off
set(gca,'linewidth',3)
xlabel('$$x$$')
ylabel('Amplitude $$(\mu m)$$')
title('A signal with two modes','interpreter','latex','fontsize',35)
legend('original signal','reconstructed signal')
axis tight
ylim(1.1*get(gca,'ylim'))
subplot(4,1,1)
plot(x,y1-y2,'-p','color','k','linewidth',3,'markersize',10)
axis tight
set(gca,'linewidth',3)
ylim(1.1*get(gca,'ylim'))
ylabel('Error $$(\mu m)$$','interpreter','latex','fontsize',30)
title('Error in signal reconstruction','interpreter','latex','fontsize',35)
set(gca,'XTickLabel',[]);