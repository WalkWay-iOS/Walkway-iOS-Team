//
//  WelcomeLoginVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/29.
//

import UIKit

class WelcomeLoginVC: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - UI
extension WelcomeLoginVC {
    private func setUI() {
        setNavigation()
        setButton()
    }
    
    private func setNavigation() {
        navigationController?.isNavigationBarHidden = true
        navigationItem.title = ""
    }
    
    private func setButton() {
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        signUpButton.backgroundColor = .bookmarkDarkBlue
        signUpButton.layer.cornerRadius = 19
        signUpButton.addTarget(self, action: #selector(touchUpSignUp), for: .touchUpInside)
        
        signInButton.setTitle("로그인", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        signInButton.backgroundColor = .bookmarkGray
        signInButton.layer.cornerRadius = 19
        signInButton.addTarget(self, action: #selector(touchUpSignIn), for: .touchUpInside)
    }
}

// MARK: - Action
extension WelcomeLoginVC {
    @objc func touchUpSignUp() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "SignUpVC") as? SignUpVC else {
            return
        }
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @objc func touchUpSignIn() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "LoginNavi") else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}
