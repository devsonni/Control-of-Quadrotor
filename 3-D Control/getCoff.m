function [coff, A, b] = getCoff(waypoints)

n = size(waypoints,2)-1; % number of segments P1..n
A = zeros(8*n, 8*n);
b = zeros(1,8*n);

for i=1:n
  b(1,i) = waypoints(i);
end

for i=n+1:2*n
  b(1,i) = waypoints(i-3);
end

row = 1;
% Constrain 1) Pi(0) = Wi for all i=1..n
for i=1:n
  A(row,(8*(i-1))+1:8*i) = polyT(8,0,0);
  row = row + 1;
end

% Constrain 2) Pi(1) = Wi+1 for all i=1..n
for i=n+1:2*n
  A(row,(8*(i-5))+1:8*(i-4)) = polyT(8,0,1);
  row = row + 1;
end

% Constrain 3) P1(k)(0)= 0 for all 1<=k<=3
A(9,1:8) = polyT(8,1,0);
A(10,1:8) = polyT(8,2,0);
A(11,1:8) = polyT(8,3,0);

% Constrain 4) Pn(k)(1) = 0 for all 1<=k<=3
A(12,1:8) = polyT(8,1,1);
A(13,1:8) = polyT(8,2,1);
A(14,1:8) = polyT(8,3,1);

% Constrain 5) Pi-1(k)(1) = Pi(k)(0) for all i=2..n and for all k=1..6
A(15, 1:16) = [polyT(8,1,1) -polyT(8,1,0)];
A(16, 9:24) = [polyT(8,1,1) -polyT(8,1,0)];
A(17, 17:32) = [polyT(8,1,1) -polyT(8,1,0)];

A(18, 1:16) = [ polyT(8,2,1) -polyT(8,2,0)];
A(19, 9:24) = [ polyT(8,2,1) -polyT(8,2,0)];
A(20, 17:32) = [ polyT(8,2,1) -polyT(8,2,0)];

A(21, 1:16) = [ polyT(8,3,1) -polyT(8,3,0)];
A(22, 9:24) = [ polyT(8,3,1) -polyT(8,3,0)];
A(23, 17:32) = [ polyT(8,3,1) -polyT(8,3,0)];

A(24, 1:16) = [ polyT(8,4,1) -polyT(8,4,0)];
A(25, 9:24) = [ polyT(8,4,1) -polyT(8,4,0)];
A(26, 17:32) = [ polyT(8,4,1) -polyT(8,4,0)];

A(27, 1:16) = [ polyT(8,5,1) -polyT(8,5,0)];
A(28, 9:24) = [ polyT(8,5,1) -polyT(8,5,0)];
A(29, 17:32) = [ polyT(8,5,1) -polyT(8,5,0)];

A(30, 1:16) = [ polyT(8,6,1) -polyT(8,6,0)];
A(31, 9:24) = [ polyT(8,6,1) -polyT(8,6,0)];
A(32, 17:32) = [ polyT(8,6,1) -polyT(8,6,0)];

coff = A\b';
end