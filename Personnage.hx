import Arme;
import Sort;

class Personnage{
    var nom : String;
    var vie : Int;
    var mana : Int;
    var manaActuelle : Float;
    var armeActuelle : Arme;
    var armes : Array<Arme>;
    var sorts : Array<Sort>;

    public function new(nom : String, vie : Int, mana : Int, armeActuelle : Arme){
        this.nom = nom;
        this.vie = vie;
        this.mana = mana;
        this.manaActuelle = mana;
        this.armeActuelle = armeActuelle;
        this.sorts = new Array();
        this.armes = new Array();
        this.armes.push(armeActuelle);
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
        cible.recevoirDegats(getArmeActuelle().getDegats());
    }

    public function spellCast(cible : Personnage, sort : Sort){
        cible.recevoirDegats(sort.getDegats());
        this.manaActuelle -= sort.getManaCost();
    }

    public function changerArme(nomNouvelleArme : String, degatsNouvelleArme : Int){
       this.armeActuelle = new Arme(nomNouvelleArme, degatsNouvelleArme);
    }

    public function estVivant(){
        return vie > 0;
    }
    
    public function getNom(){
        return this.nom;      
    }
    
    public function getVie(){
        return this.vie;      
    }
    
    public function getMana(){
        return this.mana;      
    }

    public function getManaActuelle(){
        return Math.round(this.manaActuelle);      
    }
    
    public function getArmeActuelle(){
        return this.armeActuelle;      
    }

    public function getArmes(){
        return this.armes;      
    }

    public function getSorts(i : Int){
        return this.sorts[i];      
    }

    public function addSort(sort){
        this.sorts.push(sort) ;      
    }

    public function addArme(arme){
        this.armes.push(arme) ;      
    }

    public function manaRegen(i : Float){
        this.manaActuelle += i;
    }
}