function [T] = polyT(n,k,t)
%n is the polynom number of coefficients, k is the requested derivative and
%t is the actual value of t (this can be anything, not just 0 or 1).
T = zeros(n,1);
D = zeros(n,1);
%Init:
for i=1:n
D(i) = i-1;
T(i) = 1;
end
%Derivative:
for j=1:k
    for i=1:n
        T(i) = T(i) * D(i);

        if D(i) > 0
            D(i) = D(i) - 1;
        end
    end
end
%put t value
for i=1:n
T(i) = T(i) * t^D(i);
end
T = T';
end