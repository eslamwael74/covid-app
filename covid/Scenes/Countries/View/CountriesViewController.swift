//
//  ViewController.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import UIKit
import PKHUD

class CountriesViewController: UITableViewController, CountriesViewProtocol {

    
    var presenter: CountriesPresenterProtocol!
    
    @IBOutlet weak var countriesTableView: UITableView!
    @IBOutlet weak var countrySearchBar: UISearchBar!
    
    var countries: [Country] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUi()
        presenter.viewDidLoad()
    }

    private func setupUi() {
        countrySearchBar.delegate = self
        
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
        countriesTableView.tableFooterView = UIView()
        
    }
    
    func showLoadingIndicator() {
        HUD.show(.progress)
    }
    
    func hideLoadingIndicator() {
        HUD.hide()
    }
    
    func reloadData(countries: [Country]) {
        self.countries = countries
        self.countriesTableView.reloadData()
    }
    
    func showError(error: Error) {
        print(error)
        HUD.flash(.error)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        presenter.configure(cell: cell, indexPath: indexPath)
      return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = self.countries[indexPath.row]
        presenter?.openCovidStateScreen(countryName: country.name!)
    }

}

// MARK: - UISearchBarDelegate
extension CountriesViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let countryName = searchBar.text else { return }
    presenter.searchCountryByName(countryName: countryName)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = nil
    searchBar.resignFirstResponder()
    
    presenter.countries = []
    tableView.reloadData()
  }
}

