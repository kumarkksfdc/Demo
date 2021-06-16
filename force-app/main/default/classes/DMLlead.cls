public class DMLlead {
    
    String baseURL = URL.getSalesforceBaseUrl().toExternalForm(); 
    
    public lead	ld   {set;get;}
    public DMLlead(){
       ld=new lead();
    }
    public pageReference create(){
        integer count=[select count() from lead where lastname=:ld.lastname];
        if(count>0){
            Apexpages.Message msg=new apexpages.Message(apexpages.Severity.ERROR,'DUPLICATE RECORD exist');
        	apexpages.addmessage(msg);
            return null;
        }
        else{
            try{
                insert ld;
        			pageReference p=new pageReference('/'+ld.Id);
        			return p;
            }catch(exception e){
                Apexpages.Message msg1=new apexpages.Message(apexpages.Severity.ERROR,'insertion failed');
        	apexpages.addmessage(msg1);
                return null;
                
            }
        }       
    }
}