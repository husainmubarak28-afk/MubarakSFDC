public class LoopDemo {
    
    Public static void showList(){
        
        Set<Id> accIds = new set<Id>();
        List<Account> accList = new List<Account>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        accList = [Select Id,Name from Account LIMIT 5];
        
        //Iteration on Account List to display data and create set of account ids
        System.debug('Display Data through List');
        if(accList.size()>0){
        for(Account acc: accList){
            System.debug(acc.id + ' - '+ acc.Name);
            accIds.add(acc.Id);	//set is having data
            accMap.put(acc.Id,acc); //Map is having Data
            
        }
        }
        
        /* if(!accList.isEmpty()){
        for(Account acc: accList){
            System.debug(acc.id + ' - '+ acc.Name);
        }
        }*/
        
        //Display Ids of Set
        System.debug('Display Data through Set');
        if(!accIds.isEmpty()){
            for(Id accId : accIds){
                System.debug(accId);
            }
        }
        
        //Display Account Ids and Names with Map
        //Iterate Map based on Keys
        System.debug('Display Data through Map Keys');
        if(!accMap.isEmpty()){
            for(Id accId : accMap.keySet()){
                System.debug(accId);
            }
        }
        
        //Iterate Map based on Values
        System.debug('Display Data through Map Values');
        if(!accMap.isEmpty()){
            for(Account acc : accMap.values()){
                System.debug(acc);
            }
        }
    }
    

    Public static void sumOfNamturalNum(Integer n){
        Integer i,sum=0;
        for (i=1;i<=n;i++){
            sum=sum+i;
        }
        System.debug('Sum = '+ sum);
    }
    
    
    Public static void forLoopDemo(){
        for(Integer i=1;i<=10;i++){
            System.debug(i);
        }
    }
    
    
    public static void table(Integer num){
        for (integer i=1;i<=10; i++){
            System.debug(num*i);
        }
    }
    
    
    public static void evenNumber(Integer n){ 
        for(Integer i=1;i<=n; i++){
            if(Math.mod(i,2)==0){
                System.debug(i);
            }
        }
    }
    
    
    public static void oddNumber(Integer n){  
        for(Integer i=1;i<=n; i++){
            if(Math.mod(i,2)!=0){
                System.debug(i);
            }
        }
    }
    
    
    public static void tableWithWhile(Integer num){
        integer i=1;
        While (i<=10){
            System.debug(num + ' * '+i+' = '+ num*i);
            i++;
        }
    }
    
    
}