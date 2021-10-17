class User {
float UserPos;
public float getUserPosX(){
return UserPos;
}
}

class Hiro extends Collision_Object {

    PImage self;
    Vector velocity;
    PImage brush;

    Hiro(float startPosX, float startPosY){
        pos = new Vector(startPosX, startPosY);
        velocity = new Vector(0, 0);
        width = (int)(60);
        height = (int)(120);
        self = loadImage("Hiro.png");
        brush = loadImage("PixelBrush.png");
    }

    void display(){
        image(self, pos.x, pos.y, width, height);
        image(brush, pos.x, pos.y, 100, 100);
    }

    void move(){
        pos.add(velocity);
    }

}
