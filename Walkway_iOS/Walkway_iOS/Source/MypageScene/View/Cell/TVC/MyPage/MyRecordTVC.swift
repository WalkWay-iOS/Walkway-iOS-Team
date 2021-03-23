//
//  MyRecordTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit
import FSCalendar

class MyRecordTVC: UITableViewCell {
    static let identifier = "MyRecordTVC"
    
    @IBOutlet var myRecordTitleLabel: UILabel!
    @IBOutlet var recordAllButton: UIButton!
    @IBOutlet var calendarView: FSCalendar!
    @IBOutlet var myRecordCollectionView: UICollectionView!
    
    var delegate: myPagePresentDelegate?
    
    var courses: [Record] = []
    
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
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyRecordListCVC.identifier, for: indexPath) as? MyRecordListCVC else {
            return UICollectionViewCell()
        }
        cell.setTitle(data: courses[indexPath.row])
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
        calendarView.appearance.titleDefaultColor = .gray80
        calendarView.appearance.titleWeekendColor = .latestBurgundy
        calendarView.appearance.headerTitleColor = .bookmarkDarkBlue
        calendarView.appearance.weekdayTextColor = .bookmarkDarkBlue
        calendarView.appearance.headerDateFormat = "YYYY년 M월"
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.appearance.headerMinimumDissolvedAlpha = 0
        calendarView.appearance.titleFont = .boldSystemFont(ofSize: 13)
        calendarView.appearance.weekdayFont = .boldSystemFont(ofSize: 13)
        calendarView.appearance.headerTitleFont = .boldSystemFont(ofSize: 15)
        calendarView.appearance.subtitleFont = .myRegularSystemFont(ofSize: 13)
    }
    
    func setData(record: [Record]) {
        courses.append(contentsOf: record)
    }
}

// MARK: - Action
extension MyRecordTVC {
    @objc func touchUpViewAll() {
        delegate?.cellTapedMyRecord()
    }
}
