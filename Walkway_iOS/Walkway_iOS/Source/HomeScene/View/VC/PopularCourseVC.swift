//
//  PopularCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit
import Moya

class PopularCourseVC: UIViewController {
    private let authProvider = MoyaProvider<HomeServices>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var courseData: ViewAllModel?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var seoulButton: UIButton!
    @IBOutlet weak var jejuButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularTableView: UITableView!
    
    var data: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCourse(isSeoul: true)
        
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
        dvc.courseId = data[indexPath.row].id
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
        getCourse(isSeoul: true)
    }
    
    @objc func touchUpJeju() {
        getCourse(isSeoul: false)
    }
}

// MARK: Network
extension PopularCourseVC {
    func getCourse(isSeoul: Bool) {
        var isString: String?
        if isSeoul {
            isString = "true"
        } else {
            isString = "false"
        }
        let param = PopularRequest.init(isString ?? "true")
        print(param)
        authProvider.request(.populars(param: param)) { response in
            switch response {
                case .success(let result):
                    do {
                        let model = try result.map(ViewAllModel.self)
                        self.data.removeAll()
                        self.data.append(contentsOf: model.data.course)
                        self.setUI()
                        self.popularTableView.reloadData()
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
