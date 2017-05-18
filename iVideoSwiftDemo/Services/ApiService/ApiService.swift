 //
 //  ApiService.swift
 //  iVideoSwiftDemo
 //
 // Created by Ramesh Manageni.
 // Copyright (c) 2017 Ramesh Manageni. All rights reserved.
 //
 
 import Foundation
 import Alamofire
 import SwiftyJSON
 
 class ApiService: ApiServiceProtocol {
    //private let cookieKey = "cookieKey"
    //private let csrfTokenKey = "csrf-token"
    //private let mezukaLocationCookieKey = "mezuka_current_location"
    
    /**
     This function constructs an api endpoint with the given parameters
     - parameters:
     - base: Base url
     - params: url segments for endpoint construction
     - returns: API Endpoint
     */
    func constructApiEndpoint(base: String, params: [String]) throws -> String {
        var url: String = base.hasSuffix("/") ? base.substring(to: base.index(before: base.endIndex)) : base
        
        for param in params {
            guard !param.isEmpty else {
                throw EApiErrorType.InvalidParameters
            }
            
            let trimmed = param.trimmingCharacters(in: .whitespacesAndNewlines)
            let pure = trimmed.replacingOccurrences(of: "/", with: "")
            
            url = "\(url)/\(pure)"
        }
        
        return url
    }
    
    /**
     This function constructs an api endpoint with the given parameters
     - parameters:
     - base: Base url
     - params: url segments for endpoint construction
     - returns: API Endpoint
     */
    func constructApiEndpoint(base: String, params: String...) throws -> String {
        return try constructApiEndpoint(base: base, params: params)
    }
    
    /**
     This function constructs an api endpoint with the given parameters
     - parameters:
     - base: Base url
     - params: url segments for endpoint construction
     - queries: query parameters
     - returns: API Endpoint
     */
    func constructApiEndpoint(base: String, params: String..., queries: [String: String]) throws -> String {
        var url: String = try constructApiEndpoint(base: base, params: params)
        
        if queries.count > 0 {
            url = "\(url)?"
            for (key, value) in queries {
                url = "\(url)\(key)=\(value)&"
            }
            url = url.substring(to: url.index(before: url.endIndex)) // remove last & character
        }
        
        return url
    }
    
    func constructHeader() -> [String: String] {
        let headers = [
            "Accept": "application/json, text/plain, */*",
            "Content-Type": "application/json;charset=UTF-8",
            ]
        
        return headers
    }
    
    /**
     This method constructs HTTP header to consume the API
     - parameters:
        - token: JWT Access Token
     - returns: HTTP header as key-value pairs
     */
    func constructHeader(withAccessToken token: String) -> [String: String] {
        var headers = constructHeader()
        
        // Add JWT access token
        headers["Authorization"] = "Bearer \(token)"
        
        return headers
    }
    
    /**
     This method sends a GET request to given url in order to fetch data
     - parameters:
        - url: API Endpoint
        - headers: Required HTTP header
        - callback: The callback handler to provide the result of the fetched data
     */
    func get(url: String, headers: [String : String]?, converter: ((JSON) -> Any)?, callback: @escaping (ECallbackResultType) -> Void) {
        // Send the GET request
        Alamofire.request(url, method: .get, headers: headers).responseJSON { response in
            // Get the status code of response
            if (response.response != nil) {
                let status = response.response!.statusCode;
                
                switch status {
                    
                case EHttpStatusCode.OK.rawValue:
                    // Get the response body
                    if let value = response.result.value {
                        let json = JSON(value)
                        let model = converter!(json)
                        // call callback with no error
                        callback(ECallbackResultType.Success(model))
                    } else {
                        callback(ECallbackResultType.Failure(EApiErrorType.UnknownError))
                    }
                    
                default:
                    callback(ECallbackResultType.Failure(EApiErrorType.UnknownError))
                }
            } else {
                callback(ECallbackResultType.Failure(EApiErrorType.APIEndpointNotAvailable))
            }
        }
    }
 }
