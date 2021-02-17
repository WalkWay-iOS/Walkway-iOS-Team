//
//  LatestCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/23.
//

import UIKit

class LatestCourseVC: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var latestTableView: UITableView!
    
    var data: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
}

// MARK: - TableViewDelegate
extension LatestCourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LatestCourseTVC.identifier) as? LatestCourseTVC else {
            return UITableViewCell()
        }
        cell.setCellData(rank: indexPath.row + 1, course: data[indexPath.row])
        return cell
    }
}

extension LatestCourseVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(identifier: "CourseDetailVC") as? CourseDetailVC else {
            return
        }
        dvc.cellRate = data[indexPath.row].rate
        dvc.cellTitle = data[indexPath.row].title
        dvc.cellTime = data[indexPath.row].time
        dvc.cellDistance = "\(data[indexPath.row].distance)"
        dvc.isHomeCell = false
        dvc.modalPresentationStyle = .fullScreen
        dvc.modalTransitionStyle = .crossDissolve
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: - UI
extension LatestCourseVC  {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
        setButton()
    }
    
    private func setTableView() {
        latestTableView.delegate = self
        latestTableView.dataSource = self
    }
    
    private func setTableViewNib() {
        let nibName = UINib(nibName: "LatestCourseTVC", bundle: nil)
        latestTableView.register(nibName, forCellReuseIdentifier: LatestCourseTVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "최신 코스"
        titleLabel.font = .myBoldSystemFont(ofSize: 25)
    }
    
    private func setButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .blue
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
    }
}

// MARK: - Action
extension LatestCourseVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Data
extension LatestCourseVC {
    private func setData() {
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
}
