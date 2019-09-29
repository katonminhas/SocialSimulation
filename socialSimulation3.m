clear; close all;
%rng('Shuffle');

% define neighborhood dimensions
nRows = 6;
nCols = 6;
nSF = 4;
% number of days to evolve neighborhood:
nDays = 10;

% make the initial neighborhood
neighborhood = MakeNeighborhood(nRows,nCols,nSF);

% display initial settings / day 1:
figure;
subplot(ceil(sqrt(nDays)),ceil(sqrt(nDays)),1);
DisplayNeighborhood(neighborhood,1);
title('Day 1');


% evolve neighborhood for some number of days starting on day 2
for days = 2:nDays
    neighborhood = EvolveNeighborhood(neighborhood);
    subplot(ceil(sqrt(nDays)),ceil(sqrt(nDays)),days);
    DisplayNeighborhood(neighborhood,1);
    title(['Day ' num2str(days)]);
end













