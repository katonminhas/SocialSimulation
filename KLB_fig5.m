%Katon Minhas

%Plots the results of the neighborhood simulation with
%different starting numbers of short fuse individuals
%to recreate fig. 5 from the KLB article

%rng('Shuffle');

nDays = 10;

%Plots the graph with no low threshold individuals
%Runs 189 trials
for trialNum = 1:189
  propAgg = rand;
  
  nRows = 6;
  nCols = 6;
  nSF = 0;
  
  nHood = MakeNeighborhood(nRows,nCols,nSF,propAgg);
  
  for counter = 1:10
    nHood = EvolveNeighborhood(nHood);
  end
    
  nPeaceful = sum(sum(nHood(:,:,1)));
  nHostile = (nRows * nCols) - nPeaceful;
  
  finalPropAgg = nHostile / (nRows * nCols);
   
  subplot(3, 1, 1);
  plot(propAgg, finalPropAgg, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
  
  xlim([0 1]);
  ylim([0 1]);
  
  xlabel('Initial Proportion Aggressive');
  ylabel('Final Proportion Aggressive');
  title('No Low Threshold Individuals');
  
  hold on;
  
end
  
nDays = 10;

%Plots the graph with 9 low threshold individuals
%Runs 189 trials
for trialNum = 1:189
  propAgg = rand;
  
  nRows = 6;
  nCols = 6;
  nSF = 9;
  
  nHood = MakeNeighborhood(nRows,nCols,nSF,propAgg);
  
  for counter = 1:10
    nHood = EvolveNeighborhood(nHood);
  end
    
  nPeaceful = sum(sum(nHood(:,:,1)));
  nHostile = (nRows * nCols) - nPeaceful;
  
  finalPropAgg = nHostile / (nRows * nCols);
   
  subplot(3, 1, 2);
  plot(propAgg, finalPropAgg, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
  
  xlim([0 1]);
  ylim([0 1]);
  
  xlabel('Initial Proportion Aggressive');
  ylabel('Final Proportion Aggressive');
  title('9 Low Threshold Individuals');
  
  hold on;
  
end


nDays = 10;

%Plots the graph with 18 (half) low threshold individuals
%Runs 189 trials
for trialNum = 1:189
  propAgg = rand;
  
  nRows = 6;
  nCols = 6;
  nSF = 18;
  
  nHood = MakeNeighborhood(nRows,nCols,nSF,propAgg);
  
  for counter = 1:10
    nHood = EvolveNeighborhood(nHood);
  end
    
  nPeaceful = sum(sum(nHood(:,:,1)));
  nHostile = (nRows * nCols) - nPeaceful;
  
  finalPropAgg = nHostile / (nRows * nCols);
   
  subplot(3, 1, 3);
  plot(propAgg, finalPropAgg, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
  
  xlim([0 1]);
  ylim([0 1]);
  
  xlabel('Initial Proportion Aggressive');
  ylabel('Final Proportion Aggressive');
  title('18 Threshold Individuals');
  
  hold on;
  
end

