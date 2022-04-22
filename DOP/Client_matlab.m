m=tcpip("localhost",4000,'NetworkRole','client');
fopen(m);
k=0;
N=input('');
for i=1:N
    k=k+i;
end
fwrite(m,k);