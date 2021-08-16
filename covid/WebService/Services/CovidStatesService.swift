//
//  CovidStatesService.swift
//  covid
//
//  Created by Eslam Wael on 8/14/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation

class CovidStatesService {
    
    private let apiClient = ApiClient()
    
    func getCovidStatesByCountryName(countryName: String, completionHandler: @escaping (Result<[CovidState], ApiError>) -> ()) {
        apiClient.request(CovidStatesRouter.get(["name": countryName]), completion: completionHandler)
    }
    
}
