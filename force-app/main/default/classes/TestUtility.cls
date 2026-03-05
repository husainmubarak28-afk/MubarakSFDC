public class TestUtility {

    public static List<Account> createAccountRecords(String Name, Integer Count, Boolean isInsert){
        List<Account> accList= new List<Account>();
        for (Integer i=0; i<Count; i++){
            Account acc= new Account();
            acc.Name = Name + i;
            accList.add(acc);
        }
        If(isInsert){
            Insert accList;
        }
        
        return accList;
    }
}