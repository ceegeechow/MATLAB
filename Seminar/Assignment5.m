%Camille Chow
%MATLAB Section A
%Assignment 5

%Instatiating a cell array of 4000 kickstarter projects using for loops:

kicks = cell(4000,1);
cities = cell(4000,1);
states = cell(4000,1);
for i = 1:4000
    C = strsplit(location{i},', ');
    if length(C) > 2
        C;
        cities(i) = strcat(C(1),',',C(2));
        states(i) = C(end);
    else
        cities(i) = C(1);
        states(i) = C(2);
    end
end
for j = 1:4000
    a = kickstarter;
    a.amtpledged = amtpledged(j);
    a.by = by{j};
    a.category = category{j};
    a.currency = currency{j};
    a.goal = goal(j);
    a.city = cities{j};
    a.state = states{j};
    a.numbackers = numbackers(j);
    a.pledgetier = struct('pledge', str2num(pledgetier{j}), 'num_backers', str2num(numbackerstier{j}));
    a.title = title1{j};
    a.url = url{j};
    kicks{j} = a;
end
