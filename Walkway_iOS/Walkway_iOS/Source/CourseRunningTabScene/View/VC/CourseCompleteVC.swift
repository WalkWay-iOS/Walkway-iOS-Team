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
    
    var delegate: walkingCoursePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - TableViewDelegate
extension CourseCompleteVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseKeywordTVC.identifier) as? CourseKeywordTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseMemoTVC.identifier) as? CourseMemoTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension CourseCompleteVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160
        }
        else if indexPath.section == 1 {
            return 160
        }
        else if indexPath.section == 2 {
            return 140
        }
        else if indexPath.section == 3 {
            return 95
        }
        return 100
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
        
        let keywordNib = UINib(nibName: "CourseKeywordTVC", bundle: nil)
        courseRecordTableView.register(keywordNib, forCellReuseIdentifier: CourseKeywordTVC.identifier)
        
        let memoNib = UINib(nibName: "CourseMemoTVC", bundle: nil)
        courseRecordTableView.register(memoNib, forCellReuseIdentifier: CourseMemoTVC.identifier)
    }
    
    func setLabel() {
        userNameLabel.font = .systemFont(ofSize: 12, weight: .bold)
        userNameLabel.textColor = .systemIndigo
        userNameLabel.text = "달려가자 님의 Walkway"
    }
    
    func setButton() {
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.systemIndigo, for: .normal)
    }
}
