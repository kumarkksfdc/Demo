public class GetLocationInAccountController
{
    private ApexPages.StandardController standardController;
    public Decimal Lat{get;set;}
    public Decimal Lon{get;set;}
    
    public GetLocationInAccountController(ApexPages.StandardController standardController)
    {
        this.standardController = standardController;
    }
    
    public PageReference  location(){
        ID recordid=standardController.getId();
        System.debug('ID--'+recordid);
        system.debug('Latitude---'+lat);
        System.debug('Longitude-----'+lon);
        list<Account> ss=new list<Account>();
        for(Account s:[select id,name,Geolocation__Latitude__s,Geolocation__Longitude__s from Account where id=:recordid]){
            s.Geolocation__Latitude__s=Lat;
            s.Geolocation__Longitude__s=lon;
            ss.add(s);
        }
        update ss;
        PageReference pageRef = new PageReference('/'+recordid);
        return pageRef.setRedirect(true);
        
    }
    
}