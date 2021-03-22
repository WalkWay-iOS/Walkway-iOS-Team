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
        startingPointTitleLabel.font = .myMediumSystemFont(ofSize: 13)
        startingPointTitleLabel.textColor = .darkGray
        
        destinationTitleLabel.text = "도착지"
        destinationTitleLabel.font = .myMediumSystemFont(ofSize: 13)
        destinationTitleLabel.textColor = .darkGray
        
        startingPointLabel.font = .myMediumSystemFont(ofSize: 13)
        startingPointLabel.textColor = .darkGray
        
        destinationLabel.font = .myMediumSystemFont(ofSize: 13)
        destinationLabel.textColor = .darkGray
        
        contentLabel.font = .myRegularSystemFont(ofSize: 13)
    }
    
    func setData(course: DetailCourse) {
        startingPointLabel.text = course.placeName[0]
        destinationLabel.text = course.placeName[1]
        contentLabel.text = course.content
    }
}
