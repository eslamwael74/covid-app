//
//  AppDelegate.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let countriesModule =  CountriesRouter.createCountriesModule()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = countriesModule
        window?.makeKeyAndVisible()
        
        return true
    }

}

