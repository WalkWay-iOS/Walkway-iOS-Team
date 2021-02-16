//
//  EditEmailVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class EditEmailVC: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var viewTitleLabel: UILabel!
    @IBOutlet var editInfoLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var isCorrectLabel: UILabel!
    @IBOutlet var editButton: UIButton!
    
    var delegate: profilePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - UI
extension EditEmailVC {
    func setUI() {
        setLabel()
        setButton()
    }
    
    func setLabel() {
        viewTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        viewTitleLabel.text = "이메일 변경"
        editInfoLabel.font = .systemFont(ofSize: 15, weight: .medium)
        editInfoLabel.text = "변경할 이메일을 입력해주세요. "
        isCorrectLabel.font = .systemFont(ofSize: 10, weight: .regular)
        isCorrectLabel.textColor = .lightGray
        isCorrectLabel.text = "입력 없음"
    }
    
    func setButton() {
        backButton.setTitle("", for: .normal)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitleColor(.systemIndigo, for: .normal)
        backButton.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
        editButton.setTitle("변경", for: .normal)
        editButton.backgroundColor = .systemIndigo
        editButton.setTitleColor(.white, for: .normal)
        editButton.layer.cornerRadius = 10
    }
}

// MARK: - Action
extension EditEmailVC {
    @objc func touchUpBack() {
        dismiss(animated: false, completion: nil)
    }
}
