public class AttachmentPdf {
@future(callout = true)
    public static void generatePdf(Set <String> setOfIds) {
       // setOfIds=ApexPages.currentPage().getParameters().get('Id');
        List <Attachment> listOfAttach = new List <Attachment>();
        List<Case> caseList = new List<Case>();
        caseList = [SELECT ID,New_Case_Number__c  
                      FROM Case
                     WHERE Id IN: setOfIds];
        for (String caseId: setOfIds) {
            //PageReference pdf = Page.pdfGenerator1;
            PageReference pdf = Page.BoardNoteFormat3;
            PDf.getParameters().put('Id',caseId);
            Attachment attach = new Attachment();
            //attach.ParentId = caseId;
            attach.name = 'Board Note Document.pdf';
            try {
               attach.body = pdf.getContentAsPDF();  
            }catch(Exception ex){
                try {
                    attach.body = pdf.getContentAsPDF(); 
                }catch(Exception ex1){
                    attach.body = pdf.getContentAsPDF(); 
                }
                 
            }
           
            attach.ParentId = caseId;
            listOfAttach.add(attach); 
        } 
        if (listOfAttach.size() > 0)
        { 
            insert listOfAttach;
        }
    }
}