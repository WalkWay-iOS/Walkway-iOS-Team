//
//  DetailExplanationTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/26.
//

import UIKit

class DetailExplanationTVC: UITableViewCell {
    static let identifier = "DetailExplanationTVC"

    @IBOutlet weak var destinationView: UIView!
    @IBOutlet weak var destinationHorizontalView: UIView!
    @IBOutlet weak var destinationVerticalView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var startingPointImage: UIImageView!
    @IBOutlet weak var destinationImage: UIImageView!
    @IBOutlet weak var startingPointTitleLabel: UILabel!
    @IBOutlet weak var destinationTitleLabel: UILabel!
    @IBOutlet weak var startingPointLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
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
extension DetailExplanationTVC {
    private func setUI() {
        setView()
        setImage()
        setLabel()
    }
    
    private func setView() {
        destinationView.backgroundColor = .gray30
        destinationView.layer.borderWidth = 1
        destinationView.layer.borderColor = UIColor.gray40.cgColor
        
        destinationHorizontalView.backgroundColor = .gray40
        destinationVerticalView.backgroundColor = .gray40
        
        bottomView.backgroundColor = .gray40
    }
    
    private func setImage() {
        startingPointImage.tintColor = .bookmarkDarkBlue
        startingPointImage.image = UIImage(systemName: "location.fill")
        
        destinationImage.tintColor = .bookmarkDarkBlue
        destinationImage.image = UIImage(systemName: "location.fill")
    }
    
    private func setLabel() {
        startingPointTitleLabel.text = "출발지"
        startingPointTitleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        startingPointTitleLabel.textColor = .darkGray
        
        destinationTitleLabel.text = "도착지"
        destinationTitleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        destinationTitleLabel.textColor = .darkGray
        
        startingPointLabel.text = "서울대 입구"
        startingPointLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        startingPointLabel.textColor = .darkGray
        
        
        destinationLabel.text = "관악산 정상"
        destinationLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        destinationLabel.textColor = .darkGray
        
        contentLabel.text = "어디서 출발해서 어디서 끝나는 코스입니다. 어디를 경유해서 가는 길입니다~~ 재밌게 즐기세요~~ enjoy 이 편지는 영국에서부터 시작했구요. 서울에서 끝이 납니다. 하하하하."
        contentLabel.font = .systemFont(ofSize: 13, weight: .regular)
    }
}
