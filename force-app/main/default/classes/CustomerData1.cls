public class CustomerData1 { 
    public ICICIBank bank {set;get;}
    public Address1 add    {set;get;}
    public CustomerData1(){
        bank=new ICICIBank();
        bank.customername='KUMAR';
        bank.amount=1000;
        bank.deposit();
        bank.withdrawal();
        
        add=new Address1();
        add.city='HYDERABAD';
        add.State='TELANGANA';
        add.pincode='501501'; 
             
    }    
}