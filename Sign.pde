class Sign extends Collision_Object {
    PImage SignImage;

    Sign(PImage image, float posX2, float posY2){
        // we expect the image provided will be 100x100
        SignImage = image;
        width = 100;
        height = 100;
        pos = new Vector(posX2, posY2);
    }

    void display(){
        image(SignImage, pos.x, pos.y, width, height);
    }
}
