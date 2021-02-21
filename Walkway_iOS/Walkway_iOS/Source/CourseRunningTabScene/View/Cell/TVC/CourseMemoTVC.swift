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
    }
}

// MARK: - Action
extension CourseMemoTVC {
    @objc func touchUpMemo() {
        delegate?.buttonTappedMemo()
    }
}
