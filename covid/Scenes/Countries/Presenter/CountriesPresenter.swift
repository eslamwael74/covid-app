//
//  CountriesPresenter.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation

class CountriesPresenter : CountriesPresenterProtocol, CountriesInteractorOutputProtocol{
    weak var view: CountriesViewProtocol?
    private let interactor: CountriesInteractorInputProtocol
    private let router: CountriesRouterProtocol
    var countries = [Country]()
    
    var numberOfRows: Int {
        return countries.count
    }
    
    init(view: CountriesViewProtocol, interactor: CountriesInteractorInputProtocol, router: CountriesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {}
    
    
    func openCovidStateScreen(countryName: String) {
        router.presentCovidStatesScreen(from: view!, forCovidState: countryName)
    }
    
    
    func searchCountryByName(countryName: String) {
        view?.showLoadingIndicator()
        interactor.getCountries(countryName: countryName)
    }
    
    func configure(cell: CountriesCellView, indexPath: IndexPath) {
        let country = countries[indexPath.row]
        cell.configure(countryModel: country)
    }
    
    
    func countriesFetchedSuccessfully(countries: [Country]) {
        view?.hideLoadingIndicator()
        self.countries = countries
        view?.reloadData(countries: countries)
    }
    
    func countriesFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
        view?.showError(error: error)
    }
    
    
}
