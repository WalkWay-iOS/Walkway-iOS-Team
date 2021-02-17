//
//  MyRecordTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit
import FSCalendar

var recordDate = ["201210", "201217", "201224"]
var recordName = ["관악산 초급 코스", "관악산 초급 코스", "관악산 초급 코스"]
var recordDistance = ["5km", "5km", "5km"]
var recordTime = ["1시간", "1시간", "1시간"]

class MyRecordTVC: UITableViewCell {
    static let identifier = "MyRecordTVC"
    
    @IBOutlet var myRecordTitleLabel: UILabel!
    @IBOutlet var recordAllButton: UIButton!
    @IBOutlet var calendarView: FSCalendar!
    @IBOutlet var myRecordCollectionView: UICollectionView!
    
    var delegate: myPagePresentDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionViewDelegate
extension MyRecordTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyRecordListCVC.identifier, for: indexPath) as? MyRecordListCVC else {
            return UICollectionViewCell()
        }
        cell.setData(record: recordDate[indexPath.row], name: recordName[indexPath.row],  distance: recordDistance[indexPath.row], time: recordTime[indexPath.row])
        return cell
    }
}

extension MyRecordTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
}

// MARK: - UI
extension MyRecordTVC {
    func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setButton()
        setCalendar()
    }
    
    func setCollectionView() {
        myRecordCollectionView.delegate = self
        myRecordCollectionView.dataSource = self
    }
    
    func setCollectionViewNib() {
        let nibName = UINib(nibName: "MyRecordListCVC", bundle: nil)
        myRecordCollectionView.register(nibName, forCellWithReuseIdentifier: MyRecordListCVC.identifier)
    }
    
    func setLabel() {
        myRecordTitleLabel.text = "나의 기록"
    }
    
    func setButton() {
        recordAllButton.setTitleColor(.black, for: .normal)
        recordAllButton.setTitle("전체보기", for: .normal)
        recordAllButton.addTarget(self, action: #selector(touchUpViewAll), for: .touchUpInside)
    }
    
    func setCalendar() {
        calendarView.appearance.titleDefaultColor = .black
        calendarView.appearance.titleWeekendColor = .red
        calendarView.appearance.headerTitleColor = .systemIndigo
        calendarView.appearance.weekdayTextColor = .systemIndigo
        calendarView.appearance.headerDateFormat = "YYYY년 M월"
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.appearance.headerMinimumDissolvedAlpha = 0
    }
}

// MARK: - Action
extension MyRecordTVC {
    @objc func touchUpViewAll() {
        delegate?.cellTapedMyRecord()
    }
}
