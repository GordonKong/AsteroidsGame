Star[] galaxy;
Asteroids[] rocks;
SpaceShip jet = new SpaceShip();//your variable declarations here
public void setup() 
{
  galaxy = new Star[150];
  rocks = new Asteroids[20];
  for (int i = 0; i < galaxy.length; i++)
  {
    galaxy[i] = new Star();
  }
  for( int i = 0; i < rocks.length; i++)
  {
    rocks[i] = new Asteroids();
  }
 size(800, 800);
  //your code here
}
public void draw() 
{
  background(0);
  jet.show();
  jet.move();
  
  for( int i = 0; i < galaxy.length; i++)
  {
    galaxy[i].appear();
  }
  for( int i = 0; i < rocks.length; i++)
  {
    rocks[i].show();
    rocks[i].move(); 
  } //your code here
}

class Star
{
 private int myX, myY;
  public Star()
  {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
  }
  public void appear()
  {
    fill(100,100,255);
    ellipse(myX, myY, 5, 5);
  }
}
public void keyPressed()
{
  if (key == 'a') { jet.rotate(-2);}
  if (key == 'd') { jet.rotate(2);}
  if (key == 'w') { jet.accelerate(.5);}
  if (key == 's') { jet.accelerate(-.5);}
  if (key == 'h')
  {
    jet.setX((int)(Math.random()*700));
    jet.setY((int)(Math.random()*700));
    jet.setDirectionX(0);
    jet.setDirectionY(0);
    jet.setPointDirection((int)(Math.random()*360));
  }
}
class Asteroids extends Floater
{
  private int rotSpeed;
  public Asteroids()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;  
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
    myCenterX = (Math.random()*700);
    myCenterY = (Math.random()*700);
    myColor = color(255, 255, 255);
    myPointDirection = 0;
    myDirectionX = Math.random()*2-1;
    myDirectionY = Math.random()*2-1;
    rotSpeed = (int)(Math.random() * 10 - 5);
  }
    public void setX(int x) { myCenterX = x;}
    public int getX() { return (int)myCenterX;}
    public void setY(int y) { myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) { myDirectionX = x;}
    public double getDirectionX() { return (double)myDirectionX; }
    public void setDirectionY(double y) { myDirectionY = y; }
    public double getDirectionY() { return (double)myDirectionY; }
    public void setPointDirection(int degrees) { myPointDirection = degrees;}
    public double getPointDirection() { return (double)myPointDirection; }
     public void move()
    {
      rotate(rotSpeed);
      super.move();
    }

}
 
class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
     corners = 6;
     xCorners = new int[corners];
     yCorners = new int[corners];
     xCorners[0] = 12;
     yCorners[0] = 0;
     xCorners[1] = -15;
     yCorners[1] = -12;
     xCorners[2] = -20;
     yCorners[2] = -8;
     xCorners[3] = -15;
     yCorners[3] = 0;
     xCorners[4] = -20;
     yCorners[4] = 8;
     xCorners[5] = -15;
     yCorners[5] = 12;
     myCenterX = 400;
     myCenterY = 400;
     myColor = color(150, 255, 255);
     myPointDirection = 0;
     myDirectionX = 0;
     myDirectionY = 0;
    } 

    public void setX(int x) { myCenterX = x;}
    public int getX() { return (int)myCenterX;}
    public void setY(int y) { myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) { myDirectionX = x;}
    public double getDirectionX() { return (double)myDirectionX; }
    public void setDirectionY(double y) { myDirectionY = y; }
    public double getDirectionY() { return (double)myDirectionY; }
    public void setPointDirection(int degrees) { myPointDirection = degrees;}
    public double getPointDirection() { return (double)myPointDirection; } 
     //your code here
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()  //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
}

