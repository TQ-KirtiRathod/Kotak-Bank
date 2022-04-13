public class cls_CmpApprovalURL {
    public String recID {get; set;}
      public String urlStr{
         get{
           return cls_createApprovalURL.generateApprovalURL(recID);
         }
      }

}