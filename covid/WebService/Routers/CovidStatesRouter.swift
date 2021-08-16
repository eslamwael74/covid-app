//
//  CovidRouter.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation
import Alamofire

enum CovidStatesRouter: URLRequestConvertible {
    
    case get([String: Any])
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .get(let countryParams):
            return countryParams
        }
    }
    
    var url: URL {
        let relativePath : String?
        switch self {
        case .get( _):
            relativePath = Constants.covidEndpoint
        }
        
        var url = URL(string: Constants.covidBaseUrl)!
        if let relativePath = relativePath {
            url = url.appendingPathComponent(relativePath)
        }
        return url
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var urlEncoding: URLEncoding {
        return URLEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        
        urlRequest.setValue(Constants.CovidKeysHeaderField.rapidApiKey.rawValue, forHTTPHeaderField: Constants.CovidKeysHeader.rapidApiKey.rawValue)
        
        
        urlRequest.setValue(Constants.CovidKeysHeaderField.rapidApiHost.rawValue, forHTTPHeaderField: Constants.CovidKeysHeader.rapidApiHost.rawValue)
              
        
        print("ssssssss")
        print(urlRequest.headers.description)
        
        let params = parameters
        
        return try urlEncoding.encode(urlRequest, with: params)
    }
}
