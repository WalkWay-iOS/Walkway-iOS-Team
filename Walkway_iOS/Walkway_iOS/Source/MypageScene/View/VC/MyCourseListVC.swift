//
//  MyCourseListVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/15.
//

import UIKit

var courseName = ["관악산 초급 코스", "관악산 초급 코스", "관악산 초급 코스", "관악산 초급 코스", "관악산 초급 코스", "관악산 초급 코스"]
var courseDistance = ["6km", "6km", "6km", "6km", "6km", "6km"]
var courseTime = ["1시간 30분", "1시간 30분", "1시간 30분", "1시간 30분", "1시간 30분", "1시간 30분"]

class MyCourseListVC: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var viewTitleLabel: UILabel!
    @IBOutlet var myCourseTableView: UITableView!
    
    var delegate: myPagePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension MyCourseListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCourseListTVC.identifier) as? MyCourseListTVC else {
            return UITableViewCell()
        }
        cell.setData(course: courseName[indexPath.row], distance: courseDistance[indexPath.row], time: courseTime[indexPath.row])
        return cell
    }
}

extension MyCourseListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // 셀 누르면 디테일뷰로 넘기기
}


// MARK: - UI
extension MyCourseListVC {
    func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
        setButton()
    }
    
    func setTableView() {
        myCourseTableView.delegate = self
        myCourseTableView.dataSource = self
    }
   
    func setTableViewNib() {
        let nibName = UINib(nibName: "MyCourseListTVC", bundle: nil)
        myCourseTableView.register(nibName, forCellReuseIdentifier: MyCourseListTVC.identifier)
    }
    
    func setLabel() {
        viewTitleLabel.font = .boldSystemFont(ofSize: 20)
        viewTitleLabel.text = "나의 코스"
    }
    
    func setButton() {
        backButton.setTitle("", for: .normal)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .blue
        backButton.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
    }
}

// MARK: - Action
extension MyCourseListVC {
    @objc func touchUpBack() {
        dismiss(animated: false, completion: nil)
    }
}
