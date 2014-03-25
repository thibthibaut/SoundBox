function [] = pitchshifter(demi_tons)

[x, Fe, N] = wavread('son_TP1.WAV');
x = x(1:Fe*5);

facteur = 2^(demi_tons/12); %coefficient de stretching de x

longy = ceil(facteur*length(x)); %Longueur du nouveau y

%Découpage de x en petits bouts :
numberofSlices = floor((length(x)-1024)/256) %1024 correspond à la taille(en samples) du morceau
                                             %256 pour que les morceaux se
                                             %recouvrent à 75%
%on fait une troncature
x = x(1:numberofSlices*256+1024);

%on créé une matrice qui va contenir les morceaux
matrice = zeros(floor(length(x)/256),1024);

%Remplissage de la matrice
for i = 1:numberofSlices 
    deb= (i-1)*256 + 1; 
    fin = (i-1)*256 + 1024; 
    matrice(i,:) = x(deb:fin); 
end 


%%TRAITEMENT
%%%% A FAIRE

taille = size(matrice);
%output = zeros(taille(1)*256 - 256+taille(2), 1);
output = zeros(longy+1024, 1);

timeIndex = 1; 

%On réajoute les morceaux
for index=1:taille(1) 

    output(timeIndex:timeIndex+1024-1) = output(timeIndex:timeIndex+1024-1) + matrice(index,:)'; 

    timeIndex = timeIndex + round(facteur*256); 

end 


%o

y = interp1(1:length(output), output, linspace(1,length(output),length(x)));
%On étire x avec un coeff "facteur" en utilisant une interpolation linéaire
%y = interp1(1:length(x), x, linspace(1,length(x),longy));
wavplay(x, Fe);
wavplay(output, Fe*facteur);
wavplay(y, Fe);