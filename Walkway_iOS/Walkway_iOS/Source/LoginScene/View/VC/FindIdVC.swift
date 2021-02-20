//
//  FindIdVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/29.
//

import UIKit

class FindIdVC: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var idTitleLabel: UILabel!
    @IBOutlet weak var idInfoLabel: UILabel!
    @IBOutlet weak var pwTitleLabel: UILabel!
    @IBOutlet weak var pwInfoLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwIdTextField: UITextField!
    @IBOutlet weak var pwEmailTextField: UITextField!
    @IBOutlet weak var idButton: UIButton!
    @IBOutlet weak var pwButton: UIButton!
    
    var checkIdValidate = false
    var checkPWValidate = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboard()
        setUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - TextField
extension FindIdVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let move = CGAffineTransform(translationX: 0, y: -150)
        UIView.animate(withDuration: 0.2, animations: {
            self.logoImage.transform = move
            self.idTitleLabel.transform = move
            self.idInfoLabel.transform = move
            self.idTextField.transform = move
            self.idButton.transform = move
            self.pwTitleLabel.transform = move
            self.pwInfoLabel.transform = move
            self.pwIdTextField.transform = move
            self.pwEmailTextField.transform = move
            self.pwButton.transform = move
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2, animations: {
            self.logoImage.transform = .identity
            self.idTitleLabel.transform = .identity
            self.idInfoLabel.transform = .identity
            self.idTextField.transform = .identity
            self.idButton.transform = .identity
            self.pwTitleLabel.transform = .identity
            self.pwInfoLabel.transform = .identity
            self.pwIdTextField.transform = .identity
            self.pwEmailTextField.transform = .identity
            self.pwButton.transform = .identity
        })
    }
    
    func checkValidateUI(){
        // 아이디 찾기
        if idTextField.text!.validateEmail() {
            checkIdValidate = true
        }
        else{
            checkIdValidate = false
        }
        
        if !(idTextField.text!.isEmpty) && checkIdValidate{
            idButton.isEnabled = true
            idButton.backgroundColor = .bookmarkDarkBlue
        }
        else{
            idButton.isEnabled = false
            idButton.backgroundColor = .gray60
        }
        
        // 비밀번호 찾기
        if pwEmailTextField.text!.validateEmail() {
            checkPWValidate = true
        }
        else{
            checkPWValidate = false
        }
        
        if !(pwIdTextField.text!.isEmpty) && !(pwEmailTextField.text!.isEmpty) && checkPWValidate {
            pwButton.isEnabled = true
            pwButton.backgroundColor = .bookmarkDarkBlue
        }
        else{
            pwButton.isEnabled = false
            pwButton.backgroundColor = .gray60
        }
    }
}

// MARK: - UI
extension FindIdVC {
    private func setUI() {
        setNavigation()
        setLabel()
        setButton()
        setTextField()
        setTextFieldAction()
    }
    
    private func setNavigation() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .bookmarkDarkBlue
    }
    
    private func setLabel() {
        idTitleLabel.text = "아이디 찾기"
        idTitleLabel.font = .myBoldSystemFont(ofSize: 25)
        
        idInfoLabel.text = "아이디를 가입하신 이메일로 발송합니다"
        idInfoLabel.font = .myRegularSystemFont(ofSize: 13)
        
        pwTitleLabel.text = "비밀번호 찾기"
        pwTitleLabel.font = .myBoldSystemFont(ofSize: 25)
        
        pwInfoLabel.text = "임시 비밀번호를 가입하신 이메일로 발송합니다"
        pwInfoLabel.font = .myRegularSystemFont(ofSize: 13)
    }
    
    private func setButton() {
        idButton.setTitle("이메일 발송", for: .normal)
        idButton.setTitleColor(.white, for: .normal)
        idButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        idButton.backgroundColor = .gray60
        idButton.layer.cornerRadius = 19
        idButton.isEnabled = false
        idButton.addTarget(self, action: #selector(touchUpFindId), for: .touchUpInside)
        
        pwButton.setTitle("이메일 발송", for: .normal)
        pwButton.setTitleColor(.white, for: .normal)
        pwButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        pwButton.backgroundColor = .gray60
        pwButton.layer.cornerRadius = 19
        pwButton.isEnabled = false
        pwButton.addTarget(self, action: #selector(touchUpFindPW), for: .touchUpInside)
    }
    
    private func setTextField() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: idTextField.frame.size.height-3, width: idTextField.frame.width-40, height: 1)
        border.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5).cgColor
        idTextField.layer.addSublayer(border)
        idTextField.setLeftPaddingPoints(10)
        idTextField.placeholder = "이메일 입력"
        idTextField.borderStyle = .none
        
        let border1 = CALayer()
        border1.frame = CGRect(x: 0, y: idTextField.frame.size.height-3, width: idTextField.frame.width-40, height: 1)
        border1.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5).cgColor
        pwIdTextField.layer.addSublayer(border1)
        pwIdTextField.setLeftPaddingPoints(10)
        pwIdTextField.placeholder = "아이디 입력"
        pwIdTextField.borderStyle = .none
        pwIdTextField.delegate = self
        
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: idTextField.frame.size.height-3, width: idTextField.frame.width-40, height: 1)
        border2.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5).cgColor
        pwEmailTextField.layer.addSublayer(border2)
        pwEmailTextField.setLeftPaddingPoints(10)
        pwEmailTextField.placeholder = "이메일 입력"
        pwEmailTextField.borderStyle = .none
        pwEmailTextField.delegate = self
    }
    
    private func setTextFieldAction() {
        idTextField.addTarget(self, action: #selector(changeEmailTextfiledUI), for: .allEditingEvents)
        pwEmailTextField.addTarget(self, action: #selector(changeEmailTextfiledUI), for: .allEditingEvents)
    }
}

// MARK: - Action
extension FindIdVC {
    @objc func touchUpFindId() {
        print("아이디")
    }
    
    @objc func touchUpFindPW() {
        print("비밀번호")
    }
    
    @objc func changeEmailTextfiledUI(){
        print("하고있ㄴㄴ겨?")
        checkValidateUI()
    }
}

//MARK: Keyboard
extension FindIdVC {
    private func setKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissGestureKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissGestureKeyboard() {
        view.endEditing(true)
    }
}
