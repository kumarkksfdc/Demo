public class AgentHome {
    //public AgentHome(apexpages.StandardController controller){
        
    //}
    public pagereference AddAgent(){
        pagereference p=new pagereference('/apex/AgentCrreation');
        return p;
    }
    public pageReference ViewAgent(){
        pagereference p=new pagereference('/apex/AgentView');
        return p;
        
    }
    
    
}