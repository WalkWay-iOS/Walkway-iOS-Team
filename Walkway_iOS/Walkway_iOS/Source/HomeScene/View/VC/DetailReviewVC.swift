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
    
    var courseReviews: [Comments] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
