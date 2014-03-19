function [] = singletapdelay(delay_ms)

[x, Fe, N] = wavread('blo.wav');

wavplay(x, Fe);

d = ceil(delay_ms*0.001*Fe);

for i=1:d
    y(i) = x(i);
end

for i=d+1:length(x)
    y(i) = ( x(i)+ x(i-d))/2;
end


wavplay(y, Fe);