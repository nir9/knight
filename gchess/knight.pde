import java.awt.Point;


public class knight {
  private Point Dimensions;
  private Point [] arrofPoints;
  private Point location;
  private int[][] _board;
  private int counter=1;
  public knight(int[][] board, Point location1 , Point Dim)
  {
    
    _board = board;
    Dimensions = Dim;
    location = location1;
    
  }
  public Point[] getLocations (Point loc)
  {
    Point savedLocation;
     Point[] points;
    int counter = 0;
    savedLocation = location;
    if(loc != null)
    {
      //If argument is not null loc that's been sent will be replaced with current loc but will be swaped back
      
      location = loc;
    }
    
   
      
      if(!(location.x+2>Dimensions.x-1||location.y+1>Dimensions.y-1)&&_board[location.x+2][location.y+1]==0)
      {
        
        counter++;
        
        
      }
      
      
      if(!(location.x-2<0||location.y-1<0)&&_board[location.x-2][location.y-1]==0)
      {//Changed
        counter++;
      }
      
      
    
      if(!(location.x+2>Dimensions.x-1||location.y-1<0)&&_board[location.x+2][location.y-1]==0)
      {
        counter++;
      }
      
      
      
      if(!(location.x-2<0||location.y+1>Dimensions.y-1)&&_board[location.x-2][location.y+1]==0)
      {
        counter++;
      }
      
      
      
      
      
      
      if(!(location.x+1>Dimensions.x-1||location.y+2>Dimensions.y-1)&&_board[location.x+1][location.y+2]==0)
      {
        counter++;
      }
      
      
      
      if(!(location.x-1<0||location.y-2<0)&&_board[location.x-1][location.y-2]==0)
      {
        counter++;
        
      }
      
      
      
      if(!(location.x+1>Dimensions.x-1||location.y-2<0)&&_board[location.x+1][location.y-2]==0)
      {
        counter++;
      }
      
      
      
      if(!(location.x-1<0||location.y+2>Dimensions.y-1)&&_board[location.x-1][location.y+2]==0)
      {
        counter++;
      }
      //System.out.println(counter);
      points = new Point[counter]; //Creates array of points that knight can access
      counter=0;
      //int counter=0;
      if(!(location.x+2>Dimensions.x-1||location.y+1>Dimensions.y-1)&&_board[location.x+2][location.y+1]==0)
      {
        points[counter]= new Point();
        points[counter].x = location.x+2;
        points[counter].y = location.y+1;
        counter++;
        
        
        
      }
      
      
      if(!(location.x-2<0||location.y-1<0)&&_board[location.x-2][location.y-1]==0)
      {
        points[counter]= new Point();
        points[counter].x= location.x-2;
        points[counter].y= location.y-1;
        counter++;
      }
      
      
    
      if(!(location.x+2>Dimensions.x-1||location.y-1<0)&&_board[location.x+2][location.y-1]==0)
      {
        points[counter]= new Point();
        points[counter].x= location.x+2;
        points[counter].y= location.y-1;
        counter++;
      }
      
      
      
      if(!(location.x-2<0||location.y+1>Dimensions.y-1)&&_board[location.x-2][location.y+1]==0)
      {
        points[counter]= new Point();
        points[counter].x= location.x-2;
        points[counter].y= location.y+1;
        counter++;
      }
      
      
      
      
      
      
      if(!(location.x+1>Dimensions.x-1||location.y+2>Dimensions.y-1)&&_board[location.x+1][location.y+2]==0)
      {
        points[counter]= new Point();
        points[counter].x= location.x+1;
        points[counter].y= location.y+2;
        counter++;
      }
      
      
      
      if(!(location.x-1<0||location.y-2<0)&&_board[location.x-1][location.y-2]==0)
      {
        points[counter]= new Point();
        points[counter].x= location.x-1;
        points[counter].y= location.y-2;
        counter++;
        
      }
      
      
      
      if(!(location.x+1>Dimensions.x-1||location.y-2<0)&&_board[location.x+1][location.y-2]==0)
      {
        
        points[counter]= new Point();
        points[counter].x= location.x+1;
        points[counter].y= location.y-2;
        counter++;
      }
      
      
      
      if(!(location.x-1<0||location.y+2>Dimensions.y-1)&&_board[location.x-1][location.y+2]==0)
      {
        points[counter]= new Point();
        points[counter].x= location.x-1;
        points[counter].y= location.y+2;
        counter++;
      }
      location = savedLocation;
      return points;

    
    
  }
  void setLocation(Point location)
  {
    
    this.location = location;
    _board[location.x][location.y]= counter;
    
    counter++;
  }
  int getCounter()
  {
    return counter;
  }
  int[][] getBoard()
  {
    return _board;
  }
  /*
  boolean checkLocation(Point location)
  {
    arrofPoints = getLocations();
    for(int i=)
    getLocations
  }*/
}
