//
//  CountriesRouter.swift
//  covid
//
//  Created by Eslam Wael on 8/14/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import UIKit

class CountriesRouter: CountriesRouterProtocol {
        
    static func createCountriesModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "mainNavigationController")
        
        if let view = navController.children.first as? CountriesViewController {
            let interactor = CountriesInteractor()
            let router = CountriesRouter()
            let presenter = CountriesPresenter(view: view, interactor: interactor, router: router)

            view.presenter = presenter
            presenter.view = view
            interactor.presenter = presenter

            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
     func presentCovidStatesScreen(from view: CountriesViewProtocol, forCovidState countryName: String) {
        let covidViewController = CovidRouter.createCovidModule(forCovidState: countryName)
    
         if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(covidViewController, animated: true)
         }
     }
    
}
