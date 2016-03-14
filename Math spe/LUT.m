clear

% -------------------------
% Paramètres
alpha = 0.1;
nbPoints = 1000;

pasCalcul = (pi/2) / (nbPoints + 1);
%
% -------------------------

% Selection du quadrant [0; pi/2[

alpha = rem (alpha, 2*pi); % alpha compris entre -2pi et 2pi

if ( alpha < 0 )
    alpha = alpha + 2*pi
end
% maintenant tous les alpha sont compris entre 0 et 2pi
delta_alpha     = 0 ; % correction de la rotation su premier quadrant == INIT
delta_alha_cos  = 1 ;
delta_alha_sin  = 0 ;

if ( ( alpha >= pi/2 ) && ( alpha < pi ) ) % 2eme quadrant
    delta_alpha     = -pi / 2 ; 
    delta_alha_cos  = 0 ;
    delta_alha_sin  = -1 ;
elseif ( (alpha >= pi ) && ( alpha < 3*pi/2 ) ) % 3eme quadrant
    delta_alpha     = -pi ; 
    delta_alha_cos  = -1 ;
    delta_alha_sin  = 0 ;
elseif ( alpha >= 3*pi/2 ) % eme quadrant    
    delta_alpha     = -3*pi/2 ; 
    delta_alha_cos  = 0 ;
    delta_alha_sin  = 1 ;
end

alpha = alpha + delta_alpha ;
% -------------------------

% -------------------------
% Création & Remplissage de la table
Table = [0 sin(0)];

index = pasCalcul;
while index <= pi/2
    Table = [Table; index sin(index)];
    index = index + pasCalcul;  
end
% -------------------------

% -------------------------
% Recherche de l'angle le plus pres de alpha dans la table
index = 0;
sleep = 1;
alphaTable = 0;
valeurTable = 0;
i = 1;


while index <= pi/2 && sleep == 1
    if (alpha < index + pasCalcul) && (alpha > index - pasCalcul);
        sleep = 0;
        alphaTable = Table(i, 1);
        valeurTable = Table(i, 2);
       
    end
        
    index = index + pasCalcul;
    i = i + 1;
end
% -------------------------

% -------------------------
% On sort calcul la valeur du sinus en fonction du cadran initial
% 2eme cadran > le sinus reste le meme
% 3eme cadran > le sinus est inversé
% 4eme cadran > le sinus est inversé



alpha = alpha - delta_alpha ;

if ( ( alpha >= pi/2 ) && ( alpha < pi ) ) % 2eme quadrant
    valeurTable = valeurTable;
elseif ( (alpha >= pi ) && ( alpha < 3*pi/2 ) ) % 3eme quadrant
    valeurTable = - valeurTable;
elseif ( alpha >= 3*pi/2 ) % eme quadrant    
    valeurTable = - valeurTable;
end
% -------------------------


alpha
alphaTable
valeurTable


