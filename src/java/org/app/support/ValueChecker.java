package org.app.support;

/**
 *
 * @author mars
 */
public class ValueChecker {
    
    public static Integer checkInt(String str){
        Integer tempVal;
        try{
           tempVal = Integer.parseInt(str);
        } catch (Exception e) {
            tempVal = new Integer(-1);
        }
        return tempVal;
    }
    
}
