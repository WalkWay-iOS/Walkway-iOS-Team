//
//  SignUpVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/29.
//

import UIKit
import Moya

class SignUpVC: UIViewController {
    private let authProvider = MoyaProvider<LoginServices>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var userData: SignupModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailWarningLabel: UILabel!
    @IBOutlet weak var passwordWarningLabel: UILabel!
    @IBOutlet weak var nameWarningLabel: UILabel!
    @IBOutlet weak var confirmWarningLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPWTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    
    var checkValidate = false
    var isName = false
    var isEmail = false
    
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
extension SignUpVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        nameWarningLabel.text = ""
        if (string == " ") {
            nameWarningLabel.text = "공백은 입력할 수 없어요!"
            return false
        }
        
        if textField.isFirstResponder {
            let validString = CharacterSet(charactersIn: "!@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢")
            if string.rangeOfCharacter(from: validString) != nil {
                nameWarningLabel.text = "특수문자는 입력할 수 없어요!"
                return false
            }
        }
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        if !updatedText.isEmpty {
            if updatedText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count <= 7{
                if !(nameTextField.text!.isEmpty) && !(emailTextField.text!.isEmpty) && !(passwordTextField.text!.isEmpty) && !(confirmPWTextField.text!.isEmpty) && checkValidate {
                }
                return true
            }
            else{
                nameWarningLabel.text = "최대 6글자의 단어만 입력 가능해요!"
                return false
            }
        }
        else{
            return true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
    }
    
    func checkValidateUI(){
        if (passwordTextField.text == confirmPWTextField.text) && (emailTextField.text!.validateEmail()) && (passwordTextField.text!.validatePassword()){
            checkValidate = true
        }
        else{
            checkValidate = false
        }
        
        if !(idTextField.text!.isEmpty) && !(nameTextField.text!.isEmpty) && !(emailTextField.text!.isEmpty) && !(passwordTextField.text!.isEmpty) && !(confirmPWTextField.text!.isEmpty) && checkValidate{
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = .bookmarkDarkBlue
        }
        else{
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = .gray60
        }
    }
}

// MARK: - UI
extension SignUpVC {
    private func setUI() {
        setNavigation()
        setLabel()
        setButton()
        setTextField()
        changeTextFields()
    }
    
