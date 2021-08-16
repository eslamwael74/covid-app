//
//  CovidProtocol.swift
//  covid
//
//  Created by Eslam Wael on 8/14/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import UIKit

protocol CovidViewProtocol : class{
    var presenter: CovidPresenterProtocol! { get set }
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showCovidStates(covidStates: [CovidState])
}

protocol CovidPresenterProtocol {
    var view: CovidViewProtocol? { get set }
    var countryName: String? { get set }
    func viewDidLoad()
}

protocol CovidRouterProtocol {
    static func createCovidModule(forCovidState countryName: String) -> UIViewController
}

protocol CovidInteractorInputProtocol {
    var presenter: CovidInteractorOutputProtocol? { get set }
    func getCovidStatesByCountryName(countryName: String)
}

protocol CovidInteractorOutputProtocol: class {
    func covidStatesFetchedSuccessfully(covidStates: [CovidState])
    func covidStatesFetchingFailed(withError error: Error)
}
