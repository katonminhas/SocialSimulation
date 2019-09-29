%Katon Minhas

function newNeighborhood = EvolveNeighborhood(neighborhood)

% get the size of the neighborhood
[nRows, nCols, depth] = size(neighborhood);

newNeighborhood = nan(nRows,nCols,2);

% step through every row and column of the neighborhood one at a time
for r = 1:nRows
    for c = 1:nCols
        % define a local 3x3 neighborhood within which we will count the
        % number of peaceful (1s) individuals. Do something cute so that if
        % we are looking at the edge of the neighborhood, we are not out of
        % bounds. For example, if we are in the upper-left corner of the
        % neighborhood, that element only has 3 neighbors, but an element
        % in the middle of the neighborhood has 8.
        
        local = neighborhood(max([r-1,1]):min([r+1,nRows]), ...
            max([c-1,1]):min([c+1,nCols]), 1);
        
        nLocalNeighbors = numel(local)-1; % exclude middle element
        
        nPeaceful = sum(sum(local))-neighborhood(r,c,1);
        nHostile = nLocalNeighbors - nPeaceful;
        
        % change the value of the point we are looking at
        % (neighborhood(r,c)) based on number of peaceful or hostile
        % neighbors:
        
        %if the middle element is normal
        if neighborhood(r, c, 2) == 0
        
          if nPeaceful > nLocalNeighbors/2
              newNeighborhood(r,c,1) = 1;
          elseif nPeaceful < nLocalNeighbors/2
              newNeighborhood(r,c,1) = 0;
          else % equal number of hostile and peaceful
              newNeighborhood(r,c,1) = neighborhood(r,c);
          end
        newNeighborhood(r, c, 2) = 0;
        %if the middle element is short fuse
        elseif neighborhood(r, c, 2) == 1
          if nHostile > 0
            newNeighborhood(r,c,1) = 0;
          else
            newNeighborhood(r,c,1) = 1;
          end
        newNeighborhood(r,c,2) = 1;
        end    
    end
end
