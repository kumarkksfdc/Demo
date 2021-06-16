public class DML {
    public account acc		{set;get;}
    public DML(){
        acc=new account();
    }
    public pageReference create(){
        integer count=[select count() from account where phone=:acc.phone];
        if(count>0){
            apexpages.Message msg=new apexpages.message(apexpages.Severity.error,'duplicate record exist');
            apexpages.addmessage(msg);
            return null;
        }else{
            try{
                insert acc;
                PageReference p=new PageReference('/'+acc.Id);
        		return p;
            }
            catch(Exception e){
                Apexpages.Message msg1=new Apexpages.Message(ApexPages.Severity.Error,e.getMessage());
                Apexpages.addmessage(msg1);
                return null;
            }
        
 			
        }	
    }
}