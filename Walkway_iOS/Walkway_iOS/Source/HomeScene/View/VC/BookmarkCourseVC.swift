//
//  BookmarkCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/23.
//

import UIKit
import Moya

class BookmarkCourseVC: UIViewController {
    private let authProvider = MoyaProvider<HomeServices>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var courseData: ViewAllModel?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookmarkTableView: UITableView!
    
    var data: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCourse(isBookmark: true)
        setUI()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(identifier: "CourseDetailVC") as? CourseDetailVC else {
            return
        }
//        dvc.cellTitle = data[indexPath.row].title
//        dvc.cellTime = data[indexPath.row].time
//        dvc.cellDistance = "\(data[indexPath.row].distance)"
        // MARK: course id 넘기기
        dvc.isHomeCell = false
        dvc.modalPresentationStyle = .fullScreen
        dvc.modalTransitionStyle = .crossDissolve
        present(dvc, animated: true, completion: nil)
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
        titleLabel.font = .myBoldSystemFont(ofSize: 25)
    }
    
    private func setButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .blue
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
        
        bookmarkButton.setTitle("#북마크", for: .normal)
        bookmarkButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        bookmarkButton.setTitleColor(.white, for: .normal)
        bookmarkButton.backgroundColor = .bookmarkGray
        bookmarkButton.layer.cornerRadius = 13
        bookmarkButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        bookmarkButton.layer.shadowOpacity = 1.0
        bookmarkButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        bookmarkButton.layer.shadowRadius = 3
        bookmarkButton.addTarget(self, action: #selector(touchUpBookmark), for: .touchUpInside)
        
        rateButton.setTitle("#평점", for: .normal)
        rateButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
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
        getCourse(isBookmark: true)
    }
    
    @objc func touchUpRate() {
        getCourse(isBookmark: false)
    }
}

// MARK: Network
extension BookmarkCourseVC {
    func getCourse(isBookmark: Bool) {
        var isString: String?
        if isBookmark {
            isString = "true"
        } else {
            isString = "false"
        }
        let param = BookmarkRequest.init(isString ?? "true")
        print(param)
        authProvider.request(.bookmarks(param: param)) { response in
            switch response {
                case .success(let result):
                    do {
                        let model = try result.map(ViewAllModel.self)
                        self.data.removeAll()
                        self.data.append(contentsOf: model.data.course)
                        self.bookmarkTableView.reloadData()
                        print("리로드")
                    } catch(let err) {
                        print(err.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
}
