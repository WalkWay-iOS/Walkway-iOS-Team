//
//  CourseDetailVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/24.
//

import UIKit
import Moya

class CourseDetailVC: UIViewController {
    private let authProvider = MoyaProvider<CourseService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var courseData: CourseDetailModel?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var detailTableView: UITableView!
    
    let explainButton = UIButton()
    let reviewButton = UIButton()
    let photoButton = UIButton()
    
    let headerExplainButton = UIButton()
    let headerReviewButton = UIButton()
    let headerPhotoButton = UIButton()
    var stickyView = UIView()
    
    var cellTitle: String?
    var cellDistance: String?
    var cellTime: String?
    var cellRate: Float?
    var isHomeCell: Bool?
    var courseId: String?
    
    var currentPage = 0
    
    var courses: DetailCourse = DetailCourse.init(rateAverage: 0, strengthAverage: 0, isSeoul: true, image: "", official: 0, usesCount: 0, bookmarkCount: 0, position: [[0]], placeName: [""], id: "", title: "", distance: 0, time: "", content: "", hashtag: [Hashtag(referCount: 0, id: "", keyword: "")], user: "", createdAt: "", updatedAt: "", v: 0)
    var comments: [Comments] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCourseDetail()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension CourseDetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailHeaderTVC.identifier) as? DetailHeaderTVC else {
                return UITableViewCell()
            }
            cell.setData(course: courses)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailExplanationTVC.identifier) as? DetailExplanationTVC else {
                return UITableViewCell()
            }
            cell.setData(course: courses)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailReviewTVC.identifier) as? DetailReviewTVC else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.setData(comments: comments, rate: courses.rateAverage)
            cell.selectionStyle = .none
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailPhotoTVC.identifier) as? DetailPhotoTVC else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
}

extension CourseDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 465
        } else if indexPath.section == 1 {
            return 350
        } else if indexPath.section == 2 {
            return 430
        }
        return 370
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 28))
            
            let lineView = UIView()
            lineView.backgroundColor = .gray50
            lineView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(lineView)
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            lineView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 0
            stackView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(stackView)
            stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            stackView.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -20).isActive = true
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            explainButton.setTitle("설명", for: .normal)
            explainButton.addTarget(self, action: #selector(scrollToExplanation), for: .touchUpInside)
            explainButton.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(explainButton)


            reviewButton.setTitle("후기", for: .normal)
            reviewButton.addTarget(self, action: #selector(scrollToReview), for: .touchUpInside)
            reviewButton.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(reviewButton)

            photoButton.setTitle("후기사진", for: .normal)
            photoButton.addTarget(self, action: #selector(scrollToPhoto), for: .touchUpInside)
            photoButton.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(photoButton)
            
            setButtonColor()
            
            return view
        }
        return UIView()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 28
        }
        return CGFloat.leastNormalMagnitude
    }
}

// MARK: - UI
extension CourseDetailVC {
    private func setUI() {
        setTableView()
        setBottomBar()
    }
    
