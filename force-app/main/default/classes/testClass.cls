@isTest
public class testClass {
    @TestSetup
    static void makeData(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<10;i++){
            Account acc = new Account(Name='Acc '+String.valueOf(i));
            accList.add(acc);
        }
        insert accList;
    }
    @isTest
    public static void sampleClassTest(){
        List<Account> result = sampleClass.getAccounts();
        System.assertEquals(4,result.size());
    }
}