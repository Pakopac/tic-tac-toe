//
//  AppDelegate.swift
//  tic-tac-toe
//
//  Created by SUPINT_12 on 18/06/2019.
//  Copyright © 2019 SUPINT_12. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        TTTSocketWrapper.shared.disconnect()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        TTTSocketWrapper.shared.connect()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        TTTSocketWrapper.shared.connect()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        TTTSocketWrapper.shared.disconnect()
    }


}

