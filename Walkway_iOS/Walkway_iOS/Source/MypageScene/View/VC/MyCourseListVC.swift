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
        setupStatusBar(.lightGray)
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
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//
//        } else if editingStyle == .none {
//
//        }
//    }
//
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
//
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "삭제"
//    }
//
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .normal, title: "수정") { (rowAction, indexPath) in
            
        }
        editAction.backgroundColor = .green
        let deleteAction = UITableViewRowAction(style: .normal, title: "삭제") { (rowAction, indexPath) in
            let alert = UIAlertController(title: "코스를 삭제하시겠습니까?", message: "삭제된 코스는 복구가 불가능합니다🥲", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "삭제", style: .default) { (Action) in
                courseName.remove(at: indexPath.row)
                courseTime.remove(at: indexPath.row)
                courseDistance.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let cancelAction = UIAlertAction(title: "취소", style: .default)
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
        }
        deleteAction.backgroundColor = .red
        
        return [deleteAction, editAction]
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
