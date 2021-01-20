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
        
        let HomeStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        let homeTab = HomeStoryboard.instantiateViewController(identifier: "HomeVC")
        homeTab.tabBarItem.title = "홈"
        
        let CourseStoryboard = UIStoryboard.init(name: "CourseSearch", bundle: nil)
        let courseTab = CourseStoryboard.instantiateViewController(identifier: "CourseSearchVC")
        courseTab.tabBarItem.title = "코스검색"
        
        let CreateCourseStoryboard = UIStoryboard.init(name: "CreateCourse", bundle: nil)
        let createCourseTab = CreateCourseStoryboard.instantiateViewController(identifier: "CreateCourseVC")
        createCourseTab.tabBarItem.title = "코스"

        let AlertStoryboard = UIStoryboard.init(name: "Alert", bundle: nil)
        let alertTab = AlertStoryboard.instantiateViewController(identifier: "AlertVC")
        alertTab.tabBarItem.title = "알림"
        
        let MypageStoryboard = UIStoryboard.init(name: "Mypage", bundle: nil)
        let mypageTab = MypageStoryboard.instantiateViewController(identifier: "MypageVC")
        mypageTab.tabBarItem.title = "My"

        
        let tabs =  [homeTab, courseTab, createCourseTab, alertTab, mypageTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = homeTab
    }
}
