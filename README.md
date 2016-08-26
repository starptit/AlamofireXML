# AlamofireXML

Requirement: Alamofire source -> https://github.com/Alamofire/Alamofire

Sample Useage:
let path = "http://services.odata.org/OData/OData.svc/"
        
        AlamofireXML.request(.GET, path, parameters: nil, headers: nil)
            .response {
                
                (request, response, returnData, error) in
                if error != nil {
                    
                    print("Error = \(error)")
                    
                } else {
                    if returnData != nil {
                        
                        let string = String (data: returnData!, encoding: NSUTF8StringEncoding)
                        
                        print("Response = \(string)")
                        
                        
                    }else {
                        print("Response nil data")
                    }
                }
        }
