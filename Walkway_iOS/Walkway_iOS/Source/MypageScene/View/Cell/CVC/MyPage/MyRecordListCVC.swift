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
    
    func setData(record: String, name: String, distance: String, time: String) {
        recordDateLabel.text = record
        recordNameLabel.text = name
        recordDistanceLabel.text = distance
        recordTimeLabel.text = time
    }
}

// MARK: - UI
extension MyRecordListCVC {
    func setUI() {
        setLabel()
    }
    
    func setLabel() {
        recordDateLabel.font = .systemFont(ofSize: 10, weight: .bold)
        recordNameLabel.font = .systemFont(ofSize: 10, weight: .bold)
        recordDistanceLabel.font = .systemFont(ofSize: 10, weight: .medium)
        blankLabel.font = .systemFont(ofSize: 10, weight: .medium)
        blankLabel.text = " / "
        recordTimeLabel.font = .systemFont(ofSize: 10, weight: .medium)
    }
}
