//
//  CountryCell.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import UIKit

class CountryCell : UITableViewCell, CountriesCellView {

    
    @IBOutlet weak var name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(countryModel: Country) {
        name.text = countryModel.name
    }
    
}
