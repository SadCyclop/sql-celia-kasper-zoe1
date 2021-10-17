import de.bezier.data.sql.*;

float PosX, PosY;
String mode = "";
SQLite db;

void getData(){
//Connect to database
 db = new SQLite( this, "DDU.sqlite" );
  
  //If connection is succesfull
 if ( db.connect() )
 {
   

 //String sql = "INSERT INTO Players_1 (NAME, Play_Time, Coordinates, Score) VALUES ('" + "Hiro" + "', '" + 2 + "', '" + -50.300 + "', '" + 200.00 + "');";
//db.execute(sql);

println("Name: hiro", "\n pt: 2 min");

String sql = "UPDATE Players_1 SET Play_Time = '"+ 3 + "', Coordinates = '"+ -30.300 + "', Score = '"+ 210.00 +"' WHERE ID IS " + 1 + ";";
db.execute(sql);

   }
  else
  {
    //Display error trying to get data from DB
    println("Error DB");
  }
  db.close();
}

void UpdatePos(){
 db = new SQLite( this, "DDU.sqlite" );
 if ( db.connect() )
 {
 String SQL ="UPDATE Players_1 SET PosX = '" + h1.pos.x + "',PosY = '" + h1.pos.y + "' WHERE ID IS " + 1 + ";";
 db.execute(SQL);
 //h1.pos.x, h1.pos.y
}
}

void resetPos(){
db = new SQLite( this, "DDU.sqlite" ); 
 if ( db.connect() )
 {
db.query("SELECT PosX, PosY FROM players_1");
PosX = db.getFloat("PosX");
PosY = db.getFloat("PosY");
}
}
