//
//  CourseRunningTabVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/01/29.
//

import UIKit

class CourseRunningTabVC: UIViewController {

    private let pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal)
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        
        pc.currentPageIndicatorTintColor = .purple
        pc.pageIndicatorTintColor = .gray
        pc.translatesAutoresizingMaskIntoConstraints = false
        
        return pc
    }()
    
    /*override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func setPageViewController() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
    
    private func setPageControl() {
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

/*extension CourseRunningTabVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
    }
    
    
}

extension CourseRunningTabVC: UIPageViewControllerDelegate {
    
}*/
