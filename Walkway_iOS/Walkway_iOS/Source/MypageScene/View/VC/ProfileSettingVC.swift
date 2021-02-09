//
//  ProfileSettingVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/07.
//

import UIKit

class ProfileSettingVC: UIViewController {

    @IBOutlet var profileTitleLabel: UILabel!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var profileSettingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - TableViewDelegate
extension ProfileSettingVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableVIew: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageTVC.identifier) as? ProfileImageTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoTVC.identifier) as? ProfileInfoTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileKeywordTVC.identifier) as? ProfileKeywordTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension ProfileSettingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 165
        }
        else if indexPath.section == 1 {
            return 245
        }
        return 145
    }
}

extension ProfileSettingVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
    }
    
    private func setTableView() {
        profileSettingTableView.delegate = self
        profileSettingTableView.dataSource = self
        
        profileSettingTableView.separatorColor = .clear
    }
    
    func setTableViewNib() {
        let imageNib = UINib(nibName: "ProfileImageTVC", bundle: nil)
        profileSettingTableView.register(imageNib, forCellReuseIdentifier: ProfileImageTVC.identifier)
        
        let profileInfoNib = UINib(nibName: "ProfileInfoTVC", bundle: nil)
        profileSettingTableView.register(profileInfoNib, forCellReuseIdentifier: ProfileInfoTVC.identifier)
        
        let myKeywordNib = UINib(nibName: "ProfileKeywordTVC", bundle: nil)
        profileSettingTableView.register(myKeywordNib, forCellReuseIdentifier: ProfileKeywordTVC.identifier)
    }
}
