function result=LSCN(matrix)
[row,column] = size(matrix);
f=0.2; alpha_b=3; deta=1/255; l=1; h=0.001; iteration=200;
S = abs(matrix);
W = [0.04 0.04 0.04;
     0.04 1    0.04;
     0.04 0.04 0.04];
N = row * column;
U = zeros(row,column);
E = 1 + U;
Y = U;
L1 = U;
YY = Y;
n = 0;
sumY =0;
while sumY < N
    
    L1 = l * L1 + conv2(Y,W,'same');
    U = f * U + S .* ( 1 + alpha_b .* L1);
    E = E - deta + h * Y;
    Y = im2double(U > E);
    YY = double(YY | Y) ;
    sumY = sum(sum(YY));
    n = n +1 ;
end
disp(n)
result = L1;
end

