/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package receipes;
import java.sql.*;  
/**
 *
 * @author anto
 */
public class Receipes {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        try{  
          //  Thread.sleep(15000);
Class.forName("com.mysql.cj.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://db:3306/EtudiantEpsi","phpmyadmin","Password1011%"  );
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
            int rs=stmt.executeUpdate("INSERT INTO `Cours` (`idCours`, `nom`, `ProfesseursEPSI_idProfesseursEPSI`) VALUES ('2', 'henri', '2');");  

con.close();  
}catch(Exception e){ System.out.println(e);}  
}  
    }
    
