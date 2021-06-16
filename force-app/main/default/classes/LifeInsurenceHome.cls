public class LifeInsurenceHome {
    //public AgentHome(apexpages.StandardController controller){
        
    //}
    public pagereference AddLifeInsurence(){
        pagereference p=new pagereference('/apex/LifeInsuranceApplication');
        return p;
    }
    public pageReference ViewLifeInsurence(){
        pagereference p=new pagereference('/apex/LifeInsuranceView');
        return p;
        
    }
   

}