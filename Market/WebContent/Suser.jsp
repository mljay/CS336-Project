<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User history</title>
</head>
<body>
<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ebay","root","Qwe123456");
        Statement st=con.createStatement();
        String entity = request.getParameter("name");
        ResultSet rs;
        if(entity==null)
        {
        	rs=st.executeQuery("select * from bidhistory;");
        }
        else
        {
        	rs=st.executeQuery("select * from bidhistory, auction, electronics e Where bidhistory.seller=" +"'"+entity+"' AND auction.auctionId=bidhistory.auction_id AND e.auction_id=auction.auctionId;");
        }
  
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
               <th>Seller</th>
                <th>bidder</th>
                 <th>time</th>
                  <th>buy_price</th>
                   <th>Product name</th>
          </tr>
      </thead>
      <tbody>
      
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("Seller") %></td>
              	<td><%=rs.getString("bidder") %></td>
              	<td><%=rs.getString("biddt") %></td>
              	<td><%=rs.getString("bidamount") %></td>
              		<td><%=rs.getString("e.name") %></td>
            </tr>
            <%}%>
            
         
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    
    %>


</body>
</html>