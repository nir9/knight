import java.awt.Point;
import java.util.Random;


public class main {
	static boolean firstTime = true;
	static int numOfTimes = 0;
	
	static int dPathsCounter = 0;
	static Point [] deadPaths = new Point[8];//Saves squares that should not be accessed again
	
	static Point [] arrofPoints;
	static Point boardDim = new Point();
	
	static Point [] pointsOnBoard;
	static int[][] board;
	static Point location = new Point();
	static Random rnd = new Random();
	static int randomNum;		
	static knight Knight;
	
	public static void main(String[] args)
	{
		boardDim.x = 8;//Can try 5X5 or 8X8 or 6X6....
		boardDim.y = 8;
		board = new int[boardDim.x][boardDim.y];
		pointsOnBoard = new Point[boardDim.x*boardDim.y]; 
		Knight = new knight(board, location , boardDim);
		
		while(Knight.getCounter() != boardDim.x*boardDim.y+1)
		{
			if(firstTime)
			{
			   
		            Knight.setLocation(location);
		          
		            
				firstTime=false;
			}
			
			else
			{
			//get counter and search for it than delete it from board
			back();
			//Knight = new knight(board, location , boardDim);
			}
				
			//location = new Point();
			//board = new int[boardDim.x][boardDim.y];
			
		//	Knight = new knight(board, location, boardDim);
			
			arrofPoints = Knight.getLocations();
		
		//System.out.println("LENG " + arrofPoints.length);
		while(arrofPoints.length != 0)
		{
	
			randomNum = rnd.nextInt(arrofPoints.length);
			location.x = arrofPoints[randomNum].x;
			location.y = arrofPoints[randomNum].y;
			/*for(int i=0;i<dPathsCounter;i++)
			{
				if(location.x == deadPaths[i].x&&location.y == deadPaths[i].y)
				{
					continue;//If our new location leads to a known dead end the algorithm will start the while again
				}
			}*/
		//	System.out.println(location);
			Knight.setLocation(location);
			arrofPoints = Knight.getLocations();
		//	System.out.println("LENG2 " + arrofPoints.length);
		//	System.out.println("Loc1: "+ Knight.getBoard()[0][0]);
		//	System.out.println("LNG:" +arrofPoints.length);
			
		
		}
		dPathsCounter=0;
		System.out.println("Counter: " + Knight.getCounter());
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
	}

	
	
	
	
	
	

static void back()
{
	
	board = Knight.getBoard();
	
	Knight.setCounter(Knight.getCounter()-2);

	for(int i = 0 ; i<boardDim.x ; i++)
	{
		for(int j = 0; j<boardDim.y; j++)
		{
			//set location to one step before
			if(board[i][j] == Knight.getCounter())
			{
				//STEP BEHIND
				//System.out.println("RELOCATION!");
				location.x = i;
				location.y = j;
				
			}
			
			if(board[i][j] == Knight.getCounter()+1)
			{
				//CURRENT STEP
				deadPaths[dPathsCounter] = new Point();
				deadPaths[dPathsCounter].x=i;
				deadPaths[dPathsCounter].y=j;
				board[i][j] = 0;
				//System.out.println("SET 0" + i + " , " + j);
			}
				
		}	
		
			
		
	}
//	System.out.println("OUT");
	Knight.setCounter(Knight.getCounter()+1);
	Knight.setBoard(board);
	Knight.setlocation(location);
	arrofPoints = Knight.getLocations();
	if(arrofPoints.length > 1)
	{
		
		//Found a sqaure with more than one option
	
		
		/*dPathsCounter++;
		System.out.println("MORE THAN ONE OPT");*/
	}
	if(arrofPoints.length == 1)
	{
		//If sqaure that was one step before had only one option go one more step back
		System.out.println("BACKMORE!");
		back();
	}
}
}
