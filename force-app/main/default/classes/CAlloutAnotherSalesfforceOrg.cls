public class CAlloutAnotherSalesfforceOrg {
    public static void getAcc(){
        http http =new Http();
        Httprequest request= new Httprequest();
        request.setEndPoint('callout:SFDCW/services/apexrest/integrationDemo/');
        request.setMethod('GET');
        Httpresponse response=http.send(request);
        System.debug(response.getBody());
        if(response.getStatusCode()==200){
            List<Object> result=( List<Object> )JSON.deserializeUntyped(response.getBody());
            System.debug(result);
            for(Object o:result){
                
                
            }
        }
    }
}