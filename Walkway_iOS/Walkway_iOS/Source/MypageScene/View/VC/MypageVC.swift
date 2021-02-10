//
//  MypageVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit

class MypageVC: UIViewController {
    
    @IBOutlet var myPageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
}

// MARK:- TableViewDelegate
extension MypageVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageHeaderTVC.identifier) as? MyPageHeaderTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileTVC.identifier) as? MyProfileTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyBadgeTVC.identifier) as? MyBadgeTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyKeywordTVC.identifier) as? MyKeywordTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCourseTVC.identifier) as? MyCourseTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyRecordTVC.identifier) as? MyRecordTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension MypageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 188
        }
        else if indexPath.section == 1 {
            return 325
        }
        else if indexPath.section == 2 {
            return 155
        }
        else if indexPath.section == 3 {
            return 155
        }
        else if indexPath.section == 4 {
            return 100
        }
        else if indexPath.section == 5 {
            return 100
        }
        return 100
    }
}

extension MypageVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
    }
    
    private func setTableView() {
        myPageTableView.delegate = self
        myPageTableView.dataSource = self
        
        myPageTableView.separatorColor = .clear
    }
    
    func setTableViewNib() {
        let headerNib = UINib(nibName: "MyPageHeaderTVC", bundle: nil)
        myPageTableView.register(headerNib, forCellReuseIdentifier: MyPageHeaderTVC.identifier)
        
        let profileNib = UINib(nibName: "MyProfileTVC", bundle: nil)
        myPageTableView.register(profileNib, forCellReuseIdentifier: MyProfileTVC.identifier)
        
        let myBadgeNib = UINib(nibName: "MyBadgeTVC", bundle: nil)
        myPageTableView.register(myBadgeNib, forCellReuseIdentifier: MyBadgeTVC.identifier)
        
        let myKeywordNib = UINib(nibName: "MyKeywordTVC", bundle: nil)
        myPageTableView.register(myKeywordNib, forCellReuseIdentifier: MyKeywordTVC.identifier)
        
        let myCourseNib = UINib(nibName: "MyCourseTVC", bundle: nil)
        myPageTableView.register(myCourseNib, forCellReuseIdentifier: MyCourseTVC.identifier)
        
        let myRecordNib = UINib(nibName: "MyRecordTVC", bundle: nil)
        myPageTableView.register(myRecordNib, forCellReuseIdentifier: MyRecordTVC.identifier)
    }
}
