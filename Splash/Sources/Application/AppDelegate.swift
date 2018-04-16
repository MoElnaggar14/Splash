//
//  AppDelegate.swift
//  Splash
//
//  Created by Ivan Glushko on 29.03.18.
//  Copyright © 2018 ivanglushko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let storyboard = UIStoryboard(name: "InitialViewController", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "InitialViewController")
        window?.rootViewController = initialViewController
        
        return true
    }
}
