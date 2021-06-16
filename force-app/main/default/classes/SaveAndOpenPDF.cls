public with sharing class SaveAndOpenPDF {
    
    private Id contact;
    
    public SaveAndOpenPDF(ApexPages.StandardController controller){
        contact=controller.getRecord().id;
    }
    /* public SaveAndOpenPDF(){
contact = [SELECT Id, FirstName, LastName FROM Contact WHERE Id ='0037F0000028QLqQAM'];//:ApexPages.currentPage().getParameters().get('id')]; 
}   */ 
    
    /*public void SaveAndOpenPDF1(){
contact = [SELECT Id, FirstName, LastName FROM Contact WHERE Id =:ApexPages.currentPage().getParameters().get('id')]; 

} */
    public Id getContact() {
        return contact;
    }
    public String recordId {
        get {
            return ApexPages.currentPage().getParameters().get('Id');
        }
    }
    
    // this is to make testing a lot easier -- simply append renderAs=html
    // to the url parameters to test, add displayOnly=1 if you don't want to save
    public String renderAs {
        get {
            if (String.isBlank(ApexPages.currentPage().getParameters().get('renderAs'))) {
                return 'pdf';
            } else {
                return ApexPages.currentPage().getParameters().get('renderAs');
            }
        }
    }
    
    public PageReference saveAndOpenPDF() {
        if (String.isBlank(ApexPages.currentPage().getParameters().get('displayOnly'))) {
            Id attachmentId = savePDF();
            //return openPDF(attachmentId);
            //} 
            //else {
            
        }
        return null;
    }
    
    public Id savePDF() {
        Attachment attachment = new Attachment();
        attachment.ParentId = recordId;
        attachment.name = 'PDF_'+String.valueof(Datetime.now())+'.pdf';
        PageReference pdf = Page.GeneratePDF;
        pdf.getParameters().put('Id', recordId);
        pdf.getParameters().put('displayOnly', '1');
        pdf.setRedirect(true);
        try {
            attachment.Body = pdf.getContent();
        }
        catch (VisualForceException e) {
            attachment.Body = Blob.valueof('There was an error.');
        }
        attachment.ContentType = 'application/pdf';
        insert attachment;
        blob b=pdf.getContent();
        String csvString = b.toString();
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        // Set recipients to two contact IDs.
        // Replace IDs with valid record IDs in your org.
        message.toAddresses = new String[] { 'kumar450k@gmail.com'};
            message.optOutPolicy = 'FILTER';
        message.subject = 'Opt Out Test Message';
        message.plainTextBody = EncodingUtil.Base64Encode(attachment.Body);
        Messaging.SingleEmailMessage[] messages = 
            new List<Messaging.SingleEmailMessage> {message};
                Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: '
                         + results[0].errors[0].message);
        }
        
        
        return attachment.Id;
    }
    
    /*public PageReference openPDF(Id attachmentId) {
PageReference ret = new PageReference('/servlet/servlet.FileDownload?file=' + attachmentId);
ret.setRedirect(true);
return ret;
}*/
}