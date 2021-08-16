//
//  CovidPresenter.swift
//  covid
//
//  Created by Eslam Wael on 8/14/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation

class CovidPresenter : CovidPresenterProtocol, CovidInteractorOutputProtocol {

    weak var view: CovidViewProtocol?
    private let interactor: CovidInteractorInputProtocol
    private let router: CovidRouterProtocol
    private var covidStates = [CovidState]()
    var countryName: String?

    init(view: CovidViewProtocol, interactor: CovidInteractorInputProtocol,router: CovidRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getCovidStatesByCountryName(countryName: countryName!)
    }

    func covidStatesFetchedSuccessfully(covidStates: [CovidState]) {
        view?.hideLoadingIndicator()
        self.covidStates = covidStates
        view?.showCovidStates(covidStates: covidStates)
    }
    
    func covidStatesFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
    }
    

}
