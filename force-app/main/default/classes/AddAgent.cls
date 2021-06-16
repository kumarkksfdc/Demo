public class AddAgent {
public Agent__c myagent  {set;get;}
    public AddAgent(ApexPages.StandardController controller) {
        myagent=(Agent__c)controller.getRecord();
    }

}