//
//  MyRecordListCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/16.
//

import UIKit

class MyRecordListCVC: UICollectionViewCell {
    static let identifier = "MyRecordListCVC"
    
    @IBOutlet var recordDateLabel: UILabel!
    @IBOutlet var recordNameLabel: UILabel!
    @IBOutlet var recordDistanceLabel: UILabel!
    @IBOutlet var blankLabel: UILabel!
    @IBOutlet var recordTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setTitle(data: Record) {
        recordNameLabel.text = data.courseName
        recordDistanceLabel.text = "\(data.distance)km"
        recordTimeLabel.text = "\(data.time)"
        
        let removeDate = data.createdAt.split(separator: "-")
        let yearString = removeDate[0].split(separator: "0")
        let dayString = removeDate[2].split(separator: "T")
        let dateString = "\(yearString[1])\(removeDate[1])\(dayString[0])"
        
        recordDateLabel.text = dateString
    }
}

// MARK: - UI
extension MyRecordListCVC {
    func setUI() {
        setLabel()
    }
    
    func setLabel() {
        recordDateLabel.font = .myBoldSystemFont(ofSize: 13)
        recordDateLabel.textColor = .bookmarkDarkBlue
        recordNameLabel.font = .myBoldSystemFont(ofSize: 13)
        recordDistanceLabel.font = .myRegularSystemFont(ofSize: 13)
        blankLabel.font = .myRegularSystemFont(ofSize: 13)
        blankLabel.text = " / "
        recordTimeLabel.font = .myRegularSystemFont(ofSize: 13)
    }
}
