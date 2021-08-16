//
//  CovidInteractor.swift
//  covid
//
//  Created by Eslam Wael on 8/14/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation

class CovidInteractor : CovidInteractorInputProtocol {
    
    weak var presenter: CovidInteractorOutputProtocol?
    
    private let covidStatesService = CovidStatesService()
    
    func getCovidStatesByCountryName(countryName: String) {
        covidStatesService.getCovidStatesByCountryName(countryName: countryName, completionHandler: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let covidStates) :
                self.presenter?.covidStatesFetchedSuccessfully(covidStates: covidStates)
            case .error(let error) :
                self.presenter?.covidStatesFetchingFailed(withError: error)
            }
        })
    }
    
    
    
    
}
