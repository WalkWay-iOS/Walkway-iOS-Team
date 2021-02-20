//
//  PopularCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class PopularCourseVC: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var seoulButton: UIButton!
    @IBOutlet weak var jejuButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularTableView: UITableView!
    
    var data: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setSeoulData()
    }
}

// MARK: - TableViewDelegate
extension PopularCourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularCourseTVC.identifier) as? PopularCourseTVC else {
            return UITableViewCell()
        }
        cell.setCellData(rank: indexPath.row + 1, course: data[indexPath.row])
        return cell
    }
}

extension PopularCourseVC: UITableViewDelegate {
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
extension PopularCourseVC  {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
        setButton()
    }
    
    private func setTableView() {
        popularTableView.delegate = self
        popularTableView.dataSource = self
    }
    
    private func setTableViewNib() {
        let nibName = UINib(nibName: "PopularCourseTVC", bundle: nil)
        popularTableView.register(nibName, forCellReuseIdentifier: PopularCourseTVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "인기 추천 코스"
        titleLabel.font = .myBoldSystemFont(ofSize: 25)
    }
    
    private func setButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .blue
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
        
        seoulButton.setTitle("#서울", for: .normal)
        seoulButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        seoulButton.setTitleColor(.white, for: .normal)
        seoulButton.backgroundColor = .bookmarkGray
        seoulButton.layer.cornerRadius = 13
        seoulButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        seoulButton.layer.shadowOpacity = 1.0
        seoulButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        seoulButton.layer.shadowRadius = 3
        seoulButton.addTarget(self, action: #selector(touchUpSeoul), for: .touchUpInside)
        
        jejuButton.setTitle("#제주", for: .normal)
        jejuButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        jejuButton.setTitleColor(.white, for: .normal)
        jejuButton.backgroundColor = .popularGreen
        jejuButton.layer.cornerRadius = 13
        jejuButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        jejuButton.layer.shadowOpacity = 1.0
        jejuButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        jejuButton.layer.shadowRadius = 3
        jejuButton.addTarget(self, action: #selector(touchUpJeju), for: .touchUpInside)
    }
}

// MARK: - Action
extension PopularCourseVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpSeoul() {
        setSeoulData()
        popularTableView.reloadData()
    }
    
    @objc func touchUpJeju() {
        setJejuData()
        popularTableView.reloadData()
    }
}

// MARK: - Data
extension PopularCourseVC {
    private func setSeoulData() {
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
    
    private func setJejuData() {
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
