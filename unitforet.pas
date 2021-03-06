﻿unit Unitforet;

interface

uses
    gestionnaire,GestionEcran,unitMarchand,unitBamboo,unitVillage;


procedure foret(var personnage : heros); //procédure de la forêt
function recoltbois(personnage : heros): Integer;  //fonction de recolte de bois




implementation

//**************************DEBUT FORET****************************************
procedure foret(var personnage : heros ); //procédure de la forêt avec personnage en variable de référence



var
choix : Integer;  //variable numérique de type entier contenant le choix de l'utilisateur
quitter : Boolean; //variable de type boolean contenant la sortie de la procédure
  prob : integer;
  choix3 : integer;



begin
	quitter := true; //initialisation de la sortie sur vrai
  writeln('Vous entrez dans la foret. Elle est dense et de gigantesques arbres la peuplent, sur votre droite vous apercevez un marchand.'); //Affichage d'une phrase de début
  readln;
	while quitter do //début de boucle tant que quitter n'a pas la valeur fausse
	begin
    effacerEcran;  //effacer l'écran pour afficher un autre
    writeln('Stock de bois : ',personnage.bois); //afficher le stock de bois du personnage
		writeln('Que voulez-vous faire?'); //on demande ce que veut faire le joueur
		writeln('1 - Recolter du bois');  //choix 1 recolter du bois
		writeln('2 - Voir si le marchand est la?'); //choix 2 parler au marchand
    writeln('3 - S''enfoncer dans la foret');  //choix 3 s'enfoncer dans la foret
		writeln('4 - Sortir de la foret'); //choix 4 sortir de la forêt
		readln(choix);
		case choix of
			1 : personnage.bois := personnage.bois + recoltBois(personnage); //ajout au stock de bois du personnage la fonction recoltBois()
			2 : Begin
            prob:=0;   //initialisation de prob a 0
            randomize; //appel de randomize
            prob:= random(100);  //on donne a prob une valeur aléatoire jusqu'a 100
            if prob>=90 then
              marchand(personnage, upmarchand) //faire appel a la procédure marchand
            else
            begin
              writeln('Le marchand n''est pas la...');
              readln;
            end;
            End;
      3: begin
          writeln('Plusieurs chemins s''offrent a vous, lequel choisissez?');
          writeln('1 - Vers un village plein de mysteres');
          writeln('2 - Vers une densite plus importante');
          readln(choix3);
          case choix3 of
              1 :  foretMojo(personnage);
              2 :  foretBamboo(personnage);
          end;

          end;


			4 : quitter := false; //choix 3 partir(avec son TARDIS?)
		end;

	end;
end;

//**************************FIN FORET******************************************
//**************************DEBUT RECOLTBOIS***********************************
function recoltBois(personnage : heros): Integer; //fonction pour la récolte du bois

begin
  if personnage.hache then
  begin
	  randomize;
	  recoltBois := (random(2)+5);
  end
  else
  begin
    randomize; //appel de randomize
    recoltBois := (random(2)+1); //renvoie 1 ou 2
  end;

end;

//**************************FIN RECOLTBOIS*************************************
end.


