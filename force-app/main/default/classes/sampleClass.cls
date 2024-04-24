public with sharing class sampleClass {
    public static List<Account> getAccounts(){
        List<Account> accList = [SELECT ID, Name FROM Account LIMIT 5];
        return accList;
    }
}