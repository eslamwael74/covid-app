//
//  CountriesProtocol.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import UIKit

protocol CountriesViewProtocol: class {
    
    var presenter: CountriesPresenterProtocol! { get set }
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showError(error: Error)
    
    func reloadData(countries: [Country])
}

protocol CountriesPresenterProtocol: class {
    var view: CountriesViewProtocol? { get set }
    var numberOfRows: Int { get }
    var countries: [Country] { get set }
    func viewDidLoad()
    func searchCountryByName(countryName: String)
    func configure(cell: CountriesCellView, indexPath: IndexPath)
    
    func openCovidStateScreen(countryName: String)
    
}

protocol CountriesRouterProtocol {
    static func createCountriesModule() -> UIViewController
    
    func presentCovidStatesScreen(from view: CountriesViewProtocol, forCovidState countryName: String)

}

protocol CountriesInteractorInputProtocol {
    var presenter: CountriesInteractorOutputProtocol? { get set }
    func getCountries(countryName: String)
}

protocol CountriesInteractorOutputProtocol: class {
    func countriesFetchedSuccessfully(countries: [Country])
    func countriesFetchingFailed(withError error: Error)
}

protocol CountriesCellView {
    func configure(countryModel: Country)
}
