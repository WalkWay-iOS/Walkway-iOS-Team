//
//  HashtagPopUpVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/28.
//

import UIKit

class HashtagPopUpVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var hashtagTextField: UITextField!
    
    var saveHashtag: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TextField
extension HashtagPopUpVC: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            saveButton.isEnabled = false
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == "" {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if (range.length + range.location > currentCharacterCount) {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        
        if textField.text!.count >= 5 && range.length == 0 && range.location < 5 {
            return false
        }
        
        if string == " " {
            warningLabel.text = "공백은 입력할 수 없어요"
            return false
        } else {
            warningLabel.text = ""
        }
        
        return newLength <= 6
    }
}

// MARK: - UI
extension HashtagPopUpVC {
    private func setUI() {
        setLabel()
        setButton()
        setTextField()
    }
    
    private func setLabel() {
        titleLabel.text = "#Walkway 해시태그"
        titleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        
        infoLabel.text = "돋보이는 5글자 이하의 해시태그를 넣어주세요✨"
        infoLabel.font = .systemFont(ofSize: 9, weight: .semibold)
        infoLabel.textColor = .gray70
        
        warningLabel.text = ""
        warningLabel.font = .systemFont(ofSize: 9, weight: .semibold)
        warningLabel.textColor = .latestBurgundy
    }
    
    private func setButton() {
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        saveButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        saveButton.addTarget(self, action: #selector(touchUpSave), for: .touchUpInside)
        saveButton.isEnabled = false
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        cancelButton.addTarget(self, action: #selector(touchUpCancel), for: .touchUpInside)
    }
    
    private func setTextField() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: hashtagTextField.frame.size.height-3, width: hashtagTextField.frame.width-40, height: 1)
        border.backgroundColor = UIColor.bookmarkGray.cgColor
        hashtagTextField.layer.addSublayer(border)
        hashtagTextField.setLeftPaddingPoints(10)
        hashtagTextField.placeholder = "Hashtag 입력하기"
        hashtagTextField.borderStyle = .none
        hashtagTextField.delegate = self
    }
}

// MARK: - Action
extension HashtagPopUpVC {
    @objc func touchUpCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpSave() {
        guard let text = hashtagTextField.text else {return}
        saveHashtag?(text)
        dismiss(animated: true, completion: nil)
    }
}
