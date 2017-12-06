/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kothabhada;

/**
 *
 * @author Ranjan
 */
public class ConvertMonth {
    public static String convertMonth(String m){
        switch (m) {
            case "Janaury":              
                return "JAN";
            case "Feburary":
                return "FEB";
            case "March":
                return "MAR";
            case "April":
                return "APR";
            case "May":
                return "MAY";
            case "June":
                return "JUN";
            case "July":
                return "JUL";
            case "August":
                return "AUG";
            case "September":
                return "SEP";
            case "October":
                return "OCT";
            case "November":
                return "NOV";
            case "December":
                return "DEC";
            default:
                break;
        }
        return null;
        
     
    }
}


