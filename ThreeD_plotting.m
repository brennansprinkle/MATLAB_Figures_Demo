%%% Generate data
[X,Y,Z] = peaks(50);

%%% Basic surface plot with defaults
surf(X,Y,Z)

%%% Show the problems with the mesh
%%
%%% Generate fine data
[X,Y,Z] = peaks(500);
%%% Basic surface plot with defaults
surf(X,Y,Z)

%%% partial solution
%%
%%% Generate fine data
[X,Y,Z] = peaks(500);
%%% Basic surface plot with defaults
handl = surf(X,Y,Z);
set(handl,'edgecolor','none')


%%% add some depth
%%
%%% Generate fine data
[X,Y,Z] = peaks(500);
%%% Basic surface plot with defaults
handl = surf(X,Y,Z);
set(handl,'edgecolor','none')
camlight


%%% same information in 2D
%%
%%% Generate fine data
[X,Y,Z] = peaks(500);
%%% Basic surface plot with defaults
handl = pcolor(X,Y,Z);
set(handl,'edgecolor','none')
colorbar


%%% same information in 2D
%%
%%% Generate fine data
[X,Y,Z] = peaks(500);
%%% Basic surface plot with defaults
handl = contourf(X,Y,Z,40);
%set(handl,'edgecolor','none')
colorbar

%%% making it worse
%%
colormap('jet')
%%% Generate fine data
[X,Y,Z] = peaks(500);
%%% Basic surface plot with defaults
handl = contourf(X,Y,Z,40);
%set(handl,'edgecolor','none')
colorbar


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Picking a colormap to show depth
I = imread('disparity.png');
imshow(I)
%%% Convert image to grayscale data
G = im2double(I); %


%%
clf
%%% check distance colormap (Jet)
ax1 = subplot(12,1,1:4);
imagesc(G)
colorbar
ax2 = subplot(12,1,5:8);
imagesc(G)
colorbar
ax3 = subplot(12,1,9:12);
imagesc(G)
colorbar

cmap = cool(256); %try jet, hsv, cool, parula
blindMap = CBlindDeutan(cmap); %CBlindCmap(cmap,1);
graymap = 0*cmap + mean(cmap,2);


colormap(ax1,cmap)
colormap(ax2,blindMap)
colormap(ax3,graymap)



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clf
%%%% Picking a colormap to show depth
% I = imread('gdisparity.png');
I = imread('fountain.jpg');
imshow(I)
%%% Convert image to grayscale data
G = im2double(I); %G = (double(rgb2gray(I))./255); %

%%
%%% check distance colormap
ax1 = subplot(1,12,1:4);
imagesc(G)
cb1 = colorbar;
cb1.Ticks=[];
set(gca,'xtick',[])
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'ytick',[])
set(gca,'yticklabel',[])
ax2 = subplot(1,12,5:8);
imagesc(G)
cb2 = colorbar;
cb2.Ticks=[];
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'ytick',[])
set(gca,'yticklabel',[])
ax3 = subplot(1,12,9:12);
imagesc(G)
colorbar
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'ytick',[])
set(gca,'yticklabel',[])


cmap = viridis(256);
blindMap = CBlindDeutan(cmap); %CBlindCmap(cmap,1);
graymap = 0*cmap + mean(cmap,2);


colormap(ax1,cmap)
colormap(ax2,blindMap)
colormap(ax3,graymap)




function outMap = CBlindDeutan(cmap)
    mat_1 = [0.36198, 0.86755, -0.22953;
            0.26099, 0.64512, 0.09389;
           -0.01975, 0.02686, 0.99289];
       
    mat_2 = [0.37009, 0.88540, -0.25549;
            0.25767, 0.63782, 0.10451;
           -0.01950, 0.02741, 0.99209];
       
    normal = [ -0.00293; -0.00645; 0.00938 ];
       
%     mat_1 = [0.14510, 1.20165, -0.34675;
%             0.10447, 0.85316, 0.04237;
%             0.00429, -0.00603, 1.00174];
%         
%     mat_2 = [0.14115, 1.16782, -0.30897;
%             0.10495, 0.85730, 0.03776;
%             0.00431, -0.00586, 1.00155];
%     
%     normal = [0.00048; 0.00416; -0.00464 ];  

    
    %%% forward gamma correction
    gamma = cmap;
    mask = gamma < 0.04045;
    gamma(mask) = gamma(mask)/12.92;
    gamma(~mask) = ((gamma(~mask) + 0.055)./1.055).^(2.4);
    
    
    dot_with_normal = gamma*normal;
    for i = 1:length(gamma)
       if dot_with_normal(i) >= 0
           gamma(i,:) = (mat_1*gamma(i,:)')';
       else
           gamma(i,:) = (mat_2*gamma(i,:)')';
       end
       for k = 1:3
           v = gamma(i,k);
           if v <= 0 
              gamma(i,k) = 0;
           elseif v >= 1.0
              gamma(i,k) = 255.0;
           elseif v < 0.0031308
              gamma(i,k) = 0.5 + (v * 12.92 * 255);
           else
              gamma(i,k) = 255*(1.055*v^(1.0/2.4) - 0.055);
           end
       end
           
    end
      
    %%% inverse gamma correction
    outMap = gamma;
    outMap = outMap./255.0;
end

