//
//  CourseMemoTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

var memoText: String?

class CourseMemoTVC: UITableViewCell {
    static let identifier = "CourseMemoTVC"
    
    @IBOutlet var viewTitleLabel: UILabel!
    @IBOutlet var memoTextView: UITextView!
    @IBOutlet var memoPresentButton: UIButton!
    
    var delegate: walkingCourseMemoPresentDelegate?
    var tableView: UITableView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        setNotification()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension CourseMemoTVC {
    func setUI() {
        setLabel()
        setButton()
        setTextView()
    }
    
    func setLabel() {
        viewTitleLabel.font = .myBoldSystemFont(ofSize: 13)
        viewTitleLabel.textColor = .bookmarkDarkBlue
        viewTitleLabel.text = "코스 후기 작성"
    }
    
    func setButton() {
        memoPresentButton.setTitle("입력", for: .normal)
        memoPresentButton.titleLabel?.font = .myBoldSystemFont(ofSize: 13)
        memoPresentButton.setTitleColor(.white, for: .normal)
        memoPresentButton.backgroundColor = .bookmarkDarkBlue
        memoPresentButton.contentEdgeInsets = UIEdgeInsets(top: 3, left: 13, bottom: 3, right: 13)
        memoPresentButton.layer.cornerRadius = 10
        memoPresentButton.addTarget(self, action: #selector(touchUpMemo), for: .touchUpInside)
    }
    
    func setTextView() {
        memoTextView.text = memoText
        memoTextView.font = .myRegularSystemFont(ofSize: 12)
        memoTextView.layer.cornerRadius = 10
        memoTextView.layer.borderWidth = 0.7
        memoTextView.layer.borderColor = UIColor.gray50.cgColor
        memoTextView.isEditable = false
    }
}

// MARK: Notification
extension CourseMemoTVC {
    private func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(saveAction), name: NSNotification.Name("recordSave"), object: nil)
    }
    
    @objc func saveAction() {
        let userDefault = UserDefaults.standard
        
        userDefault.setValue(memoTextView.text!, forKey: "content")
    }
}

// MARK: - Action
extension CourseMemoTVC {
    @objc func touchUpMemo() {
        guard let dvc = UIStoryboard(name: "CourseRunningTab", bundle: nil).instantiateViewController(identifier: "CourseMemoVC") as? CourseMemoVC else {
            return
        }
        dvc.sendText = { text in
            self.memoTextView.text = text
            self.tableView?.reloadData()
        }
        if memoTextView.text == "" {
            dvc.getText(text: "")
        } else {
            guard let text = memoTextView.text else {return}
            dvc.getText(text: text)
        }
        dvc.modalPresentationStyle = .overCurrentContext
        delegate?.buttonTappedMemo(dvc: dvc)
    }
}
