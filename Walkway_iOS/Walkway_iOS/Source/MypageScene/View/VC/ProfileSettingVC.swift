//
//  ProfileSettingVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/07.
//

import UIKit

class ProfileSettingVC: UIViewController {

    @IBOutlet var closeButton: UIButton!
    @IBOutlet var profileTitleLabel: UILabel!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var profileSettingTableView: UITableView!
    
    var delegate: profilePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileKeywordTVC.identifier) as? ProfileKeywordTVC else {
                return UITableViewCell()
            }
            cell.delegate = self
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
            return 240
        }
        return 145
    }
}

// MARK: - UI
extension ProfileSettingVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
        setButton()
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
    
    func setLabel() {
        profileTitleLabel.font = .boldSystemFont(ofSize: 35)
        profileTitleLabel.text = "프로필 설정"
    }
    
    func setButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.setTitleColor(.systemIndigo, for: .normal)
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
    }
}

// MARK: - Protocol
extension ProfileSettingVC: profilePresentDelegate {
    func cellTapedEditEmail() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "EditEmailVC") as? EditEmailVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func cellTapedEditPassword() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "EditPasswordVC") as? EditPasswordVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func cellTapedEditKeyword() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "EditKeywordVC") as? EditKeywordVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: - Action
extension ProfileSettingVC {
    @objc func touchUpClose() {
        dismiss(animated: false, completion: nil)
    }
}
