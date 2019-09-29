%Katon Minhas


function DisplayNeighborhood(neighborhood,displayStyle)
% display a neighborhood created by MakeNeighborhood
%
% INPUTS: 
%    
%    neighborhood - a [height x width x 2] matrix of 1's and 0's where:
%                   FOR [:, :, 1]
%                   1 == peaceful, 0 == hostile
%                   FOR [:, :, 2]
%                   1 == "Short-Fuse", 0 == hostile
%
%
%    displayStyle -- 1 - circles/graph
%                    2 - squares/picture
%
% OUTPUTS: none (makes a figure)

% check inputs
if nargin < 1
    error('No neighborhood to display');
end

if nargin < 2
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


if displayStyle == 1
    % gets the size of the neighborhood
    [nRows, nCols, ~] = size(neighborhood);
        
    % display the neighborhood
    %figure;
    
    peaceNorm = zeros(nRows, nCols);
    peaceShort = zeros(nRows, nCols);
    hostileNorm = zeros(nRows, nCols);
    hostileShort = zeros(nRows, nCols);   
    
    % get indices
    for r = 1:nRows
      for c = 1:nCols
        if neighborhood(r, c, 1) == 1 && neighborhood(r, c, 2) == 1
          peaceShort(r, c) = 1;
        elseif neighborhood(r, c, 1) == 1 && neighborhood(r, c, 2) == 0
          peaceNorm(r, c) = 1;
        elseif neighborhood(r, c, 1) == 0 && neighborhood(r, c ,2) == 1
          hostileShort(r, c) = 1;
        elseif neighborhood(r, c, 1) == 0 && neighborhood(r, c, 2) == 0
          hostileNorm(r, c) = 1;
        end
      end
    end
    
    peaceShort = logical(peaceShort);
    peaceNorm = logical(peaceNorm);
    hostileShort = logical(hostileShort);
    hostileNorm = logical(hostileNorm);
    
    % display the neighborhood
    %figure;
    [x, y] = meshgrid(1:nCols,1:nRows);
    plot(x(hostileNorm) - 0.5, nCols - y(hostileNorm) + 0.5, 'ko', ...
         'MarkerSize', 10,...
         'MarkerFaceColor', 'k',...
         'MarkerEdgeColor', 'k');
    
    hold on;
    
    plot(x(hostileShort) - 0.5, nCols - y(hostileShort) + 0.5, 'ko', ...
         'MarkerSize', 10,...
         'MarkerFaceColor', 'k',...
         'MarkerEdgeColor', 'r');
     
    hold on;   
    
    plot(x(peaceNorm) - 0.5, nCols - y(peaceNorm) + 0.5, 'ko',...
         'MarkerSize', 10,...
         'MarkerFaceColor', 'w',...
         'MarkerEdgeColor', 'k');
     
    hold on;     
    
    plot(x(peaceShort) - 0.5, nCols - y(peaceShort) + 0.5, 'ko',...
         'MarkerSize', 10,...
         'MarkerFaceColor', 'w',...
         'MarkerEdgeColor', 'r');
    
    xlim([0 nCols]);
    ylim([0 nRows]);
    grid on;
    axis square;
    
    %legend('Hostile', 'Hostile, Short-Fuse', 'Peaceful', 'Peacefule, Short-Fuse');
    
    
elseif displayStyle == 2
    %figure;
    imagesc(neighborhood(:, :, 1));
    colormap gray;
    axis square;
end
