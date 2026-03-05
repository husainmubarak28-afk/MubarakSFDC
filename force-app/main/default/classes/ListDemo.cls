public class ListDemo {
    
    Public static void sObjectListDemo(){
        List<Account> accList = new List<Account>();
        Account acc1 = new Account (Name='Acc201',Active__c = 'Yes');
        accList.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name = 'Acc202';
        acc2.Active__c ='Yes';
        accList.add(acc2);
        insert accList;        
    }
    
    Public static void sObjectListPosition(){
        List<Position__c> posList = new List<Position__c>();
        Position__c pos1 = new Position__c (Name='Dev');
        posList.add(pos1);
        
        Position__c pos2 = new Position__c (Name='Admin');
        posList.add(pos2);
        insert posList;        
    }
    
    public static List<String> returnDemo(){
        List <String> colors = new List<String>{'Red','Green','Blue'};
        //colors.add('Red');
        //colors.add('Green');
        //colors.add('Blue');
        
        return colors;
    }

    public static void ListDemoMethod(){
        
        List<String> returnedValues = new List<String>();
        returnedValues =returnDemo();
        System.debug('returnedValues in List are ='+ returnedValues);
        
        List <String> colors = new List<String>();
        colors.add('Red');
        colors.add('Green');
        colors.add('Blue');
        colors.add('Yellow');
        
        System.debug('Colors in List are ='+ colors);
        
        colors.add(1,'Black');
        System.debug('Colors in List are ='+ colors);
        
        List <String> colorsList2 = new List<String>();
        colorsList2.add('White');
        colorsList2.add('Purple');
        colors.addall(colorsList2);
        
        System.debug('Colors in List are ='+ colors);
        
        System.debug('colors in colorsList2 are ='+ colorsList2);
        colorsList2.clear();
        System.debug('colors in colorsList2 are ='+ colorsList2);
        
        List<String> clonedList = new List<string>();      
        clonedList =colors.clone();
        System.debug('clonedList List contains ='+ clonedList);   
        
        System.debug('Colors in List are ='+ colors.contains('Red'));
        System.debug('Colors in List are ='+ colors.equals(clonedList));
        System.debug('Colors in List are ='+ colors.get(3));
        System.debug('Colors in List are ='+ colors.indexOf('Green'));
        System.debug('Empty = '+ colors.isEmpty());
        System.debug('Empty = '+ colorsList2.isEmpty());
        colors.remove(3);
        System.debug('Colors in List are ='+ colors);
        System.debug('Size = '+ colors.size());
        System.debug('Size = '+ colorsList2.size());
        colors.sort();
        System.debug('Sorted Colors in List are ='+ colors);
        
        
       
    }

}