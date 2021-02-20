//
//  SettingVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet var closeButton: UIButton!
    @IBOutlet var viewNameLabel: UILabel!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var settingTableView: UITableView!
    
    var delegate: myPagePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension SettingVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationInfoAllowTVC.identifier) as? LocationInfoAllowTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CameraInfoAllowTVC.identifier) as? CameraInfoAllowTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ScopeOfMyPageTVC.identifier) as? ScopeOfMyPageTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationInfoTVC.identifier) as? NotificationInfoTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension SettingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        else if indexPath.section == 1 {
            return 65
        }
        else if indexPath.section == 2 {
            return 200
        }
        else if indexPath.section == 3 {
            return 340
        }
        return 100
    }
}

// MARK: - UI
extension SettingVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
        setButton()
    }
    
    private func setTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.separatorColor = .clear
    }
    
    func setTableViewNib() {
        let locationNib = UINib(nibName: "LocationInfoAllowTVC", bundle: nil)
        settingTableView.register(locationNib, forCellReuseIdentifier: LocationInfoAllowTVC.identifier)
        
        let cameraNib = UINib(nibName: "CameraInfoAllowTVC", bundle: nil)
        settingTableView.register(cameraNib, forCellReuseIdentifier: CameraInfoAllowTVC.identifier)
        
        let myPageScopeNib = UINib(nibName: "ScopeOfMyPageTVC", bundle: nil)
        settingTableView.register(myPageScopeNib, forCellReuseIdentifier: ScopeOfMyPageTVC.identifier)
        
        let notificationNib = UINib(nibName: "NotificationInfoTVC", bundle: nil)
        settingTableView.register(notificationNib, forCellReuseIdentifier: NotificationInfoTVC.identifier)
    }
    
    func setLabel() {
        viewNameLabel.text = "설정"
        viewNameLabel.font = .myBoldSystemFont(ofSize: 35)
    }
    
    func setButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .bookmarkDarkBlue
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
    }
}

// MARK: - Action
extension SettingVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
}
