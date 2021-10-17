class Block extends Collision_Object {
    PImage blockImage;

    Block(PImage image, float posX, float posY){
        // we expect the image provided will be 64x64
        blockImage = image;
        width = 64;
        height = 64;
        pos = new Vector(posX, posY);
    }

    void display(){
        image(blockImage, pos.x, pos.y, width, height);
    }

}
