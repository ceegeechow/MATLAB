%Camille Chow
%MATLAB Section A
%Assignment 5

classdef kickstarter
    properties
        amtpledged
        by
        category
        currency
        goal
        city
        state
        numbackers
        pledgetier
        title
        url
    end
    methods
        function plotTiers(obj)
            a = obj.pledgetier.pledge;
            b = obj.pledgetier.num_backers;
            pledges = [];
            backers = [];
            for i = 1:length(a)
                j = find([pledges == a(i)]);
                if isempty(j)
                    pledges = [pledges a(i)];
                    backers = [backers b(i)];
                else
                    backers(j(1)) = backers(j(1)) + b(i);
                end
            end
            bar(pledges,backers)
            title(['Number of backers per pledge for ' obj.title])
        end
        function obj = convertCurrency(obj,c)
            currencies = ['usd','gbp','eur','cad'];
            conversions = [1,.8,.95,1.31];
            i = (strfind(currencies, obj.currency) - 1)/3 + 1;
            j = (strfind(currencies, c) - 1)/3 + 1;
            obj.currency = c;
            conv_rate = conversions(j)/conversions(i);
            obj.amtpledged = conv_rate*obj.amtpledged;
            obj.goal = conv_rate*obj.goal;
            obj.pledgetier.pledge = conv_rate*obj.pledgetier.pledge;
        end
    end
end
