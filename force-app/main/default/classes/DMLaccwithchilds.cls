public class DMLaccwithchilds {
    public account acc		        {set;get;}
    public contact con				{set;get;}
    public opportunity    opty		{set;get;}
    public DMLaccwithchilds(){
        acc=new account();
        con=new contact();
        opty=new opportunity();
    }
    public pageReference create(){
        try{	
            		insert acc;
               		con.accountId=acc.Id;
                	insert con;
                	opty.accountId=acc.Id;
                	insert opty;
               	    pageReference p=new pageReference('/'+acc.Id);
               	return p;   
            }catch(exception e){
                apexpages.Message msg1=new apexpages.Message(apexpages.Severity.error,'insertion failed');
            apexpages.addMessage(msg1);
            return null;
         }
    }
}