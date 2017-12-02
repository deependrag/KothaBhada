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
            return 0;
        
        else if(m.equals("FEB"))
            return 1;
        
        else if(m.equals("MAR"))
            return 2;
        
        else if(m.equals("APR"))
            return 3;
        
        else if(m.equals("MAY"))
            return 4;
        
        else if(m.equals("JUNE"))
            return 5;
        
        else if(m.equals("JULY"))
            return 6;
        
        else if(m.equals("AUG"))
            return 7;
        
        else if(m.equals("SET"))
            return 8;
        
        else if(m.equals("OCT"))
            return 9;
        
        else if(m.equals("NOV"))
            return 10;
        
        else if(m.equals("DEC"))
            return 11;
        
      return 0;
    }
}
