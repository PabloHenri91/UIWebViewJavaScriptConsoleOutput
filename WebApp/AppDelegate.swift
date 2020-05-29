//
//  AppDelegate.swift
//  WebApp
//
//  Created by Pablo Bertaco on 28/05/20.
//  Copyright © 2020 Pablo Bertaco. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
     var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = self.window {
            let navigationController = UINavigationController(rootViewController: ViewController())
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        
        return true
    }

}

