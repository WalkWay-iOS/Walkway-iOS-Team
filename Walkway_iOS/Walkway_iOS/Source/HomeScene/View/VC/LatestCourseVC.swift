//
//  LatestCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/23.
//

import UIKit
import Moya

class LatestCourseVC: UIViewController {
    private let authProvider = MoyaProvider<HomeServices>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var courseData: ViewAllModel?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var latestTableView: UITableView!
    
    var data: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCourse()
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
//        dvc.cellRate = data[indexPath.row].rate
//        dvc.cellTitle = data[indexPath.row].title
//        dvc.cellTime = data[indexPath.row].time
//        dvc.cellDistance = "\(data[indexPath.row].distance)"
        // MARK: id 넣어두기
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

// MARK: Network
extension LatestCourseVC {
    func getCourse() {
        let param = LatestRequest.init(0)
        print(param)
        authProvider.request(.latests(param: param)) { response in
            switch response {
                case .success(let result):
                    do {
                        let model = try result.map(ViewAllModel.self)
                        self.data.removeAll()
                        self.data.append(contentsOf: model.data.course)
                        self.setUI()
                        self.latestTableView.reloadData()
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
