//
//  CourseSearchVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit

class CourseSearchVC: UIViewController {
    
    @IBOutlet var btnUser: UIButton!
    @IBOutlet var btnTrend: UIButton!
    @IBOutlet var btnBookmark: UIButton!
    @IBOutlet var btnFollow: UIButton!
    @IBOutlet var searchCourseTextField: UITextField!
    @IBOutlet var imgNoSearchingLogo: UIImageView!
    @IBOutlet var courseListTableView: UITableView!
    @IBOutlet weak var keywordCollectionView: UICollectionView!
    @IBOutlet weak var courseTextField: UITextField!
    
    var isTrendy = false
    var isBookmark = false
    var isFollow = false
    
    var keywordData: [String] = []
    var data: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }
    
    @IBAction func btnSearchTrend(_ sender: UIButton) {
        courseListTableView.isHidden = false
        addTrendData()
        setTrendData()
        
        keywordCollectionView.reloadData()
        courseListTableView.reloadData()
        
        btnTrend.backgroundColor = UIColor.gray40
        btnBookmark.backgroundColor = UIColor.white
        btnFollow.backgroundColor = UIColor.white
    }
    
    @IBAction func btnSearchBookmark(_ sender: UIButton) {
        courseListTableView.isHidden = false
        addBookmarkData()
        setBookmarkData()
        
        keywordCollectionView.reloadData()
        courseListTableView.reloadData()
        
        btnBookmark.backgroundColor = UIColor.gray40
        btnTrend.backgroundColor = UIColor.white
        btnFollow.backgroundColor = UIColor.white
    }
    
    @IBAction func btnSearchFollow(_ sender: UIButton) {
        courseListTableView.isHidden = false
        addFollowData()
        setFollowData()
        
        keywordCollectionView.reloadData()
        courseListTableView.reloadData()
        
        btnFollow.backgroundColor = UIColor.gray40
        btnTrend.backgroundColor = UIColor.white
        btnBookmark.backgroundColor = UIColor.white
    }
    
    
}

extension CourseSearchVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

// MARK: - Action
extension CourseSearchVC {
    @objc func touchUpProfile() {
        let alert = UIAlertController(title: "Walkway", message: "Walkway와 함께 즐거운 산책되세요", preferredStyle: UIAlertController.Style.actionSheet)
        let courseAction = UIAlertAction(title: "찜한 코스", style: .default)
        let photoAction =  UIAlertAction(title: "찜한 사진", style: .default, handler: nil)
        let latestAction = UIAlertAction(title: "최근 본 목록", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(courseAction)
        alert.addAction(photoAction)
        alert.addAction(latestAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension CourseSearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LatestCourseTVC.identifier, for: indexPath) as? LatestCourseTVC else {
            return UITableViewCell()
        }
        cell.setCellData(rank: indexPath.row + 1, course: data[indexPath.row])
        return cell
    }
}

extension CourseSearchVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywordData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseKeywordCVC.identifier, for: indexPath) as? CourseKeywordCVC else {
            return UICollectionViewCell()
        }
        cell.layer.borderWidth = 0.7
        cell.layer.borderColor = UIColor.gray50.cgColor
        cell.layer.cornerRadius = 10
        cell.setData(keyword: keywordData[indexPath.item])
        return cell
    }
}

extension CourseSearchVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = keywordData[indexPath.row]
        label.font = .myMediumSystemFont(ofSize: 11)
        label.sizeToFit()
        
        let width = label.frame.size.width + 25
        return CGSize(width: width, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 16)
    }
}

extension CourseSearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
}

// MARK: - UI
extension CourseSearchVC {
    private func setUI() {
        setTextField()
        setTableView()
        setCollectionView()
        settingView()
        setCourseSearch()
        setNoSearching()
        setButton()
    }
    
    private func setTextField() {
        courseTextField.delegate = self
        
        courseTextField.placeholder = "코스 검색"
        courseTextField.font = .myRegularSystemFont(ofSize: 13)
    }
    
    private func setTableView() {
        courseListTableView.delegate = self
        courseListTableView.dataSource = self
        
        let nibName = UINib(nibName: "LatestCourseTVC", bundle: nil)
        courseListTableView.register(nibName, forCellReuseIdentifier: LatestCourseTVC.identifier)
    }
    
