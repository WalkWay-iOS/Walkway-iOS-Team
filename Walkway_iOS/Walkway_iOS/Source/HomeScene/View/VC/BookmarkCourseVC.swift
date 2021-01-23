//
//  BookmarkCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/23.
//

import UIKit

class BookmarkCourseVC: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookmarkTableView: UITableView!
    
    var data: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setBookmarkData()
    }
}

// MARK: - TableViewDelegate
extension BookmarkCourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookmarkCourseTVC.identifier) as? BookmarkCourseTVC else {
            return UITableViewCell()
        }
        cell.setCellData(rank: indexPath.row + 1, course: data[indexPath.row])
        return cell
    }
}

extension BookmarkCourseVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
}

// MARK: - UI
extension BookmarkCourseVC  {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
        setButton()
    }
    
    private func setTableView() {
        bookmarkTableView.delegate = self
        bookmarkTableView.dataSource = self
    }
    
    private func setTableViewNib() {
        let nibName = UINib(nibName: "BookmarkCourseTVC", bundle: nil)
        bookmarkTableView.register(nibName, forCellReuseIdentifier: BookmarkCourseTVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "북마크 / 평점 코스"
        titleLabel.font = .systemFont(ofSize: 25, weight: .black)
    }
    
    private func setButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .blue
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
        
        bookmarkButton.setTitle("#북마크", for: .normal)
        bookmarkButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        bookmarkButton.setTitleColor(.white, for: .normal)
        bookmarkButton.backgroundColor = .bookmarkGray
        bookmarkButton.layer.cornerRadius = 13
        bookmarkButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        bookmarkButton.layer.shadowOpacity = 1.0
        bookmarkButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        bookmarkButton.layer.shadowRadius = 3
        bookmarkButton.addTarget(self, action: #selector(touchUpBookmark), for: .touchUpInside)
        
        rateButton.setTitle("#평점", for: .normal)
        rateButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        rateButton.setTitleColor(.white, for: .normal)
        rateButton.backgroundColor = .popularGreen
        rateButton.layer.cornerRadius = 13
        rateButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        rateButton.layer.shadowOpacity = 1.0
        rateButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        rateButton.layer.shadowRadius = 3
        rateButton.addTarget(self, action: #selector(touchUpRate), for: .touchUpInside)
    }
}

// MARK: - Action
extension BookmarkCourseVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpBookmark() {
        setBookmarkData()
        bookmarkTableView.reloadData()
    }
    
    @objc func touchUpRate() {
        setRateData()
        bookmarkTableView.reloadData()
    }
}

// MARK: - Data
extension BookmarkCourseVC {
    private func setBookmarkData() {
        data.removeAll()
        data.append(contentsOf: [
            Course(title: "관악산 초급 코스", distance: 6, time: "1시간 30분", rate: 4.89, bookmark: 2, isBookmark: false, hashtag: ["#서울대입구", "#산악코스다", "#가벼운산책"]),
            Course(title: "성수 둘레길", distance: 10.56, time: "2시간 45분", rate: 4.50, bookmark: 5, isBookmark: false, hashtag: []),
            Course(title: "남산 하드 코스", distance: 15, time: "2시간", rate: 3.23, bookmark: 120, isBookmark: true, hashtag: ["#초급", "#서울대입구", "#가벼운산책"]),
            Course(title: "관악산 초급 코스", distance: 6, time: "1시간 30분", rate: 4.89, bookmark: 2, isBookmark: false, hashtag: ["#서울대입구", "#산악코스다", "#가벼운산책"]),
            Course(title: "성수 둘레길", distance: 10.56, time: "2시간 45분", rate: 4.50, bookmark: 5, isBookmark: false, hashtag: []),
            Course(title: "남산 하드 코스", distance: 15, time: "2시간", rate: 3.23, bookmark: 120, isBookmark: true, hashtag: ["#초급", "#서울대입구", "#가벼운산책"]),
            Course(title: "관악산 초급 코스", distance: 6, time: "1시간 30분", rate: 4.89, bookmark: 2, isBookmark: false, hashtag: ["#서울대입구", "#산악코스다", "#가벼운산책"]),
            Course(title: "성수 둘레길", distance: 10.56, time: "2시간 45분", rate: 4.50, bookmark: 5, isBookmark: false, hashtag: []),
            Course(title: "남산 하드 코스", distance: 15, time: "2시간", rate: 3.23, bookmark: 120, isBookmark: true, hashtag: ["#초급", "#서울대입구", "#가벼운산책"]),
            Course(title: "관악산 초급 코스", distance: 6, time: "1시간 30분", rate: 4.89, bookmark: 2, isBookmark: false, hashtag: ["#서울대입구", "#산악코스다", "#가벼운산책"]),
            Course(title: "성수 둘레길", distance: 10.56, time: "2시간 45분", rate: 4.50, bookmark: 5, isBookmark: false, hashtag: []),
            Course(title: "남산 하드 코스", distance: 15, time: "2시간", rate: 3.23, bookmark: 120, isBookmark: true, hashtag: ["#초급", "#서울대입구", "#가벼운산책"]),
            Course(title: "관악산 초급 코스", distance: 6, time: "1시간 30분", rate: 4.89, bookmark: 2, isBookmark: false, hashtag: ["#서울대입구", "#산악코스다", "#가벼운산책"]),
            Course(title: "성수 둘레길", distance: 10.56, time: "2시간 45분", rate: 4.50, bookmark: 5, isBookmark: false, hashtag: []),
            Course(title: "남산 하드 코스", distance: 15, time: "2시간", rate: 3.23, bookmark: 120, isBookmark: true, hashtag: ["#초급", "#서울대입구", "#가벼운산책"])
        ])
    }
    
    private func setRateData() {
        data.removeAll()
        data.append(contentsOf: [
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 100, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 23, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 578, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 12, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 100, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 23, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 578, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 12, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 100, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 23, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 578, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 12, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 100, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 23, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 578, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 12, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 100, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 23, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 578, isBookmark: true, hashtag: ["#초급", "#가벼운산책"]),
            Course(title: "한라산 등반 한라산 등반합시다", distance: 3.2, time: "30분", rate: 5.6, bookmark: 12, isBookmark: true, hashtag: ["#초급", "#가벼운산책"])
        ])
    }
}
