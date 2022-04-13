public class emailattachmentUE {
public string caseId;
public string attid;
public Map<String,String> urlMap=new Map<String,String>();
public List<Attachment> attach;


public string getCaseid() {
return null;
}

public void setCaseid(String s) {
caseId=s;
}

public Map<String,String> getattach() {
attach=[Select id,name From Attachment Where Parentid=:caseId];

for(Attachment att1:attach) {
String urls=URL.getSalesforceBaseURL().toExternalForm()+'/servlet/servlet.FileDownload?file='+att1.id ;
urlMap.put(urls,att1.Name);
}
return urlMap;
}

public void setattach(List<Attachment> ata) {
attach=ata;
}
/*public static void sendSingleMail(Id caseId){
            EmailTemplate emailTemplate = [SELECT Id, Name, Subject, Body FROM EmailTemplate WHERE Name ='UE INTIMATION MAIL ALERT TRIGGER TEMPLATE 3'];      
            case c = [Select Id,Sub_Department__c,Identified_At__c,Name_of_Branch__c,New_Case_Number__c,
                      Nature_of_Events__c,Total_amount_involved__c,Date_of_Detection__c,Brief_History__c
                      FROM case WHERE Id=: caseId];
       
    }*/

}