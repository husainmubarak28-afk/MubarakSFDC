public class MapDemo {
    
    public static void sObjectDemoPosition(){
        List<Position__c> posList = new List<Position__c>();
        posList = [Select Id, Name from Position__c Limit 5];
       Map<Id,Position__c> posMap = new Map<Id,Position__c>(posList); // List will be converted into Maps
        
        System.debug('Map contains. = '+ posMap);
        System.debug('Map Keys. = '+ posMap.keySet());
        System.debug('Map Values. = '+ posMap.values());    
    }
    
    
    public static void sObjectDemoWithoutLoop(){
        List<Account> accList = new List<Account>();
        accList = [Select Id, Name from Account Limit 5];
       Map<Id,Account> accMap = new Map<Id,Account>(accList); // List will be converted into Maps
        
        System.debug('Map contains. = '+ accMap);
        System.debug('Map Keys. = '+ accMap.keySet());
        System.debug('Map Values. = '+ accMap.values());    
    }

    
    public static void sObjectDemoWithLoop(){
        List<Account> accList = new List<Account>();
        accList = [Select Id, Name from Account Limit 5];
       Map<Id,Account> accMap = new Map<Id,Account>(); 
        
        for (Account acc : accList){
            accMap.put(acc.id,acc);
        }
        
        System.debug('Map contains. = '+ accMap);
        System.debug('Map Keys. = '+ accMap.keySet());
        System.debug('Map Values. = '+ accMap.values());    
    }
    
    Public Static void demo(){
        Map<Integer,String> colors = new Map<Integer,String>();
        Map<Integer,String> moreColors = new Map<Integer,String>();
        Map<Integer,String> clonedMap = new Map<Integer,String>();
        Set<Integer> intSet = new set<Integer>();
        List<String> strList = new List<String>();
        colors.put(1,'Green');
        colors.put(2,'Blue');
        colors.put(3,'Red');
        colors.put(4,'Blue');
        System.debug ('Map contains...'+ colors);
        colors.put(2,'Yellow');
        System.debug ('Map contains...'+ colors);
        moreColors.put(10,'Black');
        moreColors.put(20,'White');
        colors.putAll(moreColors);
        System.debug ('Map contains...'+ colors);
        
        colors.remove(1);
        System.debug ('Map contains...'+ colors);
        System.debug ('Size.. = '+ colors.size());
        
        System.debug ('The Values.. = '+ colors.values());
        
       // colors.clear();
      //  System.debug ('Map contains...'+ colors);
        clonedMap = colors.clone();
        System.debug ('Cloned Map contains...'+ clonedMap);
        
        System.debug ('ContainsKey.. = '+ colors.containsKey(2));
        System.debug ('ContainsKey.. = '+ colors.containsKey(50));
        System.debug ('Equals.. = '+ colors.equals(clonedMap));
        System.debug ('Equals.. = '+ colors.equals(moreColors));
        
        System.debug ('get Map.. = '+ colors.get(2));
        System.debug ('Empty.. = '+ colors.isEmpty());
        System.debug ('Map Keys.. = '+ colors.keySet());
        
        intSet = clonedMap.keySet(); // stores key into a set
        strList = clonedMap.values(); //stores values into a list
        
        system.debug('Set Contains ..' + intSet);
        System.debug('List Contains ..' + strList);
    }
}