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
        viewTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        viewTitleLabel.textColor = .systemIndigo
        viewTitleLabel.text = "코스 후기 작성"
    }
    
    func setButton() {
        memoPresentButton.setTitle("입력", for: .normal)
        memoPresentButton.setTitleColor(.white, for: .normal)
        memoPresentButton.backgroundColor = .systemIndigo
        memoPresentButton.layer.cornerRadius = 5
        memoPresentButton.addTarget(self, action: #selector(touchUpMemo), for: .touchUpInside)
    }
    
    func setTextView() {
        memoTextView.text = memoText
        memoTextView.layer.borderWidth = 0.7
        memoTextView.layer.borderColor = UIColor.gray70.cgColor
        memoTextView.isEditable = false
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
