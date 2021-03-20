//
//  SignInVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/29.
//

import UIKit
import Moya

class SignInVC: UIViewController {
    private let authProvider = MoyaProvider<LoginServices>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var user: SigninModel?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboard()
        setUI()
    }
}

// MARK: - UI
extension SignInVC {
    private func setUI() {
        setNavigation()
        setLabel()
        setButton()
        setTextField()
    }
    
    private func setNavigation() {
        navigationController?.isNavigationBarHidden = true
        navigationItem.title = ""
    }
    
    private func setLabel() {
        titleLabel.text = "로그인"
        titleLabel.font = .myBoldSystemFont(ofSize: 30)
    }
    
    private func setButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.tintColor = .bookmarkGray
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
        
        signInButton.setTitle("로그인", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        signInButton.backgroundColor = .bookmarkDarkBlue
        signInButton.layer.cornerRadius = 19
        signInButton.addTarget(self, action: #selector(touchUpSignIn), for: .touchUpInside)
        
        findButton.setTitle("아이디/비밀번호 찾기", for: .normal)
        findButton.setTitleColor(.gray50, for: .normal)
        findButton.titleLabel?.font = .myMediumSystemFont(ofSize: 13)
        findButton.addTarget(self, action: #selector(touchUpFind), for: .touchUpInside)
    }
    
    private func setTextField() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: idTextField.frame.size.height-3, width: idTextField.frame.width-40, height: 1)
        border.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5).cgColor
        idTextField.layer.addSublayer(border)
        idTextField.setLeftPaddingPoints(10)
        idTextField.placeholder = "아이디 입력"
        idTextField.borderStyle = .none
        
        let border1 = CALayer()
        border1.frame = CGRect(x: 0, y: passwordTextField.frame.size.height-3, width: passwordTextField.frame.width-40, height: 1)
        border1.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5).cgColor
        passwordTextField.layer.addSublayer(border1)
        passwordTextField.setLeftPaddingPoints(10)
        passwordTextField.placeholder = "비밀번호 입력(영문,숫자 포함 8자리)"
        passwordTextField.borderStyle = .none
        passwordTextField.isSecureTextEntry = true
    }
}

//MARK: Keyboard
extension SignInVC {
    private func setKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissGestureKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissGestureKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Action
extension SignInVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpSignIn() {
        print("로그인")
        signIn()
    }
    
    @objc func touchUpFind() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "FindIdVC") as? FindIdVC else {
            return
        }
        navigationController?.pushViewController(dvc, animated: true)
    }
}

// MARK: Network
extension SignInVC {
    func signIn() {
        let param = SigninRequest.init(self.idTextField.text!, self.passwordTextField.text!)
        authProvider.request(.signIn(param: param)) { response in
            switch response {
                case .success(let result):
                    do {
                        self.user = try result.map(SigninModel.self)
                        if self.user?.status == 200 {
                            Login.shared.setLogin(name: "\(String(describing: self.user!.data.name))", token: "\(String(describing: self.user!.data.accessToken))")
                        } else if self.user?.status == 400 {
                            let alert = UIAlertController(title: "로그인 실패", message: "아이디 혹은 비밀번호가 틀렸습니다.", preferredStyle: UIAlertController.Style.alert)
                            let okAction = UIAlertAction(title: "확인", style: .default) { (Action) in
                                self.navigationController?.popViewController(animated: true)
                            }
                            alert.addAction(okAction)
                            self.present(alert, animated: true)
                        }
                    } catch(let err) {
                        print(err.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
}
