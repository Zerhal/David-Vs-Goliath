import hxd.Key;

class Main extends hxd.App {
    var david : Personnage;
    var goliath : Personnage;
    override function init(){
        
        var armeDavide = new Arme("Epee en bois", 10);
        // Cr�ation des personnages
        david = new Personnage("David", 100, 100, armeDavide);
        goliath = new Personnage("Golbut", 1000, 0, armeDavide);

        // Au combat !
       
        
    }
    // on each frame
    override function update(dt:Float) {

        if (Key.isReleased(Key.UP)) {               
            david.attaquer(goliath);
        }
         if (Key.isReleased(Key.DOWN)) {               
            trace("David :");
            trace(david.afficherEtat());
            trace("Goliath");
            trace(goliath.afficherEtat());
        }
        

    }
    static function main() {
        new Main();
    }
}