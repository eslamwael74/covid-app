//
//  CovidRouter.swift
//
//
//  Created by Eslam Wael on 8/14/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import UIKit

class CovidRouter : CovidRouterProtocol {
    
    static func createCovidModule(forCovidState countryName: String) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "CovidViewController")
        if let view = viewController as? CovidViewController {

            let interactor = CovidInteractor()
            let router: CovidRouter = CovidRouter()
            
            let presenter = CovidPresenter(view: view as CovidViewProtocol, interactor: interactor, router: router)
            
            view.presenter = presenter
            presenter.view = view
            presenter.countryName = countryName
            interactor.presenter = presenter
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
