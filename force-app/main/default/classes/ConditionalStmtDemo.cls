public class ConditionalStmtDemo {
    
    public static void nullCheckDemo(){
        List<Account> accList = new List<Account>();
        accList = [Select Id,Name from Account LIMIT 5];
        
        if(!accList.isEmpty()){
            System.debug('List Contains..' + accList);
        }
        //OR
        if(accList.size()>0){
            System.debug('List Contains..' + accList);
        }
    }
    
    Public static void logicalOperatorDemo(){
        Integer num1 = 10,num2=30;
        
        if(num1>5 && num2>10){ //if(num1>5 || num2>100){}
            System.debug('True');
        }else{
            System.debug('False');
        }
    }
    
    Public static void elseifLadderDemo(Integer num){
        if(num>0){
            System.debug('Number is Positive');
        }else if(num == 0){
            System.debug('Number is Zero');
        }else{
            System.debug('Number is Negative');
        }
    }    
    
    Public static void nestedIfDemo(Integer num){
        if(num>=0){
            if(num>0){
                System.debug('Number is Positive');
            }else{
                System.debug('Number is Zero');
            }
        }else{
            System.debug('Number is Negative');
        }
    }
    
    Public static void checkOddEven(Integer num){
        if(Math.mod(num,2)==0){
            System.debug('Number is Even');
        }else{
            System.debug('Number is Odd');
        }
    }
    
    public static void max(Integer num1,Integer num2){
        // Integer num1 = 20, num2 = 40;
         
        Integer result;
        result = num1>num2? num1:num2;
        System.debug('Maximum is= '+ result);
        
       /* if (num1>num2){
            System.debug('Num 1 is greater than Num 2');
        }else{
            System.debug('Num 2 is greater than Num 1');
        }*/
    }
    
    public static void checkEligibility(Integer age){
        if(age>=18){
            System.debug('You are Eligible for Voting');
        }else{
            System.debug('You are not Eligible for Voting');
        }
    }
    
    
}