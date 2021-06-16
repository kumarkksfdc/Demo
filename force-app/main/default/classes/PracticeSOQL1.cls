public class PracticeSOQL1 {
    public list<account> acc {set;get;}
    public list<contact> con {set;get;}
    public list<account> acc1 {set;get;}
    public PracticeSOQL1 (){
        string industry='Energy';
        acc=[select name,phone,industry from account where industry=:industry limit 5];
        con=[select lastname,phone from contact where accountId in:acc];
       acc1=[select name,phone,industry,(select lastname,phone from contacts) from account limit 3];
    }
    public pagereference tableview(){
        return page.practicepage2;
  	 }
    
}

/*
//dispaly related records of account with contacts
<apex:page controller="PracticeSOQL1">
    <apex:pageBlock >
        <apex:repeat value="{!acc1}" var="a">

            <apex:pageBlockSection >
                <apex:outputField value="{!a.Name}"/>
            </apex:pageBlockSection>

            <apex:pageBlockTable value="{!a.Contacts}" var="c">
                <apex:column value="{!c.lastname}"/>
            </apex:pageBlockTable>
            
       </apex:repeat>
    </apex:pageBlock>
</apex:page>
*/