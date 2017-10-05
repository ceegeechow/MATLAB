%%Question 5

function viewImage (I, varargin)
    if (mod(length(varargin), 2) ~= 0)
        error('Arguments not in pairs!!')
    elseif (~isnumeric(varargin(2:2:end)))
        error('Non-numeric arguments!!')
    elseif (sum(strmatch('zoom', varargin(1:2:5))) + sum(strmatch('rotate', varargin(1:2:5))) + sum(strmatch('tilt', varargin(1:2:5))) ~= length(varargin)/2)
        error('Arguments not zoom, rotate or tilt!!')                
    end
end