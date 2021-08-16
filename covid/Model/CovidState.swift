//
//  CovidState.swift
//  covid
//
//  Created by Eslam Wael on 8/14/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation

struct CovidState: Codable {
    var country, code: String
    var confirmed, recovered, critical, deaths: Int
}
