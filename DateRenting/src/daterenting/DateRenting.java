/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daterenting;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL INC
 */
public class DateRenting {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String Datestr1 = "2021-03-03";//date rent
        String Datestr2 = "2021-03-01";//date return
        
        Date date1;
        Date date2;
        Date date3;
        try {
            date1 = new SimpleDateFormat("yyyy-MM-dd").parse(Datestr1);
            System.out.println("Date1: "+date1.getTime());
            
            date2 = new SimpleDateFormat("yyyy-MM-dd").parse(Datestr2);
            System.out.println("Date2: "+date2.getTime());
            
            Date currentDate = new Date();
            java.sql.Date currentDate1 = new java.sql.Date(currentDate.getTime());
            long a = date2.getTime()-date1.getTime();
            System.out.println("LONG: "+a/(24*60*60*1000));
            //1000 là 1 ngày nếu ra số âm tức là bé hơn
            
        } catch (ParseException ex) {
            Logger.getLogger(DateRenting.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
