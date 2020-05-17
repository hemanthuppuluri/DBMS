import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.*;


public class PaperReviewDriver {

	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	
	Scanner sc = new Scanner(System.in);
	
public PaperReviewDriver (){
			
	try{
		//connecting to database
		 conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/paperreviews", "root", "2277");
		 stmt = conn.createStatement();
		System.out.println("connection successful");
		// connection succesful
		
	}
  catch (Exception e) {
	  				System.out.println("exception"+ e);
  					}
			}
  public void getBook(){
	  
  try{
	  // Option Selection
	  System.out.println("Search a Book by: \n 1) Paper's Details \n 2) Paper's Id \n 3) Papers Count \n 4) Creating a new paper Submission  \n 5) Deleting first row of Author");
	  Integer input=sc.nextInt();
	  

	  switch(input)
	  {
	   case 1:
		   //Case 1 execution

			  String query = "Select p.id,p.Title,p.Abstract,a.EMAILAddr,a.FirstName,a.LastName from PAPER AS p, AUTHOR AS a where p.EMAILAddr  = a.EMAILAddr;"; 
			// SQL Query 1
			  PreparedStatement prepStmt = conn.prepareStatement(query);
				 
				
		
				System.out.println("");
					String x =sc.nextLine();
			
				ResultSet rs= prepStmt.executeQuery();
				

			  while(rs.next()){
					
					System.out.println(rs.getString("Id") + "\t||" + rs.getString("Title") + "\t||" + rs.getString("Abstract") + "\t||" + rs.getString("EmailAddr") + "\t||" + rs.getString("FirstName") + "\t||" + rs.getString("LastName") + "\t||");
					System.out.println("");
			 
				 }
			  break;
		  
		
		  case 2:  
			  // Case 2 execution
			
System.out.println("Enter desired least Orginalityscore to view recommendations greater than the  entered score"); // Enter Score 
		  String Title = sc.next() ;
		  String query1 = "select * from review where OriginalityScore >"+Title+";";// SQL Query 2
		PreparedStatement prepStmt1 = conn.prepareStatement(query1);
		 
	 ResultSet rs1 = prepStmt1.executeQuery(); 

	  while(rs1.next()){

			System.out.println(rs1.getString("Recommendation")+ "\t||" +rs1.getString("PaperId")+ "\t||" +rs1.getString("ReadabilityScore")+ "\t||" +rs1.getString("ReviewerId")+ "\t||" +rs1.getString("RelevanceScore")+ "\t||" +rs1.getString("OriginalityScore") + "\t||" +rs1.getString("MeritScore")+ "\t||");
			System.out.println("");		
	  }
	  
		
		  		break;
		  
		  
	  case 3:   
			// Case 3 execution

	  String query2 = "select count(*) from paper;";  // SQL Query 3 

	  PreparedStatement prepStmt2 = conn.prepareStatement(query2);
		 
			String z =sc.nextLine();
	 ResultSet rs2 = prepStmt2.executeQuery(); 


	  while(rs2.next()){

			System.out.println("The number of papers submitted are \t"+rs2.getString("Count(*)")+"\t");
		
	  					}
		 break;
	
  case 4: 
                  
	  String query12 = "insert into Author values ('Royal','Mint','rm@gmail.com');";  // SQL Query 4

String query14 = " insert into paper values (12,'creating new','allnew1','December','rm@gmail.com');";
	  String query15 = "select*from Paper;";
	  
		 PreparedStatement prepStmt12 = conn.prepareStatement(query12);
		 PreparedStatement prepStmt14 = conn.prepareStatement(query14);
		 PreparedStatement prepStmt15 = conn.prepareStatement(query15);
		 
		System.out.println("");
			String x1 =sc.nextLine();
	
		int rs22= prepStmt12.executeUpdate();
		int rs24= prepStmt14.executeUpdate();
		ResultSet rs25= prepStmt15.executeQuery();

	  while(rs25.next()){
			
//		  System.out.println(rs25.getString("Created New Paper Submission"));
			System.out.println("Created New Paper Submission \n "+ rs25.getString("EMAILAddr")+ "\t||" +rs25.getString("ID")+ "\t||" +rs25.getString("Title")+rs25.getString("Abstract")+ "\t||"+rs25.getString("FileName")+ "\t||");
			System.out.println("");
		 }
	  break;
case 5:
	//Case 5 Execution
	try
	// Case 5 try block
	{
		
 String query5 = "delete from author where lastname='uppuluri';";  // SQL Query 5
			 
				 PreparedStatement prepStmt7 = conn.prepareStatement(query5);
				
		
				System.out.println("");
					String x5 =sc.nextLine();
			
				ResultSet rs8= prepStmt7.executeQuery();

			  while(rs8.next()){
					
					System.out.println(rs8.getString("ERROR 1451 (23000):")+ "\t||" +rs8.getString("Title")+ "\t||" +rs8.getString("language")+ "\t||" +rs8.getString("status")+ "\t||" +rs8.getString("year"));
					System.out.println("");
			 
				 }
			  break;
	
	
	  }
	//Case 5 Catch block 
	  catch(Exception e) {
		  System.out.println( "Foreign Key Contraint :"+ "\n"+ "Cannot delete or update a parent row: a foreign key constraint fails (`paperreviews`.`paper`, CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`EMAILAddr`) REFERENCES `author` (`EMAILAddr`))  "+ e);
          
    }
  }
}
 catch(Exception ex) 
  {
	 System.out.println( "Book Search failed:  "+ ex);
  }
}


public static void main(String [] args){
	
	Scanner sc = new Scanner(System.in);
	PaperReviewDriver connect = new PaperReviewDriver();

connect.getBook();

   }
	    
}
