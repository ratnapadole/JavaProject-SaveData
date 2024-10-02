






<%     int a=22;  

    %>





<%@ page import = "java.sql.*"  %>


<%     


String name = request.getParameter("ename");
String address= request.getParameter("eaddress");


String dob =request.getParameter("edob");
String gender=request.getParameter("egender");
String loginid=request.getParameter("eloginid");
String password=request.getParameter("epassword");
	

	try
		{
			
			Class.forName("com.mysql.jdbc.Driver");

			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/emp","root","root");
				
			out.println("<h1>connection done</h1>");	
			
			String query="insert into empregistration(emp_name,emp_DOB,emp_gender,emp_address,emp_loginid,emp_password)  values  (?,?,?,?,?,?)";
		
			PreparedStatement ps =con.prepareStatement(query);
			
			
			ps.setString(1,name);
			ps.setString(2,dob);
			ps.setString(3,gender);
			ps.setString(4,address);
			ps.setString(5,loginid);
			ps.setString(6,password);
		
			int x=ps.executeUpdate();
			
			if(x>0)
			{
				out.println("<h1>Registration done Successfully</h1>");	
			}else  
				out.println(" <h1> Registration  Failed... <h1>");
		}catch(Exception e){
			System.out.println(e);
			System.out.println(" <h1> Registration  Failed... <h1>");
		}
 %>