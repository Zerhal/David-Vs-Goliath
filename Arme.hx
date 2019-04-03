import hxd.App;
import h2d.Text;
import h2d.Font;

class Arme{

    var nom : String;
    var degats : Int;
 
    public function new(nom, degats){
        this.nom = nom;
        this.degats = degats;
    }
    
    public function afficher(){
        var titre = new Text(hxd.res.DefaultFont.get());
        titre.text = "PONG";
        titre.textAlign = Center;      
    }

    public function getDegats(){
        return this.degats;
    }
 
    
}