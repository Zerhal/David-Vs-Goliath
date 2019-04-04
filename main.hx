import h2d.Text;
import hxd.Key;

class Main extends hxd.App {
    var david : Personnage;
    var goliath : Personnage;
    var temps : Int;
    var vieGoliath : Int;
    var epeeEnBois : Arme;
    var font : h2d.Font;
    var davidNom : Text;
    var davidMana : Text;
    var davidArme : Text;
    var davidSort1 : Text;
    var davidSort2 : Text;
    var davidSort3 : Text;
    var goliathInfo : Text;
    override function init(){
        
        font = hxd.res.DefaultFont.get();        
        vieGoliath = 1000;
        
        // Titre
        var titre = new h2d.Text(font);
        titre.text = "David vs Golbut";
        titre.textAlign = Center;
        titre.x = s2d.width * 0.5;
        titre.y = s2d.height * 0.1;
        s2d.addChild(titre);

        var commande = new h2d.Text(font);
        commande.text = "Ce joue avec les fleche directionnelle : haut : arme / bas : sort 1 / gauche : sort 2 / droite : sort 3";
        commande.textAlign = Center;
        commande.x = s2d.width * 0.5;
        commande.y = s2d.height * 0.3;
        s2d.addChild(commande);

        //Creation des armes
        epeeEnBois = new Arme("Epee en bois", 10);
        var epeeEnMetal = new Arme("Epee en Metal", 50);
        var grandeHacheLegendaire = new Arme("Grande Hache Legandaire", 5000);

        // Creation des sorts
        var bouleDeFeu = new Sort("Boule de Feu", 100, 25);
        var eclaireDeGivre = new Sort("Eclaire de Givre", 500, 50);
        var blackHole = new Sort ("Black Hole", 10000000, 100);

        // Création des personnages
        david = new Personnage("David", 100, 100, epeeEnBois);
        goliath = new Personnage("Golbut", vieGoliath, 0, epeeEnBois);

        david.addSort(bouleDeFeu);
        david.addSort(eclaireDeGivre);
        david.addSort(blackHole);

        david.addArme(epeeEnBois);
        david.addArme(epeeEnMetal);
        david.addArme(grandeHacheLegendaire);

        // Info David
        davidNom = new h2d.Text(font);
        davidNom.text = david.getNom();
        davidNom.textAlign = Center;
        davidNom.x = s2d.width * 0.2;
        davidNom.y = s2d.height * 0.6;
        s2d.addChild(davidNom);

        davidMana = new h2d.Text(font);
        davidMana.text = " |  Mana : " + david.getManaActuelle() + "/" +  david.getMana();
        davidMana.textAlign = Center;
        davidMana.x = s2d.width * 0.2;
        davidMana.y = s2d.height * 0.65;
        s2d.addChild(davidMana);

        davidArme = new h2d.Text(font);
        davidArme.text = " | Nom Arme Actuelle :  " + david.getArmeActuelle().getNom() + " | Deguat Arme Actuelle :  " + david.getArmeActuelle().getDegats();
        davidArme.textAlign = Center;
        davidArme.x = s2d.width * 0.2;
        davidArme.y = s2d.height * 0.7;
        s2d.addChild(davidArme);

        davidSort1 = new h2d.Text(font);
        davidSort1.text = " | Nom Sort 1 : " + david.getSorts(0).getNom() + " | Degat Sort 1 : " + david.getSorts(0).getDegats() + " | Mana Cost Sort 1 : " + david.getSorts(0).getManaCost();
        davidSort1.textAlign = Center;
        davidSort1.x = s2d.width * 0.2;
        davidSort1.y = s2d.height * 0.75;
        s2d.addChild(davidSort1);

        davidSort2 = new h2d.Text(font);
        davidSort2.text = " | Nom Sort 2 : " + david.getSorts(1).getNom() + " | Degat Sort 2 : " + david.getSorts(1).getDegats() + " | Mana Cost Sort 2 : " + david.getSorts(1).getManaCost();
        davidSort2.textAlign = Center;
        davidSort2.x = s2d.width * 0.2;
        davidSort2.y = s2d.height * 0.8;
        s2d.addChild(davidSort2);

        davidSort3 = new h2d.Text(font);
        davidSort3.text =  " | Nom Sort 3 : " + david.getSorts(2).getNom() + " | Degat Sort 3 : " + david.getSorts(2).getDegats() + " | Mana Cost Sort 3 : " + david.getSorts(2).getManaCost();
        davidSort3.textAlign = Center;
        davidSort3.x = s2d.width * 0.2;
        davidSort3.y = s2d.height * 0.85;
        s2d.addChild(davidSort3);


        // Info Goliath
        goliathInfo = new h2d.Text(font);
        goliathInfo.text = goliath.getNom() + " | Vie : " + goliath.getVie();
        goliathInfo.textAlign = Center;
        goliathInfo.x = s2d.width * 0.7;
        goliathInfo.y = s2d.height * 0.7;
        s2d.addChild(goliathInfo);
    }
    // on each frame
    override function update(dt:Float) { 
        if(goliath.getVie() <= 0){
            vieGoliath = vieGoliath*2;
            goliath = new Personnage("Golbut", vieGoliath, 0, epeeEnBois);
        }       
        if (Key.isReleased(Key.UP)) {               
            david.attaquer(goliath);
        }
        else if (Key.isReleased(Key.DOWN)) {
            if(david.getManaActuelle() - david.getSorts(0).getManaCost() >= 0){
                david.spellCast(goliath,david.getSorts(0));
            }            
        }
        else if (Key.isReleased(Key.LEFT)) {
            if(david.getManaActuelle() - david.getSorts(1).getManaCost() >= 0){           
                david.spellCast(goliath,david.getSorts(1));
            }
        }
        else if (Key.isReleased(Key.RIGHT)) {    
            if(david.getManaActuelle() - david.getSorts(2).getManaCost() >= 0){           
                david.spellCast(goliath,david.getSorts(2));
            }
        }
        if(david.getManaActuelle() < david.getMana()){
            david.manaRegen(1/120);
        }

        davidNom.text = david.getNom();
        davidMana.text = " |  Mana : " + david.getManaActuelle() + "/" +  david.getMana();
        davidArme.text = " | Nom Arme Actuelle :  " + david.getArmeActuelle().getNom() + " | Deguat Arme Actuelle :  " + david.getArmeActuelle().getDegats();
        davidSort1.text = " | Nom Sort 1 : " + david.getSorts(0).getNom() + " | Degat Sort 1 : " + david.getSorts(0).getDegats() + " | Mana Cost Sort 1 : " + david.getSorts(0).getManaCost();
        davidSort2.text = " | Nom Sort 2 : " + david.getSorts(1).getNom() + " | Degat Sort 2 : " + david.getSorts(1).getDegats() + " | Mana Cost Sort 2 : " + david.getSorts(1).getManaCost();
        davidSort3.text = " | Nom Sort 3 : " + david.getSorts(2).getNom() + " | Degat Sort 3 : " + david.getSorts(2).getDegats() + " | Mana Cost Sort 3 : " + david.getSorts(2).getManaCost();
        goliathInfo.text = goliath.getNom() + " | Vie : " + goliath.getVie();
    }
    static function main() {
        new Main();
    }
}