//
//  MypageVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit
import Moya

class MypageVC: UIViewController {
    private let authProvider = MoyaProvider<MypageService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var mypageModel: UserDetailModel?
    
    @IBOutlet var myPageTableView: UITableView!
    
    var user: Follower = Follower.init(followerNumber: 0, followingNumber: 0, courseNumber: 0, id: "", name: "", email: "", followerID: "", password: "", createdAt: "", updatedAt: "", v: 0, token: "", tokenExp: 0)
    var courses: [Course] = []
    var records: [Record] = []
    
    override func viewWillAppear(_ animated: Bool) {
        setPage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setPage()
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
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileTVC.identifier) as? MyProfileTVC else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.setData(user: user, courseNum: courses.count)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyBadgeTVC.identifier) as? MyBadgeTVC else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyKeywordTVC.identifier) as? MyKeywordTVC else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.setData(courses: courses)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCourseTVC.identifier) as? MyCourseTVC else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.setName(course: courses)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyRecordTVC.identifier) as? MyRecordTVC else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.setData(record: records)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension MypageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 170
        }
        else if indexPath.section == 1 {
            return 345
        }
        else if indexPath.section == 2 {
            return 121
        }
        else if indexPath.section == 3 {
            return 112
        }
        else if indexPath.section == 4 {
            return 176
        }
        else if indexPath.section == 5 {
            return 530
        }
        return 100
    }
}

// MARK: - UI
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

// MARK: - Protocol
extension MypageVC: myPagePresentDelegate {
    func cellTapedSetting() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "SettingVC") as? SettingVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func cellTapedProfileSetting() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "ProfileSettingVC") as? ProfileSettingVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func cellTapedMyBadge() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "MyBadgeListVC") as? MyBadgeListVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func cellTapedMyKeyword() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "MyKeywordListVC") as? MyKeywordListVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func cellTapedMyCourse() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "MyCourseListVC") as? MyCourseListVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func cellTapedMyRecord() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "MyRecordListVC") as? MyRecordListVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func cellTapedMyPage() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "MyPageVC") as? MypageVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: Network
extension MypageVC {
    func setPage() {
        authProvider.request(.mypage) { response in
            switch response {
            case .success(let result):
                do {
                    self.courses.removeAll()
                    self.records.removeAll()
                    self.mypageModel = try result.map(UserDetailModel.self)
                    self.user = (self.mypageModel?.data.user)!
                    self.courses.append(contentsOf: self.mypageModel?.data.course ?? [])
                    self.records.append(contentsOf: self.mypageModel?.data.record ?? [])
                    self.setUI()
                    self.myPageTableView.reloadData()
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
