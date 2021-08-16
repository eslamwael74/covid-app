//
//  CountryService.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation
import Alamofire

class CountryService {
    
    private let apiClient = ApiClient()
    
    func getCountries(countryName: String, completionHandler: @escaping (Result<[Country], ApiError>) -> ()) {
        apiClient.request(CountryRouter.get(countryName: countryName), completion: completionHandler)
    }
    
}
