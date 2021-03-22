//
//  HomeVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit
import Moya

class HomeVC: UIViewController {
    private let authProvider = MoyaProvider<HomeServices>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var homeModel: HomeModel?
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var homeTableView: UITableView!
    
    var followers: [Follower] = []
    var bookmarks: [Course] = []
    var latests: [Course] = []
    var populars: [Course] = []
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHome()
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
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeFollowerTVC.identifier) as? HomeFollowerTVC else {
                return UITableViewCell()
            }
            cell.follower = followers
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomePopularCourseTVC.identifier) as? HomePopularCourseTVC else {
                return UITableViewCell()
            }
            cell.populars = populars
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeBookmarkCourseTVC.identifier) as? HomeBookmarkCourseTVC else {
                return UITableViewCell()
            }
            cell.bookmarks = bookmarks
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeLatestCourseTVC.identifier) as? HomeLatestCourseTVC else {
                return UITableViewCell()
            }
            cell.latests = latests
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
        profileButton.addTarget(self, action: #selector(touchUpProfile), for: .touchUpInside)
    }
    
    private func setReload() {
        homeTableView.reloadData()
    }
}

// MARK: - Action
extension HomeVC {
    @objc func touchUpProfile() {
        let alert = UIAlertController(title: "Walkway", message: "Walkway와 함께 즐거운 산책되세요", preferredStyle: UIAlertController.Style.actionSheet)
        let courseAction = UIAlertAction(title: "찜한 코스", style: .default)
        let photoAction =  UIAlertAction(title: "찜한 사진", style: .default, handler: nil)
        let latestAction = UIAlertAction(title: "최근 본 목록", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(courseAction)
        alert.addAction(photoAction)
        alert.addAction(latestAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
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
        dvc.modalPresentationStyle = .fullScreen
        dvc.modalTransitionStyle = .crossDissolve
        present(dvc, animated: true, completion: nil)
    }
    
    func collectionViewCellTapedFollower(dvc: FollowerVC) {
        dvc.modalPresentationStyle = .fullScreen
        dvc.modalTransitionStyle = .crossDissolve
        present(dvc, animated: true, completion: nil)
    }
    
    func collectionViewCellTapedBanner(dvc: BannerVC) {
        dvc.modalPresentationStyle = .fullScreen
        dvc.modalTransitionStyle = .crossDissolve
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: Network
extension HomeVC {
    func setHome() {
        authProvider.request(.main) { response in
            switch response {
            case .success(let result):
                do {
                    self.homeModel = try result.map(HomeModel.self)
                    self.followers.append(contentsOf: self.homeModel?.data.follower ?? [])
                    self.populars.append(contentsOf: self.homeModel?.data.popularCourse ?? [])
                    self.bookmarks.append(contentsOf: self.homeModel?.data.bookmarkCourse ?? [])
                    self.latests.append(contentsOf: self.homeModel?.data.latestCourse ?? [])
                    self.setUI()
                    self.setReload()
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
