//
//  EditKeywordVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class EditKeywordVC: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var viewTitleLabel: UILabel!
    
    var delegate: profilePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - UI
extension EditKeywordVC {
    func setUI() {
        setLabel()
        setButton()
    }
    
    func setLabel() {
        viewTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        viewTitleLabel.text = "키워드 변경"
    }
    
    func setButton() {
        backButton.setTitle("", for: .normal)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitleColor(.systemIndigo, for: .normal)
        backButton.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
    }
}

// MARK: - Action
extension EditKeywordVC {
    @objc func touchUpBack() {
        dismiss(animated: false, completion: nil)
    }
}
