//
//  MyBadgeListVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/15.
//

import UIKit

class MyBadgeListVC: UIViewController {

    @IBOutlet var viewTitleLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    
    var delegate: myPagePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - UI
extension MyBadgeListVC {
    func setUI() {
        setLabel()
        setButton()
    }
    
    func setLabel() {
        viewTitleLabel.font = .boldSystemFont(ofSize: 20)
        viewTitleLabel.text = "나의 뱃지"
    }
    
    func setButton() {
        backButton.setTitle("", for: .normal)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
    }
}

// MARK: - Action
extension MyBadgeListVC {
    @objc func touchUpBack() {
        dismiss(animated: false, completion: nil)
    }
}
