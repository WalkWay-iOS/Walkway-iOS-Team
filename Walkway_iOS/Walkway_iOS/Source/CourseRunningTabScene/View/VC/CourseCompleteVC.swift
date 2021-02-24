//
//  CourseCompleteVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CourseCompleteVC: UIViewController {

    @IBOutlet var saveButton: UIButton!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var courseRecordTableView: UITableView!
    
    var delegate: walkingCourseMemoPresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension CourseCompleteVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseRecordInfoTVC.identifier) as? CourseRecordInfoTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseEstimateTVC.identifier) as? CourseEstimateTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        
        else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseMemoTVC.identifier) as? CourseMemoTVC else {
                return UITableViewCell()
            }
            cell.tableView = courseRecordTableView
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension CourseCompleteVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 140
        }
        else if indexPath.section == 1 {
            return 170
        }
        else if indexPath.section == 2 {
            return 250
        }
        return 0
    }
}

// MARK: - UI
extension CourseCompleteVC {
    func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
        setButton()
    }
    
    func setTableView() {
        courseRecordTableView.delegate = self
        courseRecordTableView.dataSource = self
        courseRecordTableView.separatorColor = .clear
    }
    
    func setTableViewNib() {
        let infoNib = UINib(nibName: "CourseRecordInfoTVC", bundle: nil)
        courseRecordTableView.register(infoNib, forCellReuseIdentifier: CourseRecordInfoTVC.identifier)
        
        let estimateNib = UINib(nibName: "CourseEstimateTVC", bundle: nil)
        courseRecordTableView.register(estimateNib, forCellReuseIdentifier: CourseEstimateTVC.identifier)
        
        let memoNib = UINib(nibName: "CourseMemoTVC", bundle: nil)
        courseRecordTableView.register(memoNib, forCellReuseIdentifier: CourseMemoTVC.identifier)
    }
    
    func setLabel() {
        userNameLabel.font = .myBoldSystemFont(ofSize: 13)
        userNameLabel.textColor = .bookmarkDarkBlue
        userNameLabel.text = "달려가자 님의 Walkway"
    }
    
    func setButton() {
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        saveButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
    }
}

// MARK: - Protocol
extension CourseCompleteVC: walkingCourseMemoPresentDelegate {
    func buttonTappedMemo(dvc: CourseMemoVC) {
        present(dvc, animated: true, completion: nil)
    }
}
