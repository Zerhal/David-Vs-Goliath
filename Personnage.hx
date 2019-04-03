import Arme;
class Personnage{
    var nom : String;
    var vie : Int;
    var mana : Int;
    var arme : Arme;

    public function new(nom : String, vie : Int, mana : Int, arme : Arme){
        this.nom = nom;
        this.vie = vie;
        this.mana = mana;
        this.arme = arme;
    }

    public function recevoirDegats(nbDegats : Int){
        vie -= nbDegats;
        //On enlève le nombre de dégâts reçus à la vie du personnage

        if (vie < 0) //Pour éviter d'avoir une vie négative
        {
            vie = 0; //On met la vie à 0 (cela veut dire mort)
        }
    }

    public function attaquer(cible : Personnage){
        cible.recevoirDegats(arme.getDegats());
    }

    public function changerArme(nomNouvelleArme : String, degatsNouvelleArme : Int){
       this.arme = new Arme(nomNouvelleArme, degatsNouvelleArme);
    }

    public function estVivant(){
        return vie > 0;
    }

    
    public function afficherEtat(){
        return (this.vie);      
    }
}