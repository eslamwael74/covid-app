//
//  CountriesInteractor.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation

class CountriesInteractor : CountriesInteractorInputProtocol {

    weak var presenter: CountriesInteractorOutputProtocol?
    
    private let countryService = CountryService()
    
    
    func getCountries(countryName: String) {
        countryService.getCountries(countryName: countryName, completionHandler: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let countries) :
                self.presenter?.countriesFetchedSuccessfully(countries: countries)
            case .error(let error) :
                self.presenter?.countriesFetchingFailed(withError: error)
            }
        })
    }
    
}
