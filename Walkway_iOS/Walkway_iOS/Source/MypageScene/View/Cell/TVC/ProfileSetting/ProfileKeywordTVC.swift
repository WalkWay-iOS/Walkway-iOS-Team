//
//  ProfileKeywordTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/07.
//

import UIKit

class ProfileKeywordTVC: UITableViewCell {
    static let identifier = "ProfileKeywordTVC"
    
    @IBOutlet var keywordTitleLable: UILabel!
    @IBOutlet var keywordEditButton: UIButton!
    @IBOutlet var keyword1Button: UIButton!
    @IBOutlet var keyword2Button: UIButton!
    @IBOutlet var keyword3Button: UIButton!
    @IBOutlet var keyword4Button: UIButton!
    @IBOutlet var keyword5Button: UIButton!
    @IBOutlet var keyword6Button: UIButton!
    @IBOutlet var keyword7Button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setText()
        setButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func setText() {
        keywordTitleLable.text = "키워드 선택 (최대 7개)"
    }
    
    func setButton() {
        keywordEditButton.setImage(UIImage(systemName: "pencil"), for: .normal)
    }
}
