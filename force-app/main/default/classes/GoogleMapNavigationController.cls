public class GoogleMapNavigationController {
    
     @AuraEnabled
    public static List<Account> fetchAccounts(){
           return [SELECT
                Id, Name,Geolocation__Latitude__s,Geolocation__Longitude__s
                FROM Account limit 10];
        }
}