public class MotorInsuranceHome {
    //public AgentHome(apexpages.StandardController controller){
        
    //}
    public pagereference AddMotorInsurance(){
        pagereference p=new pagereference('/apex/MotorInsuranceApplication');
        return p;
    }
    public pageReference ViewMotorInsurance(){
        pagereference p=new pagereference('/apex/MotorInsuranceView');
        return p;
        
    }

}