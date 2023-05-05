function [L, U, P] = luFactor(A)

[m, n] = size(A);
if m ~= n
    error('matrix is not a sqaure')
end
L = eye(n);
P = eye(n);
U = A;
for i = 1:m-1
     pivot = max(abs(U(i:m,i)));
     for s = i:m;
         if(abs(U(s,i))==pivot);
             ind = s;
             break;
         end;
     end;
     U([i,ind],i:m) = U([ind,i],i:m);
     L([i,ind],1:i-1) = L([ind,i],1:i-1);
     P([i,ind],:) = P([ind,i],:);
     for j = i+1:m;
         L(j,i)=U(j,i)/U(i,i);
         U(j,i:m)=U(j,i:m)-L(j,i)*U(i,i:m);
     end
end