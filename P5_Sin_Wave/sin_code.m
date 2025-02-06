a=linspace(0,359,256);
b=sind(a);
b=b+1;
b=b*127.5;
c=int16(b);
dlmwrite('sin-code.txt',c)
plot(c)