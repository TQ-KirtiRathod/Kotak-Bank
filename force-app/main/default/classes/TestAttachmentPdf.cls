@isTest
public with sharing class TestAttachmentPdf {
       blob attBlob;   
    set<string> setOfId = new set<string>();
    /* @isTest
    public static void testMethod(){
        Attachment objAttach = new Attachment();
        objAttach.OwnerId = UserInfo.getUserId();
        objAttach.Name = 'test.pdf';
        objAttach.ParentId = setOfId; // the record the file is attached to
        objAttach.IsPrivate = true;
        objAttach.Body = attBlob;
        objAttach.ContentType = 'application/pdf';
        insert objAttach;
    }*/

}