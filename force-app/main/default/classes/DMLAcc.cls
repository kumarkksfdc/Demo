public class DMLAcc {
    public account	acc   {set;get;}
    public DMLAcc(){
       acc=new account();
    }
    public pageReference create(){
        integer count=[select count() from account where name=:acc.Name];
        if(count>0){
            Apexpages.Message msg=new apexpages.Message(apexpages.Severity.ERROR,'DUPLICATE RECORD exist');
        	apexpages.addmessage(msg);
            return null;
        }
        else{
            try{
                insert acc;
        			pageReference p=new pageReference('/'+acc.Id);
        			return p;
            }catch(exception e){
                Apexpages.Message msg1=new apexpages.Message(apexpages.Severity.ERROR,'insertion failed');
        	apexpages.addmessage(msg1);
                return null;
                
            }
        }       
    }
}