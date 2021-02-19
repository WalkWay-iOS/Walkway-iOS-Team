//
//  CourseMemoTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CourseMemoTVC: UITableViewCell {
    static let identifier = "CourseMemoTVC"
    
    @IBOutlet var viewTitleLabel: UILabel!
    @IBOutlet var memoTextField: UITextField!
    
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
    }
    
    func setLabel() {
        viewTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        viewTitleLabel.textColor = .systemIndigo
        viewTitleLabel.text = "코스 후기 작성"
    }
}
