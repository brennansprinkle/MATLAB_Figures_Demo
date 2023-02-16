%%% make and plot data in a loop
x = linspace(-pi,pi,400); % set a grid of 400 points along the x-axis
y1 = sin(5*x) + 0.5*sin(3*x) + 0.3; % make a function of x 

for i = 1:6
    small = (2.0^(-i));
    small_random = (1+small*randn(size(x)));
    yerror = y1.*small_random + 5*small;
    plot(x,yerror)
    hold all
end
hold off


%%
%%% better plot in loop
cols = viridis(6);
cols = flipud(cols);
for i = 1:6
    small = (2.0^(-i));  % set small number based on i
    small_random = (1+small*randn(size(x))); % make a small random perturbation factor for the data
    yerror = y1.*small_random + 5*small; % randomly perturb the data and shift the data by a small number
    
    c_i = 0.95*cols(i,:); % get the i^th color from cols
    plot(x,yerror,'color',c_i,'linewidth',0.5*(6-i)+1)
    hold all
    
    leg{i} = ['$$\delta = $$' num2str(small)]
end
leg{7} = ['Exact'];
plot(x,y1,'-','color','b','linewidth',2)
hold off
title('Successive approximations of a signal')
xlabel('$$x$$')
ylabel('Amplitude $$(\mu m)$$')
axis tight
set(gca,'linewidth',3)

%%
%%% better plot in loop
cols = cool(6);
cols = flipud(cols);
for i = 1:6
    small = (2.0^(-i));  % set small number based on i
    small_random = (1+small*randn(size(x))); % make a small random perturbation factor for the data
    yerror = y1.*small_random + 5*small; % randomly perturb the data and shift the data by a small number
    
    c_i = 0.95*cols(i,:); % get the i^th color from cols
    subplot(4,1,1:2)
    plot(x,yerror,'color',c_i,'linewidth',0.5*(6-i)+1)
    hold all
    subplot(4,1,3:4)
    semilogy(x,abs(y1-yerror),'color',c_i,'linewidth',0.5*(6-i)+1)
    hold all
    leg{i} = ['$$\delta = $$' num2str(small)]
end
leg{7} = ['Exact'];
subplot(4,1,1:2)
plot(x,y1,'-','color','b','linewidth',2)
hold off
title('Successive approximations of a signal')
ylabel('Amplitude $$(\mu m)$$')
legend(leg)
axis([-pi pi -2 8])
set(gca,'linewidth',3)
subplot(4,1,3:4)
xlabel('$$x$$')
ylabel('$$Log$$(Error)')
axis tight
set(gca,'linewidth',3)
set(gca,'YMinorTick','on')
ytick=10.^(-1:1);
yticklab = cellstr(num2str(round(-log10(ytick(:))), '$$10^{-%d}$$'));
set(gca,'yTick',ytick,'yTickLabel',yticklab,'TickLabelInterpreter','latex')