//
//  BannerHeaderTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class BannerHeaderTVC: UITableViewCell {
    static let identifier = "BannerHeaderTVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension BannerHeaderTVC {
    private func setUI() {
        setView()
        setLabel()
    }
    
    private func setView() {
        backgroundColor = .bookmarkDarkBlue
    }
    
    private func setLabel() {
        titleLabel.font = .myBoldSystemFont(ofSize: 28)
        titleLabel.textColor = .white
        
        countLabel.font = .myMediumSystemFont(ofSize: 13)
        countLabel.textColor = .white
        
        contentLabel.font = .myRegularSystemFont(ofSize: 13)
        contentLabel.textColor = .white
    }
}

// MARK: - Data
extension BannerHeaderTVC {
    func setData(country: Country) {
        titleLabel.text = country.title
        countLabel.text = "총 \(country.courses)개의 코스"
        contentLabel.text = country.content
    }
}
