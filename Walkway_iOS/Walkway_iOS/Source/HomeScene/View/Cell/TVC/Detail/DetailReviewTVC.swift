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
    
    var courseReviews: [Review] = []
    var reviewCounter = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setReviewData()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - TableViewDelegate
extension DetailReviewTVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
        reviewCounter = courseReviews.count
        
        if reviewCounter > 99 {
            titleLabel.text = "코스 참가 후기(99+)"
        } else {
            titleLabel.text = "코스 참가 후기(\(reviewCounter))"
        }
        titleLabel.font = .myBoldSystemFont(ofSize: 20)
        
        rateLabel.font = .myRegularSystemFont(ofSize: 15)
        rateLabel.textColor = .gray70
    }
    
    private func setButton() {
        viewAllButton.setTitle("전체보기", for: .normal)
        viewAllButton.titleLabel?.font = .myMediumSystemFont(ofSize: 13)
        viewAllButton.setTitleColor(.gray70, for: .normal)
        viewAllButton.addTarget(self, action: #selector(touchUpViewAll), for: .touchUpInside)
    }
}

// MARK: - Data
extension DetailReviewTVC {
    func setRate(rate: Float, isHome: Bool) {
        if isHome {
            rateLabel.text = "⭐️4.8/5.0"
        } else {
            rateLabel.text = "⭐️\(rate)/5.0"
        }
    }
    
    private func setReviewData() {
        courseReviews.append(contentsOf: [
            Review(name: "tlsdbsdk0525", date: "20. 11. 12", rate: 4.3, content: "너무 좋습니다. 하나도 힘들지 않고 좋았습니다. 가족들이랑 같이 뛰었는데 정말 공기가 좋은 코스 더군요. 나중에 가족들 말고도 친구들하고도 함께 오고싶은 코스였습니다. 코스 한 바퀴 돌면서 좋은 생각도 들고 정말 좋은 코스였습니다. 코스 만들어주신 분 복 받으세요^^"),
            Review(name: "goSeoul0913", date: "20. 12. 20", rate: 3.5, content: "좋은 길이었습니다. 사색에 잠겨 걸을 수 있는 길. 정말 바람이 좋더라구요. 바람이 진짜 좋아요. 최곱니다. 아주 최고예요"),
            Review(name: "123087__", date: "21. 01. 15", rate: 4.5, content: "부모님이 좋아하셨습니다."),
            Review(name: "tlsdbsdk0525", date: "20. 11. 12", rate: 4.3, content: "너무 좋습니다. 하나도 힘들지 않고 좋았습니다. 가족들이랑 같이 뛰었는데 정말 공기가 좋은 코스 더군요. 나중에 가족들 말고도 친구들하고도 함께 오고싶은 코스였습니다. 코스 한 바퀴 돌면서 좋은 생각도 들고 정말 좋은 코스였습니다. 코스 만들어주신 분 복 받으세요^^"),
            Review(name: "goSeoul0913", date: "20. 12. 20", rate: 3.5, content: "좋은 길이었습니다. 사색에 잠겨 걸을 수 있는 길. 정말 바람이 좋더라구요. 바람이 진짜 좋아요. 최곱니다. 아주 최고예요"),
            Review(name: "123087__", date: "21. 01. 15", rate: 4.5, content: "부모님이 좋아하셨습니다."),
            Review(name: "tlsdbsdk0525", date: "20. 11. 12", rate: 4.3, content: "너무 좋습니다. 하나도 힘들지 않고 좋았습니다. 가족들이랑 같이 뛰었는데 정말 공기가 좋은 코스 더군요. 나중에 가족들 말고도 친구들하고도 함께 오고싶은 코스였습니다. 코스 한 바퀴 돌면서 좋은 생각도 들고 정말 좋은 코스였습니다. 코스 만들어주신 분 복 받으세요^^"),
            Review(name: "goSeoul0913", date: "20. 12. 20", rate: 3.5, content: "좋은 길이었습니다. 사색에 잠겨 걸을 수 있는 길. 정말 바람이 좋더라구요. 바람이 진짜 좋아요. 최곱니다. 아주 최고예요"),
            Review(name: "123087__", date: "21. 01. 15", rate: 4.5, content: "부모님이 좋아하셨습니다."),
            Review(name: "tlsdbsdk0525", date: "20. 11. 12", rate: 4.3, content: "너무 좋습니다. 하나도 힘들지 않고 좋았습니다. 가족들이랑 같이 뛰었는데 정말 공기가 좋은 코스 더군요. 나중에 가족들 말고도 친구들하고도 함께 오고싶은 코스였습니다. 코스 한 바퀴 돌면서 좋은 생각도 들고 정말 좋은 코스였습니다. 코스 만들어주신 분 복 받으세요^^"),
            Review(name: "goSeoul0913", date: "20. 12. 20", rate: 3.5, content: "좋은 길이었습니다. 사색에 잠겨 걸을 수 있는 길. 정말 바람이 좋더라구요. 바람이 진짜 좋아요. 최곱니다. 아주 최고예요"),
            Review(name: "123087__", date: "21. 01. 15", rate: 4.5, content: "부모님이 좋아하셨습니다.")
        ])
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
