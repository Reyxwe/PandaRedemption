unit unitPanda;

interface

uses
       GestionEcran, gestionnaire;

procedure pnjPanda (var personnage : heros);
implementation
//**********************D�but Panda************************
procedure pnjPanda (var personnage : heros);//procedure lan�ant la qu�te du panda

var
quitter: boolean; //Valeur que prend les r�ponses du joueur.
choix, choix2: integer;//Variable qui permet de quitter la boucle


begin
  quitter:=true;
  effacerEcran;
  writeln('          .--.                  ''');
  writeln('         / _  \  ___       .--.  ''');
  writeln('        | ( _.-""   `''-.,'' _ \   ');
  writeln('         \.''            ''.  )/   ');
  writeln('         /                \_.''     ');
  writeln('        /    .-.   .-.     \      ');
  writeln('        |   / o \ / o \    |      ');
  writeln('        ;   \.-''` `''-./  |      ');
  writeln('        /\      ._.       /       ');
  writeln('      ;-'';_   ,_Y_,   _.''     ');
  writeln('     /     \`--.___.--;.        ');
  writeln('    /|      ''.__.---.  \\        ');
  writeln('   ;  \              \  ;''--. .-. ');
  writeln('   |   ''.    __..-._.''  |-,.-''  / ');
  writeln('   |     `""`  .---._  / .--.  / ');
  writeln('  / ;         /      `-;/  /|_/  ');
  writeln('  \_,\       |            | |    ');
  writeln('      ''-...--''._   _..__\/     ');
  readln;
  while quitter do
    begin
      effacerEcran;
      if personnage.event.panda then
      begin
        writeln('Bonjour jeune aventurier je vous attendais, vous etes l''elu voulez');
        writeln('vous en savoir plus sur votre quete');
        writeln('1 - Vous partez en courrant') ;//choix 1
        writeln('2 - Vous lui en demandez plus'); //choix 2
        writeln('3 - Obtenir l''armure et l''arme');
        readln(choix);

        case choix of
            1: quitter:= false;
            2:begin
                writeln('Tu dois sauver l''honneur des pandas redempteurs,');
                writeln(' je suis trop vieux pour m''en occuper.');
                writeln('Une fois que tu m''auras apporter une soupe,');
                writeln('je pourrai te donner une arme et une armure te permettant de vaincre');
                writeln('le monstre qui nous menace.');
                readln;
              end;
            3 :begin
                if personnage.soupe then
		            begin
			            personnage.armure:= 5000;//on recoit l'armure donn�e par le panda
			            personnage.arme:= 500;//on recoit l'arme donn�e par le panda
			            write('Bravo petit voila ta recompense, va vite la combattre!');
                  writeln('J''ai entendu dire que cette creature rodait souvent pas loin de chez toi');
                  writeln('Tu devrais aller voir. Bonne chance!');
                  personnage.event.boss := true;//on peut combattre le boss
                  personnage.event.panda := false;//on change la rencontre avec le panda
		            end
	              else
                  write('MA SOUUUUUUUPE!!!!');
                readln;
                end;

	        end;
      end
      else
        writeln('Ne reste pas la, va te battre !!!!!');
  end;
end;

//**********************Fin Panda**************************
end.
