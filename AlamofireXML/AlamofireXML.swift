//
//  AlamofireXML.swift
//  TestAlamofireXML
//
//  Created by _Genesis_ on 8/26/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit
import Alamofire


extension Manager{
    
    public func requestXML(method:Alamofire.Method, _ URLString: URLStringConvertible, parameters:String?, headers:[String: String]?) -> Request{
        
        let mutableURLRequest = NSMutableURLRequest(URL: NSURL(string: URLString.URLString)!)
        mutableURLRequest.HTTPMethod = method.rawValue
        
        mutableURLRequest.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        if let xmlParams = parameters {
        
            mutableURLRequest.setValue("\(xmlParams.characters.count)", forHTTPHeaderField: "Content-Length")
        }
        
        if let headers = headers {
            for (headerField, headerValue) in headers {
                mutableURLRequest.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        
        let encodedURLRequest = encodingXML(mutableURLRequest, parametersXML: parameters).0
        
        return request(encodedURLRequest)
        
    }
    
    public func encodingXML(URLRequest: URLRequestConvertible,
                            parametersXML:String?) -> (NSMutableURLRequest,NSError?){
        
        let mutableURLRequest = URLRequest.URLRequest
        
        guard let parameters = parametersXML else {
            return (mutableURLRequest, nil)
        }
        
        let encodingError:NSError? = nil
        
        mutableURLRequest.HTTPBody = parameters.dataUsingEncoding(NSUTF8StringEncoding)
        
        return (mutableURLRequest, encodingError)
    }

}

public func request(
    method: Alamofire.Method,
    _ URLString: URLStringConvertible,
      parameters: String?,
      headers: [String: String]? = nil)
    -> Request
{
    return Manager.sharedInstance.requestXML(
        method,
        URLString,
        parameters: parameters,
        headers: headers
    )
}
