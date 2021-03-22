//
//  ReviewVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/22.
//

import UIKit

class ReviewVC: UIViewController {
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var describeLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    let desText = "당신의 Walkway에 대해 설명하는 글을 써주세요.\n 최대 800자 입니다."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @IBAction func saveData(_ sender: Any) {
    }
    
    @IBAction func cancelData(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ReviewVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        
        if(textView.text == desText) {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
    }
}

extension ReviewVC {
    private func setUI() {
        setButton()
        setLabel()
        setView()
        setTextView()
    }
    
    private func setButton() {
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        saveButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        
        cancelButton.setTitle("뒤로", for: .normal)
        cancelButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        cancelButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
    }
    
    private func setLabel() {
        describeLabel.text = "당신의 Walkway✨"
        describeLabel.textColor = .bookmarkDarkBlue
        describeLabel.font = .myMediumSystemFont(ofSize: 15)
    }
    
    private func setView() {
        backView.layer.cornerRadius = 20
    }
    
    private func setTextView() {
        textView.font = .myRegularSystemFont(ofSize: 13)
        textView.delegate = self
        textView.text = desText
        textView.backgroundColor = .clear
    }
}
