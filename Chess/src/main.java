import java.awt.Point;
import java.util.Random;


public class main {
    public static void main(String[] args)
    {
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
        //  System.out.println(location);
                Knight.setLocation(location);
            arrofPoints = Knight.getLocations();
        //  System.out.println("Loc1: "+ Knight.getBoard()[0][0]);
        //  System.out.println("LNG:" +arrofPoints.length);
            
        
        }
         elapsedTime = System.nanoTime() - startTime;
        System.out.print("took: ");
        System.out.print(elapsedTime/1000000000);
        System.out.print(" seconds");
        numOfTimes++;
      
    //System.out.println(Knight.getBoard()[3][5]);
        

    }
        
        for(int c = 0; c<pointsOnBoard.length; c++)
            pointsOnBoard[c] = new Point();
        
        for(int i = 0 ; i<boardDim.x ; i++)
        {
            for(int j = 0; j<boardDim.y; j++)
            {
                //System.out.println("Cout: " + Knight.getBoard()[i][j] + " Locations: " + i  + " , " + j);
                
                pointsOnBoard[Knight.getBoard()[i][j]-1].y = j;
                pointsOnBoard[Knight.getBoard()[i][j]-1].x = i;
            }   
            
                
            
        }
        for(int c= 0; c<pointsOnBoard.length; c++)
            System.out.println("Place #: " + (c+1) + " At Loc: " + pointsOnBoard[c].x + " , " + pointsOnBoard[c].y);
        
    
        System.out.println("# of times before end result: "+ numOfTimes);
        
        System.out.println("DONE!");
        elapsedTime = System.nanoTime() - startTime;
        System.out.print("took: ");
        System.out.print(elapsedTime/1000000000);
        System.out.print(" seconds");
    }
}
