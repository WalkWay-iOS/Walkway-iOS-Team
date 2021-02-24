//
//  CourseMemoVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/21.
//

import UIKit

class CourseMemoVC: UIViewController {

    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var memoTextView: UITextView!
    
    var delegate: walkingCoursePresentDelegate?
    
    var sendText: ((String) -> ())?
    
    var memoText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - UI
extension CourseMemoVC {
    func setUI() {
        setButton()
        setTextView()
    }
    
    func setButton() {
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.layer.cornerRadius = 10
        cancelButton.backgroundColor = .systemIndigo
        cancelButton.addTarget(self, action: #selector(touchUpStop), for: .touchUpInside)
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 10
        saveButton.backgroundColor = .systemIndigo
        saveButton.addTarget(self, action: #selector(touchUpSave), for: .touchUpInside)
    }
    
    func setTextView() {
        memoTextView.text = memoText
        memoTextView.layer.borderWidth = 0.7
        memoTextView.layer.borderColor = UIColor.gray70.cgColor
    }
    
    func getText(text: String) {
        memoText = text
    }
}

// MARK: - Action
extension CourseMemoVC {
    @objc func touchUpStop() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpSave() {
        guard let text = memoTextView.text else {return}
        sendText?(text)
        dismiss(animated: true, completion: nil)
    }
}
