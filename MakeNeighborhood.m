%Katon Minhas

function neighborhood = MakeNeighborhood(height,width,shortFuse,propAgg)
% create a "neighborhood" -- matrix of ones and zeros
%
% INPUTS: 
%    height    - a natural number (number of rows in neighborhood)
%    width     - a natural number (number of cols in neighborhood)
%    shortFuse - a natural number (number of "Short-Fuse" elements in the neighborhood)
%    propAgg   - a decimal between 0 and 1 (proportion of initial hostile elements)
% OUTPUT:
%    neighborhood - a [height x width x 2] matrix of 1's and 0's where:
%                   FOR [:, :, 1]
%                   1 == peaceful, 0 == hostile
%                   FOR [:, :, 2]
%                   1 == "Short-Fuse", 0 == hostile


% check inputs
if nargin < 4
    warning('Not enough inputs (dimensions) provided for neighborhood. Using default values of 6x6, with 6 low threshold, 50% initially aggressive.');
    height = 6;
    width = 6;
    shortFuse = 6;
    propAgg = 0.5;
end

% check input type
if ~isnumeric(height) || ~isnumeric(width) || ~isnumeric(shortFuse)
    error('All inputs must be numbers');
end

% check to see if input dimensions were positive numbers
if height < 1 || width < 1
    warning('Provided non-natural number as input. Using default 6x6');
    height = 6;
    width = 6;
end

% check to see if input dimensions are whole numbers
% if round(height) ~= height || round(width) ~= width
if rem(height,1)~=0 || rem(width,1)~=0 || rem(shortFuse, 1) ~= 0
    warning('Dimensions and number of low threshold must be whole numbers. Rounding them.');
    height = round(height);
    width = round(width);
    shortFuse = round(shortFuse);
end 
%Check to see if there are too many short fuse individuals
if shortFuse > (height * width)
  warning('Number of low threshold entered higher than number of elements. Using default as 6');
  shortFuse = 6;
end

%checks to see if proportion hostile is a decimal
if rem(propAgg, 1) == 0
  warning('Proportion aggressive is not a decimal. Using default 0.5');
  propAgg = 0.5;
end
%Checks to see if proportion hostile is between 0 and 1
if propAgg < 0 || propAgg > 1
  warning('Proportion aggressive must be between 0 and 1. Using default 0.5');
  propAgg = 0.5;
end

% assign half of people to be hostile/peaceful
nPeeps = height * width;
propPeeps = round(propAgg * nPeeps);
randIdx = randperm(nPeeps);
peacefulIdx = randIdx(propPeeps+1:end);

% assigns the indicated num of people to be "Short Fuse"
randSFIdx = randperm(nPeeps);
shortFuseIdx = randSFIdx(1:shortFuse);

% make a neighborhood array
peaceHostileNeighborhood = zeros(height, width);
SFNormNeighborhood = zeros(height, width);

peaceHostileNeighborhood(peacefulIdx) = 1;    %Assigns the peaceful indices as 1
SFNormNeighborhood(shortFuseIdx) = 1;         %Assigns the shortFuse indices as 1

neighborhood = cat(3, peaceHostileNeighborhood, SFNormNeighborhood);     %Constructs neighborhood as [HxWx2]
