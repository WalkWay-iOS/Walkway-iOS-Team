//
//  ScopeOfMyPageTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/06.
//

import UIKit

class ScopeOfMyPageTVC: UITableViewCell {
    static let identifier = "ScopeOfMyPageTVC"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var recordTitleLabel: UILabel!
    @IBOutlet var badgeTitleLabel: UILabel!
    @IBOutlet var keywordTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setText()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setText() {
        titleLabel.text = "공개 범위"
        recordTitleLabel.text = "기록"
        badgeTitleLabel.text = "뱃지"
        keywordTitleLabel.text = "키워드"
    }
}