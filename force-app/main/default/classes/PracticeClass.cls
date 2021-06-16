//Display list of records from corresponding object
public class PracticeClass {
    list<New_Student_Reg__c> nslist=[select name,Email_Id__c,Contact_no__c   from New_Student_Reg__c];
    list<STUDENTS__c> nslist1=[select name from STUDENTS__c];
    public list<New_Student_Reg__c> getnslist(){
        return nslist;
    }
    public list<STUDENTS__c> getnslist1(){
        return nslist1;
    }
}