import java.awt.Point;
import java.util.Random;

PFont f;
  void setup() {
      size(1200, 720);
      background(71, 160 ,210);
      f = createFont("Helvetica",14,true); 
      fill(157, 204, 241); 
       textFont(f); 
       fill(0);    
        println("Started");
        long startTime = System.nanoTime();
        int numOfTimes = 0;
        double elapsedTime = 0;
        
        Point [] arrofPoints;
        Point boardDim = new Point();
        boardDim.x = 8;//Can try 5X5 or 8X8 or 6X6....
        boardDim.y = 8;
        Point [] pointsOnBoard = new Point[boardDim.x*boardDim.y]; 
        int[][] board = new int[boardDim.x][boardDim.y];
        Point location = new Point();
        Random rnd = new Random();
        int randomNum;      
        knight Knight = new knight(board, location , boardDim);
        
    
        
        
        
        while(Knight.getCounter() != boardDim.x*boardDim.y+1)
        {
            location = new Point();
            board = new int[boardDim.x][boardDim.y];
            
            Knight = new knight(board, location, boardDim);
            Knight.setLocation(location);
            arrofPoints = Knight.getLocations();
            
        while(arrofPoints.length != 0)
        {
    
            randomNum = rnd.nextInt(arrofPoints.length);
            location.x = arrofPoints[randomNum].x;
            location.y = arrofPoints[randomNum].y;
        //  println(location);
                Knight.setLocation(location);
            arrofPoints = Knight.getLocations();
        //  println("Loc1: "+ Knight.getBoard()[0][0]);
        //  println("LNG:" +arrofPoints.length);
            
        
        }
        numOfTimes++;
        if(numOfTimes%1000000 == 0){
          println("# of times: "+ numOfTimes);
        
          elapsedTime = (System.nanoTime() - startTime);
          print("took: ");
          print(elapsedTime/1000000000);
          println(" seconds");
          }
    //println(Knight.getBoard()[3][5]);
        

        }
        
        for(int c = 0; c<pointsOnBoard.length; c++)
            pointsOnBoard[c] = new Point();
        
        for(int i = 0 ; i<boardDim.x ; i++)
        {
            for(int j = 0; j<boardDim.y; j++)
            {
                //println("Cout: " + Knight.getBoard()[i][j] + " Locations: " + i  + " , " + j);
                
                pointsOnBoard[Knight.getBoard()[i][j]-1].y = j;
                pointsOnBoard[Knight.getBoard()[i][j]-1].x = i;
            }   
            
                
            
        }
        int last = 0;
        fill(157, 204, 241); 
        println("Place #: " + (1) + " At Loc: " + pointsOnBoard[0].x + " , " + pointsOnBoard[0].y,800,((1)*14)+10);
        text("Place #: " + (1) + " At Loc: " + pointsOnBoard[0].x + " , " + pointsOnBoard[0].y,800,((1)*14)+10);
        for(int c= 1; c<pointsOnBoard.length; c++){
            println("Place #: " + (c+1) + " At Loc: " + pointsOnBoard[c].x + " , " + pointsOnBoard[c].y);
            stroke(157, 204, 241);
            line(pointsOnBoard[c-1].x*100+1, pointsOnBoard[c-1].y*100+1,pointsOnBoard[c].x*100+1,pointsOnBoard[c].y*100+1);
            fill(157, 204, 241); 
            if (c+1 < 50){
              text("Place #: " + (c+1) + " At Loc: " + pointsOnBoard[c].x + " , " + pointsOnBoard[c].y,800,((c+1)*14)+10); 
            }else{
              text("Place #: " + (c+1) + " At Loc: " + pointsOnBoard[c].x + " , " + pointsOnBoard[c].y,1000,((c-48)*14)+10); 
            }
            ellipse(pointsOnBoard[c-1].x*100+1,pointsOnBoard[c-1].y*100+1,3,3);
            last = c;
        }
        ellipse(pointsOnBoard[last].x*100+1,pointsOnBoard[last].y*100+1,3,3);

        println("# of times before end result: "+ numOfTimes);
        
        println("DONE!");
        elapsedTime = System.nanoTime() - startTime;
        print("took: ");
        print(elapsedTime/1000000000);
        print(" seconds");
    }

