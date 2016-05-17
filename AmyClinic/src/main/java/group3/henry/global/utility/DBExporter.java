package group3.henry.global.utility;

import java.sql.*;

/*
-Get connection
-Get table data from DB
-Get rsmetadata from rs

-loopy loop, splice information into appropriate format
return result
*/

public class DBExporter {
	   public void dbConnect(String target) {
		  String connectionUrl = "jdbc:jtds:sqlserver://localhost:1433;DatabaseName=AmyDB;user=sa;password=01292013@Taichung";
	      Connection conn = null;
		  try {
	         Class.forName("net.sourceforge.jtds.jdbc.Driver");
	         conn = DriverManager.getConnection(connectionUrl);
//	         System.out.println("connected");
	         
	         Statement statement = conn.createStatement();
	         String queryString = "select * from " + target;
	         ResultSet rs = statement.executeQuery(queryString);
	         
	         ResultSetMetaData rsmd = rs.getMetaData();         
	         DatabaseMetaData dbmd = conn.getMetaData();
	         
	         String tableName = "";
	         
	         ResultSet tables = dbmd.getTables(null, null, "%", null);
	         while (tables.next()) {
	        	if (tables.getString(3).equals(target)){
	        		tableName = tables.getString(3);
	        		break;
	        	}
	         }
	         if (tableName.equals("")){
	        	 System.out.println("No such table found!");
	        	 return;
	         }
	         
	         String nl = System.getProperty("line.separator");
	         
	         StringBuffer xmlStr = new StringBuffer();
	         xmlStr.append("<"+tableName+">"+nl); //start tags
	         
	         StringBuffer jsonStr = new StringBuffer();
	         jsonStr.append("{\""+ tableName + "\":["+nl);
	         
	         int colmax = rsmd.getColumnCount();
	         String label = "";
	         String value = "";
	         while (rs.next()) {
	        	 jsonStr.append("{");
	        	 xmlStr.append("    <"+tableName.substring(0, tableName.length()-1)+">"+nl);
	        	 for (int i = 1; i <= colmax; i++){
	        		 label = rsmd.getColumnLabel(i);
	        		 value = rs.getString(i);
	        		 if (i==1)
	        			 xmlStr.append("        ");
	        		 if(i==colmax){
	        			 jsonStr.append("\""+label+"\":\""+value+"\"");
	        			 xmlStr.append("<"+label+">"+value+"</"+label+">"+nl);
	        		 }
	        		 else{ 
	        			 jsonStr.append("\""+label+"\":\""+value+"\",");
	        			 xmlStr.append("<"+label+">"+value+"</"+label+"> ");
	        		 }
	        	 }
	        	 xmlStr.append("    </"+tableName.substring(0, tableName.length()-1)+">"+nl);
	        	 if(rs.isLast())
	        		 jsonStr.append("}"+nl);
	        	 else
	        		 jsonStr.append("},"+nl);
	         }

	         xmlStr.append("</"+tableName+">"); //end tags
	         jsonStr.append("]}");
	         
	         System.out.println(jsonStr);
	         System.out.println(xmlStr);
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	    	  try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
	      }
	   }

	   public static void main(String[] args)
	   {
		   DBExporter connServer = new DBExporter();
		   connServer.dbConnect("Members");
	   }
	}