public with sharing class returnAccounts {
    public returnAccounts() {
        List<Account> accList = new List<Account>();
        accList = [Select Id, Name from Account LIMIT 5];
        System.debug('List Contains..' + accList);
    }
}