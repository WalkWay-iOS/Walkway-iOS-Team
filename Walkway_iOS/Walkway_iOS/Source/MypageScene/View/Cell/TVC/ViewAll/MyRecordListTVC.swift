//
//  MyRecordListTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/14.
//

import UIKit

class MyRecordListTVC: UITableViewCell {
    static let identifier = "MyRecordListTVC"
    
    @IBOutlet var myRecordDateLabel: UILabel!
    @IBOutlet var myRecordNameLabel: UILabel!
    @IBOutlet var myRecordDistanceLabel: UILabel!
    @IBOutlet var blankLabel: UILabel!
    @IBOutlet var myRecordTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(record: String, name: String, distance: String, time: String) {
        myRecordDateLabel.text = record
        myRecordNameLabel.text = name
        myRecordDistanceLabel.text = distance
        myRecordTimeLabel.text = time
    }
}


// MARK: - UI
extension MyRecordListTVC {
    func setUI() {
        setLabel()
    }
    
    func setLabel() {
        myRecordDateLabel.font = .boldSystemFont(ofSize: 10)
        myRecordNameLabel.font = .boldSystemFont(ofSize: 10)
        myRecordDistanceLabel.font = .systemFont(ofSize: 10, weight: .medium)
        blankLabel.font = .systemFont(ofSize: 10, weight: .medium)
        blankLabel.text = " / "
        myRecordTimeLabel.font = .systemFont(ofSize: 10, weight: .medium)
    }
}
