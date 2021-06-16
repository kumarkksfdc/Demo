public class Inbound  implements messaging.InboundEmailHandler {
    public messaging.InboundEmailResult handleinboundemail(messaging.InboundEmail rty,messaging.InboundEnvelope xyz){
        messaging.InboundEmailResult im=new messaging.InboundEmailResult();
            contact c=new contact();
            c.LastName='gvghd';
            c.im__c=im.success;
            insert c;
        
       
        return im;
    }
}