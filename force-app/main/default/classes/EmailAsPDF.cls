public class EmailAsPDF {
    public void sendattachment(){
        messaging.SingleEmailMessage sm=new messaging.SingleEmailMessage();
        list<string> toadd=new list<string>{'kankarikumar927@gmail.com'};
        sm.settoaddresses(toadd);
        sm.setsubject('File Attachment');
        sm.setplaintextbody('find the below attachments');
        messaging.EmailAttachment ef=new messaging.EmailAttachment();
        pagereference p=page.page;
        blob body=p.getContentAsPDF();
        ef.setbody(body);
        ef.setfilename('monthly statement.pdf');
        list<messaging.EmailAttachment> attch=new list<messaging.EmailAttachment>{ef};
            
            list<messaging.Email> emails=new list<messaging.Email>{sm};
                messaging.sendEmail(emails);
    }

}

//EmailAsPDF p=new EmailAsPDF();
//p.sendattachment();
//
//