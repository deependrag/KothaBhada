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


public class DefineMonth {
    public static int getMonth(String m){
        switch (m) {
            case "Janaury":              
                return 1;
            case "Feburary":
                return 2;
            case "March":
                return 3;
            case "April":
                return 4;
            case "May":
                return 5;
            case "June":
                return 6;
            case "July":
                return 7;
            case "August":
                return 8;
            case "September":
                return 9;
            case "October":
                return 10;
            case "November":
                return 11;
            case "December":
                return 12;
            default:
                break;
        }
        return 0;
        
     
    }
}
