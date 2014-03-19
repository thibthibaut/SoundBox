function [] = chorus(delay_max,freq)

[x, Fe, N] = wavread('son_TP1.wav');

x=x(1:Fe*6);

%wavplay(x, Fe);

d_max = ceil(delay_max*0.001*Fe);

%On créé un oscillateur
for i=1:length(x)
oscillateur(i) = sin(2*pi*i*(freq/Fe));
end

for i=1:d_max
    y(i) = x(i);
end
    
for i=d_max+1:length(x)
    
    osc = abs(oscillateur(i));
    del = ceil(osc*delay_max);
    
    
    y(i) = (x(i) + x(i-del))/2;
end


wavplay(y, Fe);