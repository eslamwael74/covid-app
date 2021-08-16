//
//  ApiRouter.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation
import Alamofire

enum CountryRouter: URLRequestConvertible {
    
    case get(countryName: String)
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .get:
            return nil
        }
    }
    
    var url: URL {
        let relativePath : String?
        switch self {
        case .get(let countryName):
            relativePath = Constants.countriesEndpoint(countryName)
        }
        
        var url = URL(string: Constants.countryBaseUrl)!
        if let relativePath = relativePath {
            url = url.appendingPathComponent(relativePath)
        }
        return url
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
