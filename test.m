function [] = test()

[x, Fe, N] = wavread('son_TP1.wav');


wavplay(echo1(x, Fe, 100, 8), Fe);