    private func setCollectionView() {
        keywordCollectionView.delegate = self
        keywordCollectionView.dataSource = self
        
        let collectionNibName = UINib(nibName: "CourseKeywordCVC", bundle: nil)
        keywordCollectionView.register(collectionNibName, forCellWithReuseIdentifier: CourseKeywordCVC.identifier)
    }
    
    private func settingView() {
        btnUser.layer.cornerRadius = btnUser.layer.frame.size.width/2
        btnUser.layer.cornerRadius = 21
        btnUser.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        btnUser.layer.shadowOpacity = 1.0
        btnUser.layer.shadowOffset = CGSize(width: 1, height: 2)
        btnUser.layer.shadowRadius = 3
        btnUser.addTarget(self, action: #selector(touchUpProfile), for: .touchUpInside)
    }
    
    private func setCourseSearch() {
        btnTrend.layer.cornerRadius = 13
        btnTrend.layer.borderWidth = 1.0
        btnTrend.layer.borderColor = UIColor.gray.cgColor
        btnTrend.layer.borderWidth = 0.5
        
        btnBookmark.layer.cornerRadius = 13
        btnBookmark.layer.borderWidth = 1.0
        btnBookmark.layer.borderColor = UIColor.gray.cgColor
        btnBookmark.layer.borderWidth = 0.5
        
        btnFollow.layer.cornerRadius = 13
        btnFollow.layer.borderWidth = 1.0
        btnFollow.layer.borderColor = UIColor.gray.cgColor
        btnFollow.layer.borderWidth = 0.5
    }
    
    private func setNoSearching() {
        //imgNoSearchingLogo.image = ""
        courseListTableView.isHidden = true
    }
    
    private func setButton() {
        btnTrend.setTitleColor(.bookmarkDarkBlue, for: .normal)
        btnTrend.titleLabel?.font = .myBoldSystemFont(ofSize: 13)
        
        btnFollow.setTitleColor(.bookmarkDarkBlue, for: .normal)
        btnFollow.titleLabel?.font = .myBoldSystemFont(ofSize: 13)
        
        btnBookmark.setTitleColor(.bookmarkDarkBlue, for: .normal)
        btnBookmark.titleLabel?.font = .myBoldSystemFont(ofSize: 13)
    }
}

// MARK: - Keyword Action
extension CourseSearchVC {
    private func addTrendData() {
        keywordData.removeAll()
        keywordData.append("#남산")
        keywordData.append("#남산야경")
        keywordData.append("#서울숲")
        keywordData.append("#작은나들이")
    }
    
    private func addFollowData() {
        keywordData.removeAll()
        keywordData.append("#인스타감성")
        keywordData.append("#남산야경")
        keywordData.append("#야경")
        keywordData.append("#작은나들이")
    }
    
    private func addBookmarkData() {
        keywordData.removeAll()
        keywordData.append("#둘레길")
        keywordData.append("#서울")
        keywordData.append("#서울숲")
        keywordData.append("#성동구")
    }
}

// MARK: - Data
extension CourseSearchVC {
    private func setTrendData() {
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
    
    private func setBookmarkData() {
        data.removeAll()
        data.append(contentsOf: [
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
    
    private func setFollowData() {
        data.removeAll()
        data.append(contentsOf: [
            Course(title: "남산 하드 코스", distance: 15, time: "2시간", rate: 3.23, bookmark: 120, isBookmark: true, hashtag: ["#초급", "#서울대입구", "#가벼운산책"]),
            Course(title: "관악산 초급 코스", distance: 6, time: "1시간 30분", rate: 4.89, bookmark: 2, isBookmark: false, hashtag: ["#서울대입구", "#산악코스다", "#가벼운산책"]),
            Course(title: "성수 둘레길", distance: 10.56, time: "2시간 45분", rate: 4.50, bookmark: 5, isBookmark: false, hashtag: []),
            Course(title: "남산 하드 코스", distance: 15, time: "2시간", rate: 3.23, bookmark: 120, isBookmark: true, hashtag: ["#초급", "#서울대입구", "#가벼운산책"])
        ])
    }
}
