//
//  AppDelegate.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit
import GoogleMaps
import GooglePlaces

protocol UserIdentifyInterface {
    func checkUserToken()
    func setUserToken()
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var usertoken: String?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GMSServices.provideAPIKey("AIzaSyDrlCCaiAEARHOGpiR_oZUdvZzcASVnO_Q")
        GMSPlacesClient.provideAPIKey("AIzaSyDrlCCaiAEARHOGpiR_oZUdvZzcASVnO_Q")
        
        setUserToken()
        checkUserToken()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: UserIdentifyInterface {
    func setUserToken() {
        //
    }
    
    func checkUserToken() {
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//
//        if Login.shared.isLogin() {
//            let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
//            let initialViewController = storyboard.instantiateViewController(identifier: "TabbarController")
//            self.window?.rootViewController = initialViewController
//            self.window?.makeKeyAndVisible()
//        } else {
//            let initialViewController = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
//            self.window?.rootViewController = initialViewController
//            self.window?.makeKeyAndVisible()
//        }
    }
    
}
