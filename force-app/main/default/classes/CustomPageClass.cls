public class CustomPageClass {
    public STUDENTS__c student   {set;get;}
    public CustomPageClass(apexpages.StandardController controller){
        student=(STUDENTS__c)controller.getRecord();
    }
    public pagereference create(){
        integer count=[select count() from STUDENTS__c where name=:student.Name and email_id__c=:student.email_id__c];
        if(count>0){
            apexpages.Message msg=new apexpages.Message(apexpages.Severity.ERROR,' Record Already Exist  ');
            apexpages.addMessage(msg);
            return null;
        }else{
            insert student;
            return new pagereference('/'+student.Id);
        }
    }
}