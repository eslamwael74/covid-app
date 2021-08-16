//
//  CovidViewController.swift
//  covid
//
//  Created by Eslam Wael on 8/14/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import UIKit
import PKHUD

class CovidViewController : UIViewController, CovidViewProtocol {
    
    @IBOutlet weak var confiremedLabel: UILabel!
    @IBOutlet weak var recoverdLabel: UILabel!
    @IBOutlet weak var criticalLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    
    var presenter: CovidPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
        
        presenter?.viewDidLoad()
    }
    
    func setupUi() {
        self.title = presenter.countryName
    }
    
    func showLoadingIndicator() {
        HUD.show(.progress)
    }
    
    func hideLoadingIndicator() {
        HUD.hide()
    }
    
    func showCovidStates(covidStates: [CovidState]) {
        setupCovidStates(covidState: covidStates[0])
    }
    
    func setupCovidStates(covidState: CovidState) {
        confiremedLabel.text = "\(covidState.confirmed)"
        recoverdLabel.text = "\(covidState.recovered)"
        criticalLabel.text = "\(covidState.critical)"
        deathsLabel.text = "\(covidState.deaths)"
    }
    
}
