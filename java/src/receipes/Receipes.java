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
<<<<<<< HEAD:java/src/receipes/Receipes.java
          //  Thread.sleep(15000);
Class.forName("com.mysql.cj.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://db:3306/EtudiantEpsi","phpmyadmin","Password1011%"  );
=======
      //      Thread.sleep(15000);
Class.forName("com.mysql.cj.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://mysql1:3306/EtudiantEpsi","root","Password1011%"  );
>>>>>>> 209941ed38ec35f353da02121f7fc85cc57ad5ca:src/receipes/Receipes.java
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
           int rs=stmt.executeUpdate("INSERT INTO `Cours` (`idCours`, `nom`, `ProfesseursEPSI_idProfesseursEPSI`) VALUES ('2', 'henri', '2');");  

con.close();  
}catch(Exception e){ System.out.println(e);}  
}  
    }
    
