//
//  HomeVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension HomeVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeBannerTVC.identifier) as? HomeBannerTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeFollowerTVC.identifier) as? HomeFollowerTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomePopularCourseTVC.identifier) as? HomePopularCourseTVC else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeBookmarkCourseTVC.identifier) as? HomeBookmarkCourseTVC else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeLatestCourseTVC.identifier) as? HomeLatestCourseTVC else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 187
        } else if indexPath.section == 1 {
            return 221
        } else if indexPath.section == 3 {
            return 231
        }
        return 241
    }
}

//MARK: - UI
extension HomeVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setProfileButton()
    }
    
    private func setTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.separatorColor = .clear
    }
    
    private func setTableViewNib() {
        let bannerNib = UINib(nibName: "HomeBannerTVC", bundle: nil)
        homeTableView.register(bannerNib, forCellReuseIdentifier: HomeBannerTVC.identifier)
        
        let followerNib = UINib(nibName: "HomeFollowerTVC", bundle: nil)
        homeTableView.register(followerNib, forCellReuseIdentifier: HomeFollowerTVC.identifier)
        
        let popularNib = UINib(nibName: "HomePopularCourseTVC", bundle: nil)
        homeTableView.register(popularNib, forCellReuseIdentifier: HomePopularCourseTVC.identifier)
        
        let bookmarkNib = UINib(nibName: "HomeBookmarkCourseTVC", bundle: nil)
        homeTableView.register(bookmarkNib, forCellReuseIdentifier: HomeBookmarkCourseTVC.identifier)
        
        let latestNib = UINib(nibName: "HomeLatestCourseTVC", bundle: nil)
        homeTableView.register(latestNib, forCellReuseIdentifier: HomeLatestCourseTVC.identifier)
    }
    
    private func setProfileButton() {
        profileButton.layer.cornerRadius = 21
        profileButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        profileButton.layer.shadowOpacity = 1.0
        profileButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        profileButton.layer.shadowRadius = 3
    }
}

// MARK: - Protocol
extension HomeVC: cellPresentDelegate {
    func cellTapedPopularCourse() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "PopularCourseVC") as? PopularCourseVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func cellTapedBookmarkCourse() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "BookmarkCourseVC") as? BookmarkCourseVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func cellTapedLatestCourse() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "LatestCourseVC") as? LatestCourseVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func collectionViewCellTapedCourse(dvc: CourseDetailVC) {
        dvc.cellTitle = "북악산 달려라 달려 달려라!!"
        dvc.cellTime = "시간 1시간 30분"
        dvc.cellDistance = "거리 6.0km"
        dvc.isHomeCell = true
        dvc.modalPresentationStyle = .fullScreen
        dvc.modalTransitionStyle = .crossDissolve
        present(dvc, animated: true, completion: nil)
    }
}
