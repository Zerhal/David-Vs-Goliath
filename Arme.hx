class Arme{

    var nom : String;
    var degats : Int;
 
    public function new(nom, degats){
        this.nom = nom;
        this.degats = degats;
    }

    public function getNom(){
        return this.nom;
    }

    public function getDegats(){
        return this.degats;
    }
}