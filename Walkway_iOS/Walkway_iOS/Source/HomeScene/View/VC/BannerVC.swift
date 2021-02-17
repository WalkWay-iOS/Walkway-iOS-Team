//
//  BannerVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class BannerVC: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var bannerTableView: UITableView!
    
    var isSeoul = true
    
    var country: [Country] = []
    var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension BannerVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerHeaderTVC.identifier) as? BannerHeaderTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.setData(country: country[indexPath.row])
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LatestCourseTVC.identifier) as? LatestCourseTVC else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setCellData(rank: indexPath.row + 1, course: courses[indexPath.row])
        return cell
    }
}

extension BannerVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 400
        }
        return 98
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            guard let dvc = storyboard?.instantiateViewController(identifier: "CourseDetailVC") as? CourseDetailVC else {
                return
            }
            dvc.cellRate = courses[indexPath.row].rate
            dvc.cellTitle = courses[indexPath.row].title
            dvc.cellTime = courses[indexPath.row].time
            dvc.cellDistance = "\(courses[indexPath.row].distance)"
            dvc.isHomeCell = false
            dvc.modalPresentationStyle = .fullScreen
            dvc.modalTransitionStyle = .crossDissolve
            present(dvc, animated: true, completion: nil)
        }
    }
}

// MARK: - UI
extension BannerVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setButton()
    }
    
    private func setTableView() {
        bannerTableView.delegate = self
        bannerTableView.dataSource = self
    }
    
    private func setTableViewNib() {
        let headerNib = UINib(nibName: "BannerHeaderTVC", bundle: nil)
        bannerTableView.register(headerNib, forCellReuseIdentifier: BannerHeaderTVC.identifier)
        
        let courseNib = UINib(nibName: "LatestCourseTVC", bundle: nil)
        bannerTableView.register(courseNib, forCellReuseIdentifier: LatestCourseTVC.identifier)
    }
    
    private func setButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .bookmarkDarkBlue
        closeButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
    }
}

// MARK: - Action
extension BannerVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Data
extension BannerVC {
    private func setData() {
        country.removeAll()
        courses.removeAll()
        
        if isSeoul {
            setSeoul()
        } else {
            setJeju()
        }
    }
    
    private func setSeoul() {
        country.append(contentsOf: [
            Country(title: "서울 둘레길", courses: 17, content: "서울을 한 바퀴 휘감는 총 연장 157km의 서울둘레길은 8개 코스로 서울의 역사, 문화, 자연생태 등을 스토리로 엮어 국내외 탐방객들이 느끼고, 배우고, 체험할 수 있도록 조성한 도보길입니다. 서울둘레길은 ‘숲길’, ‘하천길’, ‘마을길’로 구성되어 있습니다. 둘레길 곳곳에 휴게시설과 북카페, 쉼터를 만들어 시민들이 자연스럽게 휴식을 취할 수 있게 했고, 전통 깊은 사찰과 유적지을 연결해 서울의 역사와 문화, 자연생태를 곳곳에서 체험할 수 있도록 조성하였습니다. 대중교통으로도 접근하기 쉬우며 주로 경사가 심하지 않은 흙길로 되어 있어 누구나 안전하고 편안하게 이용할 수 있습니다.")
        ])
        
        courses.append(contentsOf: [
            Course(title: "관악산 초급 코스", distance: 6, time: "1시간 30분", rate: 4.89, bookmark: 200, isBookmark: false, hashtag: ["#서울대입구", "#산악코스다", "#가벼운산책"]),
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
    
    private func setJeju() {
        country.append(contentsOf: [
            Country(title: "제주 둘레길", courses: 26, content: "대한민국 걷기 여행의 대명사가 된 제주올레. 총 길이 425km에 달하는 올레길은 제주를 찾는 중요한 이유 중 하나로 자리매김했다. 제주올레는 21개 정규 코스와 5개 부속 코스를 포함해 모두 26개 코스로 이루어져 있다. 하루에 한 코스만 걸어도 한 달 남짓 걸리는 길이다. 여정이 짧다면 코스별로 하이라이트 구간만 뽑아 걷는 것도 올레길을 즐기는 한 방법이다. 여행자라면 반드시 걸어봐야 할 5개의 올레길 가운데 핵심 구간만 모아서 소개한다. 길 따라 이어지는 제주의 자연, 역사, 문화 포인트를 만나보자.")
        ])
        
        courses.append(contentsOf: [
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
