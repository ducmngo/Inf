//
//  AppDelegate.swift
//  InfinitePlayerList
//
//  Created by Duc Minh Ngo on 2018-03-29.
//  Copyright © 2018 Duc Ngo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let playerList = PlayerList()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Create a list of soccer players
        //let playerList = PlayerList()
        
        //Creae an ImageStore
        let imageStore = ImageStore()
        
        //Access the PlayersViewController and set its player list
        //let playersController = window!.rootViewController as! PlayersViewController
        let navController = window!.rootViewController as! UINavigationController
        let playersController = navController.topViewController as! PlayersViewController
        playersController.playerList = playerList
        playersController.imageStore = imageStore
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        let success = playerList.saveChanges()
        if (success) {
            print("Saved all of the Players")
        } else {
            print("Couldn't save any of the Players")
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