    private func setTableView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.separatorStyle = .none
    }
    
    private func setTableViewNib() {
        let headerNib = UINib(nibName: "DetailHeaderTVC", bundle: nil)
        detailTableView.register(headerNib, forCellReuseIdentifier: DetailHeaderTVC.identifier)
        
        let explanationNib = UINib(nibName: "DetailExplanationTVC", bundle: nil)
        detailTableView.register(explanationNib, forCellReuseIdentifier: DetailExplanationTVC.identifier)
        
        let reviewNib = UINib(nibName: "DetailReviewTVC", bundle: nil)
        detailTableView.register(reviewNib, forCellReuseIdentifier: DetailReviewTVC.identifier)
        
        let photoNib = UINib(nibName: "DetailPhotoTVC", bundle: nil)
        detailTableView.register(photoNib, forCellReuseIdentifier: DetailPhotoTVC.identifier)
    }
    
    private func setButton() {
        closeButton.tintColor = .bookmarkDarkBlue
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        closeButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
    }
    
    private func setView() {
        view.backgroundColor = .gray50
        setupStatusBar(UIColor.gray50)
        navigationBarView.backgroundColor = .gray50
        stickyView.isHidden = true
    }
    
    private func setBottomBar() {
        let bottomView = UIView()
        bottomView.backgroundColor = .gray50
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let bookmarkButton = UIButton()
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        bookmarkButton.tintColor = .bookmarkDarkBlue
        bookmarkButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(bookmarkButton)
        bookmarkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        bookmarkButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        bookmarkButton.setContentHuggingPriority(.required, for: .horizontal)
        
        let shareButton = UIButton()
        shareButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        shareButton.tintColor = .bookmarkDarkBlue
        shareButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(shareButton)
        shareButton.leadingAnchor.constraint(equalTo: bookmarkButton.trailingAnchor, constant: 25).isActive = true
        shareButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        shareButton.setContentHuggingPriority(.required, for: .horizontal)
        
        let startButton = UIButton()
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = .myBoldSystemFont(ofSize: 16)
        startButton.backgroundColor = .bookmarkDarkBlue
        startButton.layer.cornerRadius = 17
        startButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(startButton)
        startButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 25).isActive = true
        startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        startButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        startButton.addTarget(self, action: #selector(touchUpStart), for: .touchUpInside)
    }
    
    private func setButtonColor() {
        explainButton.setTitleColor(.gray70, for: .normal)
        explainButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        reviewButton.setTitleColor(.gray70, for: .normal)
        reviewButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        photoButton.setTitleColor(.gray70, for: .normal)
        photoButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        
        headerExplainButton.setTitleColor(.gray70, for: .normal)
        headerExplainButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        headerReviewButton.setTitleColor(.gray70, for: .normal)
        headerReviewButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        headerPhotoButton.setTitleColor(.gray70, for: .normal)
        headerPhotoButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        
        if currentPage == 1 {
            explainButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
            explainButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
            headerExplainButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
            headerExplainButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        } else if currentPage == 2 {
            reviewButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
            reviewButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
            headerReviewButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
            headerReviewButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        } else if currentPage == 3 {
            photoButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
            photoButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
            headerPhotoButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
            headerPhotoButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        }
    }
    
    private func setStickyHeader() {
        stickyView.isHidden = false
        stickyView = UIView.init(frame: CGRect.init(x: 0, y: 0, width:UIScreen.main.bounds.size.width, height: 50))
        stickyView.backgroundColor = .white
        stickyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stickyView)
        stickyView.topAnchor.constraint(equalTo:detailTableView.topAnchor).isActive = true
        stickyView.leadingAnchor.constraint(equalTo:detailTableView.leadingAnchor).isActive = true
        stickyView.trailingAnchor.constraint(equalTo:detailTableView.trailingAnchor).isActive = true
        stickyView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let lineView = UIView()
        lineView.backgroundColor = .gray50
        lineView.translatesAutoresizingMaskIntoConstraints = false
        stickyView.addSubview(lineView)
        lineView.leadingAnchor.constraint(equalTo:stickyView.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo:stickyView.trailingAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: stickyView.bottomAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stickyView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: stickyView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: lineView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo:stickyView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:stickyView.trailingAnchor).isActive = true
        
        headerExplainButton.setTitle("설명", for: .normal)
        headerExplainButton.addTarget(self, action: #selector(scrollToExplanation), for:.touchUpInside)
        headerExplainButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(headerExplainButton)
        headerReviewButton.setTitle("후기", for: .normal)
        headerReviewButton.addTarget(self, action: #selector(scrollToReview), for:.touchUpInside)
        headerReviewButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(headerReviewButton)
        headerPhotoButton.setTitle("후기사진", for: .normal)
        headerPhotoButton.addTarget(self, action: #selector(scrollToPhoto), for:.touchUpInside)
        headerPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(headerPhotoButton)
        
        setButtonColor()
    }
}

// MARK: - Action
extension CourseDetailVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func scrollToExplanation() {
        detailTableView.scroll(to: .top)
    }
    
    @objc func scrollToReview() {
        detailTableView.scroll(to: .center)
    }
    
    @objc func scrollToPhoto() {
        detailTableView.scroll(to: .bottom)
    }
    
    @objc func touchUpStart() {
        print("시작하자")
        let alert = UIAlertController(title: "함께 걸어보시겠어요?", message: "해당 ✨Walkway✨를 시작하면 반드시 후기를 적어야 합니다.\nWalkway와 함께 걸어보아요!", preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "나중에요", style: .cancel) { (Action) in
            
        }
        let okAction = UIAlertAction(title: "출발해요", style: .default) { (Action) in
            let dvc = UIStoryboard.init(name: "CourseRunningTab", bundle: nil)
            guard let vc = dvc.instantiateViewController(identifier: "CourseWalkingVC") as? CourseWalkingVC else {
                return
            }
            vc.titleText = self.courses.title
            vc.courseId = self.courseId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Header Control
extension CourseDetailVC {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if Int(scrollView.contentOffset.y) > 1090 {
            currentPage = 3
        } else if Int(scrollView.contentOffset.y) > 730 {
            currentPage = 2
        } else if Int(scrollView.contentOffset.y) > 300 {
            currentPage = 1
        } else {
            currentPage = 0
        }
        setButtonColor()
        
        if Int(scrollView.contentOffset.y) > 463 {
            stickyView.isHidden = false
        } else {
            stickyView.isHidden = true
        }
    }
}

// MARK: - Delegate
extension CourseDetailVC: detailDelegate {
    func cellTapedReview(dvc: DetailReviewVC) {
        dvc.courseId = courseId
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: false, completion: nil)
    }
    
    func cellTapedPhoto(dvc: DetailPhotoVC) {
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: false, completion: nil)
    }
}

// MARK: Network
extension CourseDetailVC {
    func getCourseDetail() {
        authProvider.request(.detail(self.courseId ?? "")) { response in
            switch response {
                case .success(let result):
                    do {
                        let courseData = try result.map(CourseDetailModel.self)
                        self.courses = courseData.data.course
                        self.comments.removeAll()
                        self.comments.append(contentsOf: courseData.data.comment)
                        self.setTableViewNib()
                        self.setStickyHeader()
                        self.setButton()
                        self.setView()
                        self.detailTableView.reloadData()
                    } catch(let err) {
                        print(err.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
}
