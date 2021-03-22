//
//  DetailReviewTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/26.
//

import UIKit

class DetailReviewTVC: UITableViewCell {
    static let identifier = "DetailReviewTVC"
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var noReviewView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var courseTableView: UITableView!
    
    var delegate: detailDelegate?
    
    var courseReviews: [Comments] = []
    var reviewCounter = 0
    var rate: Double = 0.0
    var isFirst = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - TableViewDelegate
extension DetailReviewTVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewCounter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTVC.identifier) as? ReviewTVC else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setData(review: courseReviews[indexPath.row])
        return cell
    }
}

extension DetailReviewTVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
}

// MARK: - UI
extension DetailReviewTVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setView()
        setLabel()
        setButton()
    }
    
    private func setTableView() {
        reviewCounter = courseReviews.count
        
        if reviewCounter == 0 {
            courseTableView.isHidden = true
        } else {
            courseTableView.isHidden = false
        }
        
        courseTableView.delegate = self
        courseTableView.dataSource = self
        courseTableView.separatorInset.left = 0
    }
    
    private func setTableViewNib() {
        let nibName = UINib(nibName: "ReviewTVC", bundle: nil)
        courseTableView.register(nibName, forCellReuseIdentifier: ReviewTVC.identifier)
    }
    
    private func setView() {
        bottomView.backgroundColor = .gray40
        noReviewView.backgroundColor = .gray20
        setNoDataView()
    }
    
    private func setNoDataView() {
        reviewCounter = courseReviews.count
        let noDataLabel = UILabel()
        
        if reviewCounter == 0 {
            noDataLabel.isHidden = false
            noDataLabel.text = "코스 참가 후기가 없어요🙅🏻‍♀️"
            noDataLabel.font = .systemFont(ofSize: 13, weight: .semibold)
            noDataLabel.textColor = .gray50
            noDataLabel.translatesAutoresizingMaskIntoConstraints = false
            
            noReviewView.addSubview(noDataLabel)
            noDataLabel.centerXAnchor.constraint(equalTo: noReviewView.centerXAnchor).isActive = true
            noDataLabel.centerYAnchor.constraint(equalTo: noReviewView.centerYAnchor).isActive = true
        } else {
            noDataLabel.isHidden = true
        }
    }
    
    private func setLabel() {
        if reviewCounter > 99 {
            titleLabel.text = "코스 참가 후기(99+)"
        } else {
            titleLabel.text = "코스 참가 후기(\(reviewCounter))"
        }
        titleLabel.font = .myBoldSystemFont(ofSize: 20)
        
        rateLabel.font = .myRegularSystemFont(ofSize: 15)
        rateLabel.textColor = .gray70
        rateLabel.text = "⭐️\(rate)/5.0"
    }
    
    private func setButton() {
        viewAllButton.setTitle("전체보기", for: .normal)
        viewAllButton.titleLabel?.font = .myMediumSystemFont(ofSize: 13)
        viewAllButton.setTitleColor(.gray70, for: .normal)
        viewAllButton.addTarget(self, action: #selector(touchUpViewAll), for: .touchUpInside)
    }
    
    func setData(comments: [Comments], rate: Double) {
        courseReviews.removeAll()
        courseReviews.append(contentsOf: comments)
        if isFirst == false {
            reviewCounter = courseReviews.count
            isFirst = true
        }
        self.rate = rate
        print(reviewCounter)
        
        setUI()
    }
}

// MARK: - Action
extension DetailReviewTVC {
    @objc func touchUpViewAll() {
        guard let dvc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "DetailReviewVC") as? DetailReviewVC else {
            return
        }
        delegate?.cellTapedReview(dvc: dvc)
    }
}
