//
//  DetailReviewVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class DetailReviewVC: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var reviewTableView: UITableView!
    
    var courseReviews: [Review] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setReviewData()
        setUI()
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
        setTableView()
        setTableViewNib()
        setView()
        setButton()
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

// MARK: - Data
extension DetailReviewVC {
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
