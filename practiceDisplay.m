function practiceDisplay(neighborhood,displayStyle)
% display a neighborhood created by MakeNeighborhood
%
% INPUTS: 
%    neighborhood -- a matrix of ones and zeros (1 = peaceful, 0 = hostile)
%    displayStyle -- 1 - circles/graph
%                    2 - squares/picture
%
% OUTPUTS: none (makes a figure)

% check inputs
if nargin<1
    error('No neighborhood to display');
end
if nargin<2
    warning('No display style specified. Using circles as default');
    displayStyle = 1;
end

% check arguments
if ~isnumeric(displayStyle)
    warning('Display style must be a 1 or a 2. Using 1 as default.');
    displayStyle = 1;
end
if displayStyle ~= 1 && displayStyle ~= 2
    warning('Display style must be a 1 or a 2. Using 1 as default.');
    displayStyle = 1;
end


neighborhood = neighborhood(:, :, 1);

if displayStyle == 1
    % get the size of the neighborhood
    [nRows, nCols] = size(neighborhood);
    
    % get indices
    peacefulIdx = neighborhood == 1;
    hostileIdx = neighborhood == 0;
    
    % display the neighborhood
    %figure;
    [x,y] = meshgrid(1:nCols,1:nRows);
    plot(x(hostileIdx)-0.5,nCols-y(hostileIdx)+0.5,'ko',...
        'MarkerSize',10, ...
        'MarkerFaceColor','black');
    hold on;
    plot(x(peacefulIdx)-0.5,nCols-y(peacefulIdx)+0.5,'ko',...
        'MarkerSize',10, ...
        'MarkerFaceColor','white');
    xlim([0 nCols]);
    ylim([0 nRows]);
    grid on;
    axis square;
    
elseif displayStyle == 2
    %figure;
    imagesc(neighborhood);
    colormap gray;
    axis square;
end











