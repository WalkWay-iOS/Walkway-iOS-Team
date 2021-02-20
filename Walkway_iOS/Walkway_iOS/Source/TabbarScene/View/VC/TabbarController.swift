//
//  TabbarController.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    func setTabBar(){
        let myTabbar = self.tabBarController?.tabBar
        UITabBar.appearance().barTintColor = UIColor.gray40
        UITabBar.appearance().tintColor = UIColor.bookmarkDarkBlue
        
        let HomeStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        let homeTab = HomeStoryboard.instantiateViewController(identifier: "HomeVC")
        homeTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
        
        let CourseStoryboard = UIStoryboard.init(name: "CourseSearch", bundle: nil)
        let courseTab = CourseStoryboard.instantiateViewController(identifier: "CourseSearchVC")
        courseTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        let CreateCourseStoryboard = UIStoryboard.init(name: "CreateCourse", bundle: nil)
        let createCourseTab = CreateCourseStoryboard.instantiateViewController(identifier: "CreateCourseVC")
        createCourseTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "pin"), selectedImage: UIImage(systemName: "pin"))

        let AlertStoryboard = UIStoryboard.init(name: "Alert", bundle: nil)
        let alertTab = AlertStoryboard.instantiateViewController(identifier: "AlertVC")
        alertTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bell"), selectedImage: UIImage(systemName: "bell"))
        
        let MypageStoryboard = UIStoryboard.init(name: "Mypage", bundle: nil)
        let mypageTab = MypageStoryboard.instantiateViewController(identifier: "MypageVC")
        mypageTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle"))

        
        let tabs =  [homeTab, courseTab, createCourseTab, alertTab, mypageTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = homeTab
    }
}
