//
//  FollowerVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerVC: UIViewController {
    @IBOutlet weak var followerTableView: UITableView!
    
    let closeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension FollowerVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FollowerHeaderTVC.identifier) as? FollowerHeaderTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FollowerBadgeTVC.identifier) as? FollowerBadgeTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FollowerKeywordTVC.identifier) as? FollowerKeywordTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FollowerCourseTVC.identifier) as? FollowerCourseTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FollowerLatestTVC.identifier) as? FollowerLatestTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension FollowerVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 376
        } else if indexPath.section == 1 {
            return 111
        } else if indexPath.section == 2 {
            return 92
        } else if indexPath.section == 3 {
            return 156
        } else if indexPath.section == 4 {
            return 408
        }
        return 50
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5, animations: {
            self.closeButton.isHidden = true
        })
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5, animations: {
            self.closeButton.isHidden = false
        })
    }
}

// MARK: - UI
extension FollowerVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setButton()
    }
    
    private func setTableView() {
        followerTableView.delegate = self
        followerTableView.dataSource = self
        followerTableView.separatorColor = .clear
        
        let gradientBackgroundColors = [UIColor.bookmarkDarkBlue.cgColor, UIColor.bookmarkDarkBlue.cgColor, UIColor.bookmarkDarkBlue.cgColor, UIColor.white.cgColor]
        let gradientLocations: [NSNumber] = [0.0, 0.3, 0.6, 1.0]

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = gradientLocations
        gradientLayer.frame = followerTableView.bounds
        
        let backgroundView = UIView(frame: followerTableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        followerTableView.backgroundView = backgroundView
    }
    
    private func setTableViewNib() {
        let headerNib = UINib(nibName: "FollowerHeaderTVC", bundle: nil)
        followerTableView.register(headerNib, forCellReuseIdentifier: FollowerHeaderTVC.identifier)
        
        let badgeNib = UINib(nibName: "FollowerBadgeTVC", bundle: nil)
        followerTableView.register(badgeNib, forCellReuseIdentifier: FollowerBadgeTVC.identifier)
        
        let keywordNib = UINib(nibName: "FollowerKeywordTVC", bundle: nil)
        followerTableView.register(keywordNib, forCellReuseIdentifier: FollowerKeywordTVC.identifier)
        
        let courseNib = UINib(nibName: "FollowerCourseTVC", bundle: nil)
        followerTableView.register(courseNib, forCellReuseIdentifier: FollowerCourseTVC.identifier)
        
        let latestNib = UINib(nibName: "FollowerLatestTVC", bundle: nil)
        followerTableView.register(latestNib, forCellReuseIdentifier: FollowerLatestTVC.identifier)
    }
    
    private func setButton() {
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .black
        closeButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.isHidden = false
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
        view.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
}

// MARK: - Action
extension FollowerVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
}
