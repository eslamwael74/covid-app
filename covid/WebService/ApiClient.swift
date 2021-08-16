//
//  ApiClient.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation
import Alamofire

public enum Result<T, Failure> where Failure: Error {
    case success(value: T)
    case error(error: Failure)
}

class ApiClient {
    
    //-------------------------------------------------------------------------------------------------
    //MARK: - The request function to get results
    func request<T: Codable> (_ urlConvertible: URLRequestConvertible, completion: @escaping (Result<T, ApiError>) -> Void) {
        //Trigger the HttpRequest using AlamoFire (AF)
        print(urlConvertible.urlRequest?.debugDescription)
        AF.request(urlConvertible).responseDecodable { (response: DataResponse<T, AFError>) in
            //Check the result from Alamofire's response and check if it's a success or a failure
            switch response.result {
            case .success(let value):
                //Everything is fine
                completion(Result.success(value: value))
            case .failure( let error):
                //Something went wrong
                print("xxxxxxxxxxxxx")
                print(error.errorDescription!)

                switch response.response?.statusCode {
                case 403:
                    completion(Result.error(error: ApiError.forbidden))
                case 404:
                    completion(Result.error(error: ApiError.notFound))
                case 409:
                    completion(Result.error(error: ApiError.conflict))
                case 500:
                    completion(Result.error(error: ApiError.internalServerError))
                default:
                    completion(Result.error(error: ApiError.unknownError))
                }
            }
        }
    }
}
