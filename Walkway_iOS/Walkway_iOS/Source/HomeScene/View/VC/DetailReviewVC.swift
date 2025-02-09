//
//  DetailReviewVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit
import Moya

class DetailReviewVC: UIViewController {
    private let authProvider = MoyaProvider<CourseService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var review: ReviewDetailModel?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var reviewTableView: UITableView!
    
    var courseReviews: [Comments] = []
    var courseId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getReview()
        setTableView()
        setView()
        setButton()
    }
}

// MARK: TableViewDelegate
extension DetailReviewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseReviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewViewAllTVC.identifier) as? ReviewViewAllTVC else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setData(review: courseReviews[indexPath.row])
        return cell
    }
}

extension DetailReviewVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = tableView.bounds.size.width - 21 - 21
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.text = courseReviews[indexPath.row].content
        label.preferredMaxLayoutWidth = width
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.contentMode = .scaleToFill
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.sizeToFit()
        
        let calculateHeight = label.intrinsicContentSize.height + 80
        return calculateHeight
    }
}

// MARK: - UI
extension DetailReviewVC {
    private func setUI() {
        
        setTableViewNib()
 
    }
    
    private func setTableView() {
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.separatorInset.right = -10
    }
    
    private func setTableViewNib() {
        let nibName = UINib(nibName: "ReviewViewAllTVC", bundle: nil)
        reviewTableView.register(nibName, forCellReuseIdentifier: ReviewViewAllTVC.identifier)
    }
    
    private func setView() {
        setupStatusBar(UIColor.gray50)
        navigationBarView.backgroundColor = .gray50
    }
    
    private func setButton() {
        closeButton.tintColor = .bookmarkDarkBlue
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        closeButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
    }
}

// MARK: - Action
extension DetailReviewVC {
    @objc func touchUpClose() {
        dismiss(animated: false, completion: nil)
    }
}

// MARK: Network
extension DetailReviewVC {
    func getReview() {
        guard let id = courseId else {return}
        print(id)
        authProvider.request( .commentDetail(id)) { response in
            switch response {
                case .success(let result):
                    do {
                        self.review = try result.map(ReviewDetailModel.self)
                        self.courseReviews.append(contentsOf: self.review?.data.comment ?? [])
                        self.setUI()
                        self.reviewTableView.reloadData()
                    } catch(let err) {
                        print(err.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
}
