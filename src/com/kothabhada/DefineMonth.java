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
    static int r;
    static int t;
    public static int getMonth(String m){
        if(m.equals("JAN"))
            return 1;
        
        else if(m.equals("FEB"))
            return 2;
        
        else if(m.equals("MAR"))
            return 3;
        
        else if(m.equals("APR"))
            return 4;
        
        else if(m.equals("MAY"))
            return 5;
        
        else if(m.equals("JUN"))
            return 6;
        
        else if(m.equals("JUL"))
            return 7;
        
        else if(m.equals("AUG"))
            return 8;
        
        else if(m.equals("SET"))
            return 9;
        
        else if(m.equals("OCT"))
            return 10;
        
        else if(m.equals("NOV"))
            return 11;
        
        else if(m.equals("DEC"))
            return 12;
        
      return 0;
    }
}
