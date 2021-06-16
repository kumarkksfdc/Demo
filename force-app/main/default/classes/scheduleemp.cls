public class scheduleemp implements schedulable{
    public void execute(schedulablecontext sc){
        list<employee__c> emp=[select id from employee__c where email__c='kumar123@gmail.com'];
        delete emp;
            }
}