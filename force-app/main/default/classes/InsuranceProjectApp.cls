public class InsuranceProjectApp {
    public pagereference Agent(){
        pagereference p=new pagereference('/apex/AgentHomePage');
        return p;
    }
    public pagereference PolicyHolder(){
        pagereference p=new pagereference('/apex/PolicyHolderHomePage');
        return p;
    }
    public pagereference MotorInsuranceHome(){
        pagereference p=new pagereference('/apex/MotorInsuranceHome');
        return p;
    } 			
    public pagereference LifeInsuranceHome(){
        pagereference p=new pagereference('/apex/LifeInsuranceHomepage');
        return p;
    } 
}