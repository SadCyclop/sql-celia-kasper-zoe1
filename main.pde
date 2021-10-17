PImage BG1; 
PImage Brick;
PImage Brick2;
PImage Stone;
PImage MossStone;
PImage WoodenSign;

Hiro h1;
Block b1;
boolean grounded = false;
boolean saveText = false;
ArrayList<Block> blocks = new ArrayList<Block>();
ArrayList<Sign> signs = new ArrayList<Sign>();

void setup(){

imageMode(CORNER);
    WoodenSign = loadImage("SaveSign.png");
    Brick = loadImage("Brick.png");
    Brick2 = loadImage("Brick2.png");
    Stone = loadImage("Stone.png");
    MossStone = loadImage("MossStone.png");
    BG1 = loadImage("BWBG2.png");
    BG1.resize(1200*3,338*3);
    Brick.resize(64,64);
    Brick2.resize(64,64);
    MossStone.resize(64,64);
    WoodenSign.resize(100,100);
    h1 = new Hiro(500, 80);

    frameRate(60);
    
    for(int i = -10; i < 60; ++i){
        blocks.add(new Block(Brick2, i*64 + 500, 900));
    }
     for(int i = -10; i < 60; ++i){
        blocks.add(new Block(Brick2, i*64 + 500, 964));
    }

    for(int i = 0; i < 4; ++i){
        blocks.add(new Block(MossStone, i*64 + 750, 780));
    }
    for(int i = 0; i < 4; ++i){
        blocks.add(new Block(MossStone, i*64 + 942, 652));
    }
    for(int i = 0; i < 4; ++i){
        blocks.add(new Block(MossStone, i*64 + 1134, 524));
    }

    for(int i = 4; i < 0; ++i){
        blocks.add(new Block(Brick2, i*64 + 500, 964));
    }

    for(int i = 0; i < 2; ++i){
        signs.add(new Sign(WoodenSign,i*1000 + 1800,800));
    }
}

public void settings() {
  size(1920, 1000);
}

void draw(){
    clear();
    pushMatrix();
    translate(-h1.pos.x + width/2, 0);

    image(BG1,0,0);

    int m = millis();
    noStroke();
    rect(25, 25, 50, 50);
    

    if((frameCount % 60) == 0){
    println(m/1000);
    }
    
    if(saveText == true){
        textSize(60);
        text("PROGRESS SAVED!",50,50);
    }

    // gravity is acceleration

    h1.velocity.y = h1.velocity.y + 1;

    grounded = false;

    h1.pos.y += h1.velocity.y;
    for( Block block : blocks){
        if(checkCollision(block, h1)){

            if(h1.velocity.y > 0){
                h1.pos.y = block.pos.y - h1.height;
                grounded = true;
            } else {
                h1.pos.y = block.pos.y + block.height;
            }
            h1.velocity.y = 0;
        }
    }

    h1.pos.x += h1.velocity.x;
    for( Block block : blocks){
        if(checkCollision(block, h1)){

            if(h1.velocity.x > 0){
                h1.pos.x = block.pos.x - h1.width;
            } else {
                h1.pos.x = block.pos.x + block.width;
            }
            h1.velocity.x = 0;
        }
    }
    //println("New collison check at: " + beforeMovPos.x + " " + beforeMovPos.y);

    for ( Block block : blocks){       
        block.display();
    }

    for (Sign sign : signs){    
        sign.display();
    }

    h1.display();
    
    popMatrix();
}

void keyPressed(){
    boolean saveSuccess = false;
    if(key == 'f' || key == 'F' ){
        for( Sign sign : signs){
            if(checkCollision(sign, h1)){
                saveText = true;
                saveSuccess = true;
                println(h1.pos.x, h1.pos.y);
                textSize(60);
                text("PROGRESS SAVED!",50,50); 
                UpdatePos();
            }
        }
    }
    
    if(key == 'r' || key == 'R'){
    //h1.pos.x = PosX;
    //h1.pos.y = )PosY;
    println(PosX + PosY);
    
    }

    if(key == 'd'){
        if(h1.velocity.x > 5){
            h1.velocity.x = 5;
        }
         if(h1.velocity.x <= 4){
            h1.velocity.x = 0;
        }
        h1.velocity.x += 4;
    }
 
    if(key == 'a'){
        if(h1.velocity.x < -5){
            h1.velocity.x = -5;
        }
         if(h1.velocity.x <= -4){
            h1.velocity.x = 0;
        }
        h1.velocity.x -= 4;
    }

    if(key == ' '){
        if(grounded){
            h1.velocity.y -= 20;    
        }     
    }  
}
    
