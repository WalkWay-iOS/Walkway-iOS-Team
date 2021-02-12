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
    @IBOutlet var keyword1Label: UILabel!
    @IBOutlet var keyword2Label: UILabel!
    @IBOutlet var keyword3Label: UILabel!
    @IBOutlet var keyword4Label: UILabel!
    @IBOutlet var keyword5Label: UILabel!
    @IBOutlet var keyword6Label: UILabel!
    @IBOutlet var keyword7Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        setText()
        setButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func setUI() {
        keyword1Label.backgroundColor = .yellow
        keyword1Label.textColor = .black
        keyword1Label.layer.masksToBounds = true
        keyword1Label.layer.cornerRadius = 12
        keyword2Label.backgroundColor = .purple
        keyword2Label.textColor = .black
        keyword2Label.layer.masksToBounds = true
        keyword2Label.layer.cornerRadius = 12
        keyword3Label.backgroundColor = .systemPink
        keyword3Label.textColor = .black
        keyword3Label.layer.masksToBounds = true
        keyword3Label.layer.cornerRadius = 12
        keyword4Label.backgroundColor = .popularGreen
        keyword4Label.textColor = .black
        keyword4Label.layer.masksToBounds = true
        keyword4Label.layer.cornerRadius = 12
        keyword5Label.backgroundColor = .yellow
        keyword5Label.textColor = .black
        keyword5Label.layer.masksToBounds = true
        keyword5Label.layer.cornerRadius = 12
        keyword6Label.backgroundColor = .purple
        keyword6Label.textColor = .black
        keyword6Label.layer.masksToBounds = true
        keyword6Label.layer.cornerRadius = 12
        keyword7Label.backgroundColor = .systemPink
        keyword7Label.textColor = .black
        keyword7Label.layer.masksToBounds = true
        keyword7Label.layer.cornerRadius = 12
    }
    
    func setText() {
        keywordTitleLable.text = "키워드 선택 (최대 7개)"
        keyword1Label.text = "#여행"
        keyword2Label.text = "#풍경"
        keyword3Label.text = "#야경"
        keyword4Label.text = "#등산코스"
        keyword5Label.text = "#스포츠"
        keyword6Label.text = "#카페"
        keyword7Label.text = "#데이트"
    }
    
    func setButton() {
        keywordEditButton.setImage(UIImage(systemName: "pencil"), for: .normal)
    }
}
