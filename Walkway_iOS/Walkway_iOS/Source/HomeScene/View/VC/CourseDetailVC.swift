//
//  CourseDetailVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/24.
//

import UIKit

class CourseDetailVC: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
}
