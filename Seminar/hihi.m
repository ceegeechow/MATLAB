%%  Question 2
%   Oops partially done lolololololol
load viewdata;
viewPct = (viewdata(:, 3)./viewdata(:, 2)) / (viewdata(:, 1));

%%  Question 4
f = @(x) x.^2 - sin(x);
[xmin, ymin] = fminsearch(f, 0.5)

%%  Question 5

function viewImage (I, varargin)
    if (mod(length(varargin), 2) ~= 0)
        error('Arguments not in pairs!!')
    elseif (~isnumeric(varargin(2:2:end)))
        error('Non-numeric arguments!!')
    elseif (sum(strmatch('zoom', varargin(1:2:5))) + sum(strmatch('rotate', varargin(1:2:5))) + sum(strmatch('tilt', varargin(1:2:5))) ~= length(varargin)/2)
        error('Arguments not zoom, rotate or tilt!!')                
    end
end

%%  Question 6

numSims = 1e6;

dice = randi([1,6], 6, numSims);
diceSum = sum(dice);

histogram(diceSum);