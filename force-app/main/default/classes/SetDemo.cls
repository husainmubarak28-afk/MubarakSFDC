public class SetDemo {
    
    Public static void positionWithSet(){
        Set<Id> posId = new set<Id>();
        List<Position__c> posList = new List<Position__c>();
        posList = [Select Id,Name from Position__c Limit 5];
        
        for(Position__c pos:posList){
            posId.add(pos.Id);
        }
        System.debug('Positions are = '+ posId);
    }
    
    public static void demoSObjectWithSet(){
        
        Set<Id> accIds = new Set<Id>();
        List<Account> accList= new List<Account>();
        accList = [Select Id,Name from Account LIMIT 5];
        
        for (Account acc : accList){
            accIds.add(acc.Id);
        }
        System.debug('Set of Account contains = '+ accIds);
    }
    
    
    Public static void Demo(){
        Set<Integer> intSet = new Set<Integer>();
        List<Integer> intList = new List<Integer>();
        Set<Integer> clonedSet = new Set<Integer>();
        intSet.add(10);
        intSet.add(20);
        intSet.add(30);
        
        intList.add(50);
        intList.add(60);
        intList.add(30);
        
        intSet.addAll(intList);
        
        system.debug('Set contains = '+ intSet);
       // intSet.clear();
        clonedSet = intSet.clone();
        system.debug('Cloned Set contains = '+ clonedSet);
        
        system.debug('Element is available = '+ intSet.contains(30));
        
        system.debug('Element is available = '+ intSet.containsAll(intList));
        
        system.debug('Equal = '+ intSet.equals(clonedSet));
        
        System.debug('Empty = '+ intSet.isEmpty());
        
        intSet.remove(20);
        system.debug('Set contains = '+ intSet);
        
        intSet.removeAll(intList); //elements in intList will be removed from intSet.
        system.debug('Set contains = '+ intSet);
        
        intSet.retainAll(intList); //elements in intList will be retained from intSet and others will remain.
        system.debug('Set contains = '+ intSet);
        
        System.debug('Size = '+ intSet.size());
        
            }
    
}