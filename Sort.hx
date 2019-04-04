class Sort{

    var nom : String;
    var degats : Int;
    var manaCost : Int;
 
    public function new(nom, degats, manaCost){
        this.nom = nom;
        this.degats = degats;
        this.manaCost = manaCost;
    }
    
    public function getNom(){
        return this.nom;
    }

    public function getDegats(){
        return this.degats;
    }

    public function getManaCost(){
        return this.manaCost;
    }
}