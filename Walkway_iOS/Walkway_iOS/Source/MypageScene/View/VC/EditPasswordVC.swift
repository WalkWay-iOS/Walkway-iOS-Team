//
//  EditPasswordVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class EditPasswordVC: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var viewTitleLabel: UILabel!
    @IBOutlet var editInfoLabel: UILabel!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var editInfoLabel2: UILabel!
    @IBOutlet var newPasswordTextField: UITextField!
    @IBOutlet var newPasswordCheckTextField: UITextField!
    @IBOutlet var passwordInfoLabel: UILabel!
    @IBOutlet var editButton: UIButton!
    
    var delegate: profilePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - UI
extension EditPasswordVC {
    func setUI() {
        setLabel()
        setButton()
    }
    
    func setLabel() {
        viewTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        viewTitleLabel.text = "비밀번호 변경"
        editInfoLabel.font = .systemFont(ofSize: 15, weight: .medium)
        editInfoLabel.text = "현재 비밀번호를 입력하세요. "
        editInfoLabel2.font = .systemFont(ofSize: 15, weight: .medium)
        editInfoLabel2.text = "새로운 비밀번호를 입력하세요. "
        passwordInfoLabel.font = .systemFont(ofSize: 10, weight: .regular)
        passwordInfoLabel.textColor = .lightGray
        passwordInfoLabel.text = "비밀번호는 6자리 이상 영어, 숫자를 조합하여 설정해주세요.\n\n안전한 계정 사용을 위해 비밀번호는 주기적으로 변경해주세요."
    }
    
    func setButton() {
        backButton.setTitle("", for: .normal)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitleColor(.systemIndigo, for: .normal)
        backButton.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
        checkButton.setTitle("확인", for: .normal)
        checkButton.backgroundColor = .systemIndigo
        checkButton.setTitleColor(.white, for: .normal)
        checkButton.layer.cornerRadius = 10
        editButton.setTitle("변경", for: .normal)
        editButton.backgroundColor = .systemIndigo
        editButton.setTitleColor(.white, for: .normal)
        editButton.layer.cornerRadius = 10
    }
}

// MARK: - Action
extension EditPasswordVC {
    @objc func touchUpBack() {
        dismiss(animated: false, completion: nil)
    }
}
