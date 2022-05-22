package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Ajouter
 */
@WebServlet("/Ajouter")
public class Ajouter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session=request.getSession();
			 if(session.getAttribute("login")!=null){
				 String nom = request.getParameter("nom");
				 String prenom = request.getParameter("prenom");
				 String coef = request.getParameter("coef");
				 String nommat = request.getParameter("nommat");
				 String notetp = request.getParameter("notetp");
				 String noteds = request.getParameter("noteds");
				 String noteex = request.getParameter("noteex");
                float notetp1 = Float.parseFloat(notetp);
                float noteds1 = Float.parseFloat(noteds);
                float noteex1 = Float.parseFloat(noteex);
               double moymat = (noteds1*0.3 + (noteex1*0.4)+notetp1*0.3);
              
				String url="jdbc:mysql://localhost:3306/jee_etudiant";
				String user= "root";
				String pwd = "";  
					             
					            
					try{
					     Class.forName("com.mysql.cj.jdbc.Driver");
					    Connection con = DriverManager.getConnection (url, user , pwd );
					    PreparedStatement pst=con.prepareStatement ("INSERT INTO etudiant (nom,prenom,coef,nommat,notetp,noteds,noteex,moymat ) VALUES (? ,? ,? ,? ,? ,? ,? ,?)");
					    pst.setString(1, nom);
					    pst.setString (2, prenom);
					    pst.setString (3, coef);
					    pst.setString (4, nommat);
					    pst.setString (5, notetp);
					    pst.setString (6, noteds);
					    pst.setString (7, noteex);
					    pst.setDouble(8, moymat);

					   pst.executeUpdate();
					   
					    response.sendRedirect("index.jsp");
					    pst.close();
					    con.close();
					}catch (Exception e) { 
						System.out.print(e);
				}
	
	
			 }else response.sendRedirect ("auth.jsp");
			 }
		}
	

