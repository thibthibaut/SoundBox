function [] = phaser(delay_max, freq, depth)

[x, Fe, N] = wavread('son_TP1.WAV');



%wavplay(x, Fe);

d_max = ceil(delay_max*0.001*Fe);

%On créé un oscillateur
for i=1:length(x)
oscillateur(i) = sin(2*pi*i*(freq/Fe));
end

for iter=1:depth

    y(i:d_max) = x(i:d_max);

    for i=d_max+1:length(x)

        osc = abs(oscillateur(i));
        del = ceil(osc*delay_max);


        y(i) = (x(i) + x(i-del))/2;
    end

end


wavplay(y, Fe);