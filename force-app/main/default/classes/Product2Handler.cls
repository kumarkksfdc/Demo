public class Product2Handler {
    public static void preventProduct2Deletion(List<Product2> Product2List){
        //Id RecordTypeIdKapasPro = Schema.SObjectType.Product2.getRecordTypeInfosByName().get('Kapas').getRecordTypeId();
        //Id RecordTypeIdLintPro = Schema.SObjectType.Product2.getRecordTypeInfosByName().get('Lint').getRecordTypeId();
        //Id RecordTypeIdSeedPro = Schema.SObjectType.Product2.getRecordTypeInfosByName().get('Seed').getRecordTypeId();
        
        //Integer productcount = [select count() from Product2 where RecordTypeId = :RecordTypeIdKapasPro OR RecordTypeId = :RecordTypeIdLintPro OR RecordTypeId = :RecordTypeIdSeedPro];	
        for(Product2 p:Product2List){
            if(p.ProductCode=='GC1040'){
                p.addError('can not delete kapas,Lint and Seed');
            }
        }
    }
    // Record Locking based on condition
    public static void preventProduct2Edit(list<Product2> Product2List,Map<id,Product2> SingleNewMapProduct2){
        for(Product2 p:Product2List){
            if(p.HM__Macaron_Flavor__c=='Vanilla'){
                SingleNewMapProduct2.get(p.Id).addError('msg');
            }
        }
    }
    
}