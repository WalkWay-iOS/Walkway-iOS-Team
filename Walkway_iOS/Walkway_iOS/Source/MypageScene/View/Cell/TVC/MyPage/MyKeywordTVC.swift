//
//  MyKeywordTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit

class MyKeywordTVC: UITableViewCell {
    static let identifier = "MyKeywordTVC"
    
    @IBOutlet var myKeywordTitleLabel: UILabel!
    @IBOutlet var keywordAllButton: UIButton!
    @IBOutlet var myKeyword1Label: UILabel!
    @IBOutlet var myKeyword2Label: UILabel!
    @IBOutlet var myKeyword3Label: UILabel!
    @IBOutlet var myKeyword4Label: UILabel!
    
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
        myKeyword1Label.backgroundColor = .systemIndigo
        myKeyword1Label.textColor = .white
        myKeyword1Label.layer.masksToBounds = true
        myKeyword1Label.layer.cornerRadius = 12
        myKeyword2Label.backgroundColor = .systemIndigo
        myKeyword2Label.textColor = .white
        myKeyword2Label.layer.masksToBounds = true
        myKeyword2Label.layer.cornerRadius = 12
        myKeyword3Label.backgroundColor = .systemIndigo
        myKeyword3Label.textColor = .white
        myKeyword3Label.layer.masksToBounds = true
        myKeyword3Label.layer.cornerRadius = 12
        myKeyword4Label.backgroundColor = .systemIndigo
        myKeyword4Label.textColor = .white
        myKeyword4Label.layer.masksToBounds = true
        myKeyword4Label.layer.cornerRadius = 12
    }
    
    func setText() {
        myKeywordTitleLabel.text = "나의 키워드"
        myKeyword1Label.text = "#스포츠"
        myKeyword2Label.text = "#야경"
        myKeyword3Label.text = "#등산"
        myKeyword4Label.text = "#데이트코스"
    }
    
    func setButton() {
        keywordAllButton.tintColor = .black
        keywordAllButton.setTitle("전체보기", for: .normal)
    }
    
}
