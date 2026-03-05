public with sharing class accountController {
    
    @AuraEnabled(cacheable=true)
    public static String getMessage() {
        return 'This Means the World to Me!';
    }
}