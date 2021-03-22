//
//  CourseWalkingVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit
import Moya

class CourseWalkingVC: UIViewController {
    private let authProvider = MoyaProvider<CourseService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var courseData: RunningModel?

    @IBOutlet var pageController: UIPageControl!
    @IBOutlet var courseWalkingCollectionView: UICollectionView!
    
    var delegate: walkingCoursePresentDelegate?
    var courseId: String?
    var titleText: String?
    var courseContent: String = ""
    var coursePos: [[Double]] = [[]]
    var landmark: [String] = []
    
    var onceOnly = false
    
    override func viewDidAppear(_ animated: Bool) {
        if !onceOnly {
            courseWalkingCollectionView.scrollToItem(at: IndexPath(item: 0, section: 1), at: .centeredHorizontally, animated: true)
            onceOnly = true
            pageController.currentPage = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        getCourse()
    }
}

// MARK: - CollectionViewDelegate
extension CourseWalkingVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseWalkingSettingNotificationCVC.identifier, for: indexPath) as? CourseWalkingSettingNotificationCVC else {
                return UICollectionViewCell()
            }
            return cell
        }
        
        else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseWalkingMapCVC.identifier, for: indexPath) as? CourseWalkingMapCVC else {
                return UICollectionViewCell()
            }
            cell.setData(pos: coursePos)
            cell.delegate = self
            return cell
        }
        
        else if indexPath.section == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseWalkingInfoCVC.identifier, for: indexPath) as? CourseWalkingInfoCVC else {
                return UICollectionViewCell()
            }
            cell.setData(title: titleText ?? "", content: courseContent, hashtags: landmark)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension CourseWalkingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - UI
extension CourseWalkingVC {
    func setUI() {
        setCollectionView()
        setPageControl()
        setCollectionViewNib()
    }
    
    func setCollectionView() {
        courseWalkingCollectionView.dataSource = self
        courseWalkingCollectionView.delegate = self
    }
    
    func setCollectionViewNib() {
        let settingNib = UINib(nibName: "CourseWalkingSettingNotificationCVC", bundle: nil)
        courseWalkingCollectionView.register(settingNib, forCellWithReuseIdentifier: CourseWalkingSettingNotificationCVC.identifier)
        
        let mapNib = UINib(nibName: "CourseWalkingMapCVC", bundle: nil)
        courseWalkingCollectionView.register(mapNib, forCellWithReuseIdentifier: CourseWalkingMapCVC.identifier)
        
        let infoNib = UINib(nibName: "CourseWalkingInfoCVC", bundle: nil)
        courseWalkingCollectionView.register(infoNib, forCellWithReuseIdentifier: CourseWalkingInfoCVC.identifier)
    }
    
    func setPageControl() {
        pageController.numberOfPages = 3
        pageController.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        pageController.pageIndicatorTintColor = .gray50
        pageController.tintColor = .blue
    }
}

// MARK: - PageControl
extension CourseWalkingVC {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

// MARK: - Protocol
extension CourseWalkingVC: walkingCoursePresentDelegate {
    func buttonTappedCourseMap() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "CourseWalkingVC") as? CourseWalkingVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func buttonTappedPause(dvc: CoursePauseVC) {
        present(dvc, animated: true, completion: nil)
    }
    
    func buttonTappedStop() {
        
    }
}

// MARK: Network
extension CourseWalkingVC {
    func getCourse() {
        authProvider.request(.running(self.courseId ?? "")) { response in
            switch response {
                case .success(let result):
                    do {
                        let courseData = try result.map(RunningModel.self)
                        self.courseContent = courseData.data.content
                        self.coursePos = courseData.data.position
                        self.landmark = courseData.data.landmark
                        self.setUI()
                        self.courseWalkingCollectionView.reloadData()
                    } catch(let err) {
                        print(err.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
}
