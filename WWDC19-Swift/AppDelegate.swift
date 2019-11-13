//
//  AppDelegate.swift
//  WWDC19-Swift
//
//  Created by LiYong on 10.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }
}

