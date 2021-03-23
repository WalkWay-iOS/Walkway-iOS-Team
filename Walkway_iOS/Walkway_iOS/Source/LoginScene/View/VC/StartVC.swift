//
//  StartVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/23.
//

import UIKit

class StartVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [self] in
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let dvc = storyboard.instantiateViewController(identifier: "startNavi")
            dvc.modalPresentationStyle = .fullScreen
            self.present(dvc, animated: true, completion: nil)
        })
    }
}
