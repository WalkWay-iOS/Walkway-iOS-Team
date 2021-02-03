//
//  FollowerLatestTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerLatestTVC: UITableViewCell {
    static let identifier = "FollowerLatestTVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var courseTableView: UITableView!
    
    var courses: [String] = ["성수둘레길", "성수둘레길", "성수둘레길", "성수둘레", "성수"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - TableViewDelegate
extension FollowerLatestTVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: FollowerLatestCourseTVC.identifier) as? FollowerLatestCourseTVC else {
            return UITableViewCell()
        }
        cell.setTitle(title: courses[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension FollowerLatestTVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61
    }
}

// MARK: - UI
extension FollowerLatestTVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
    }
    
    private func setTableView() {
        courseTableView.delegate = self
        courseTableView.dataSource = self
        courseTableView.separatorInset.left = .zero
    }
    
    private func setTableViewNib() {
        let nibName = UINib(nibName: "FollowerLatestCourseTVC", bundle: nil)
        courseTableView.register(nibName, forCellReuseIdentifier: FollowerLatestCourseTVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "따릉이 님의 최근기록"
        titleLabel.font = .boldSystemFont(ofSize: 16)
    }
}