    private func setNavigation() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .bookmarkDarkBlue
    }
    
    private func setLabel() {
        titleLabel.text = "회원가입"
        titleLabel.font = .myBoldSystemFont(ofSize: 30)
        
        emailWarningLabel.text = ""
        emailWarningLabel.font = .myRegularSystemFont(ofSize: 11)
        emailWarningLabel.textColor = .latestBurgundy
        
        passwordWarningLabel.text = ""
        passwordWarningLabel.font = .myRegularSystemFont(ofSize: 11)
        passwordWarningLabel.textColor = .latestBurgundy
        
        confirmWarningLabel.text = ""
        confirmWarningLabel.font = .myRegularSystemFont(ofSize: 11)
        confirmWarningLabel.textColor = .latestBurgundy
        
        nameWarningLabel.text = ""
        nameWarningLabel.font = .myRegularSystemFont(ofSize: 11)
        nameWarningLabel.textColor = .latestBurgundy
    }
    
    private func setButton() {
        signUpButton.setTitle("가입하기", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        signUpButton.backgroundColor = .gray60
        signUpButton.layer.cornerRadius = 19
        signUpButton.isEnabled = false
        signUpButton.addTarget(self, action: #selector(touchUpSignUp), for: .touchUpInside)
    }
    
    private func setTextField() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: nameTextField.frame.size.height-3, width: nameTextField.frame.width-40, height: 1)
        border.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5).cgColor
        
        nameTextField.layer.addSublayer(border)
        nameTextField.setLeftPaddingPoints(10)
        nameTextField.placeholder = "닉네임 입력"
        nameTextField.borderStyle = .none
        nameTextField.delegate =  self
        
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: nameTextField.frame.size.height-3, width: nameTextField.frame.width-40, height: 1)
        border2.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5).cgColor
        
        emailTextField.layer.addSublayer(border2)
        emailTextField.setLeftPaddingPoints(10)
        emailTextField.placeholder = "이메일 입력"
        emailTextField.borderStyle = .none
        
        let border3 = CALayer()
        border3.frame = CGRect(x: 0, y: nameTextField.frame.size.height-3, width: nameTextField.frame.width-40, height: 1)
        border3.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5).cgColor
        
        idTextField.layer.addSublayer(border3)
        idTextField.setLeftPaddingPoints(10)
        idTextField.placeholder = "아이디 입력"
        idTextField.borderStyle = .none
        
        let border4 = CALayer()
        border4.frame = CGRect(x: 0, y: nameTextField.frame.size.height-3, width: nameTextField.frame.width-40, height: 1)
        border4.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5).cgColor
        
        passwordTextField.layer.addSublayer(border4)
        passwordTextField.setLeftPaddingPoints(10)
        passwordTextField.placeholder = "비밀번호 입력(영문,숫자 포함 8자리)"
        passwordTextField.borderStyle = .none
        passwordTextField.isSecureTextEntry = true
        
        let border5 = CALayer()
        border5.frame = CGRect(x: 0, y: nameTextField.frame.size.height-3, width: nameTextField.frame.width-40, height: 1)
        border5.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5).cgColor
        
        confirmPWTextField.layer.addSublayer(border5)
        confirmPWTextField.setLeftPaddingPoints(10)
        confirmPWTextField.placeholder = "비밀번호 확인"
        confirmPWTextField.borderStyle = .none
        confirmPWTextField.isSecureTextEntry = true
    }
    
    private func changeTextFields() {
        nameTextField.addTarget(self, action: #selector(changeNameTextFieldUI), for: .allEditingEvents)
        emailTextField.addTarget(self, action: #selector(changeEmailTextfiledUI), for: .allEditingEvents)
        passwordTextField.addTarget(self, action: #selector(changePWTextfiledUI), for: .allEditingEvents)
        confirmPWTextField.addTarget(self, action: #selector(checkPWTextfiledUI), for: .allEditingEvents)
        idTextField.addTarget(self, action: #selector(changeIDTextFieldUI), for: .allEditingEvents)
    }
}

//MARK: Keyboard
extension SignUpVC {
    private func setKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissGestureKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissGestureKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Action
extension SignUpVC {
    @objc func touchUpSignUp() {
        signUp()
        let alert = UIAlertController(title: "가입을 축하합니다", message: "Walkway의 회원이 되신걸 축하합니다.\nWalkway와 함께 걸어봐요", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인했어요", style: .default) { (Action) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc func changeIDTextFieldUI(){
        checkValidateUI()
    }
    
    @objc func changeNameTextFieldUI(){
        checkValidateUI()
    }
    
    @objc func changeEmailTextfiledUI(){
        if !(emailTextField.text!.validateEmail()) {
            emailWarningLabel.text = "사용 불가능한 이메일이에요!"
        }
        else{
            emailWarningLabel.text = ""
        }
        checkValidateUI()
    }
    
    @objc func changePWTextfiledUI(){
        if !(passwordTextField.text!.validatePassword()) {
            passwordWarningLabel.text = "영어와 숫자 조합으로 8자리 이상 입력해 주세요!"
        }
        else{
            if !(passwordTextField.text == confirmPWTextField.text) {
                confirmWarningLabel.text = "비밀번호가 서로 맞지 않아요!"
            }
            else{
                passwordWarningLabel.text = ""
            }

            passwordWarningLabel.text = ""
        }
        checkValidateUI()
    }
    
    @objc func checkPWTextfiledUI(){
        if !(passwordTextField.text == confirmPWTextField.text) {
            confirmWarningLabel.text = "비밀번호가 서로 맞지 않아요!"
        }
        else{
            confirmWarningLabel.text = ""
        }
        checkValidateUI()
    }
}

// MARK: Network
extension SignUpVC {
    func signUp() {
        let param = SignupRequest.init(self.nameTextField.text!, self.emailTextField.text!, self.idTextField.text!, self.passwordTextField.text!)
        print(param)
        authProvider.request(.signUp(param: param)) { response in
            switch response {
                case .success(let result):
                    do {
                        self.userData = try result.map(SignupModel.self)
                    } catch(let err) {
                        print(err.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
}
