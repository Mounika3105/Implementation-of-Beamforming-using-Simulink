m=tcpip("localhost",4000,'NetworkRole','server');
fopen(m);
data=fread(m,10);
