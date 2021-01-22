//
//  PopularCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class PopularCourseVC: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var seoulButton: UIButton!
    @IBOutlet weak var jejuButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularTableView: UITableView!
    
    let data: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension PopularCourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularCourseTVC.identifier) as? PopularCourseTVC else {
            return UITableViewCell()
        }
        return cell
    }
}

extension PopularCourseVC: UITableViewDelegate {}

// MARK: - UI
extension PopularCourseVC  {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
        setButton()
    }
    
    private func setTableView() {
        popularTableView.delegate = self
        popularTableView.dataSource = self
    }
    
    private func setTableViewNib() {
        let nibName = UINib(nibName: "PopularCourseTVC", bundle: nil)
        popularTableView.register(nibName, forCellReuseIdentifier: PopularCourseTVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "인기 추천 코스"
        titleLabel.font = .boldSystemFont(ofSize: 26)
    }
    
    private func setButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .blue
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
        
        seoulButton.setTitle("#서울", for: .normal)
        seoulButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        seoulButton.setTitleColor(.white, for: .normal)
        seoulButton.backgroundColor = .bookmarkGray
        seoulButton.layer.cornerRadius = 13
        seoulButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        seoulButton.layer.shadowOpacity = 1.0
        seoulButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        seoulButton.layer.shadowRadius = 3
        
        jejuButton.setTitle("#제주", for: .normal)
        jejuButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        jejuButton.setTitleColor(.white, for: .normal)
        jejuButton.backgroundColor = .popularGreen
        jejuButton.layer.cornerRadius = 13
        jejuButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        jejuButton.layer.shadowOpacity = 1.0
        jejuButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        jejuButton.layer.shadowRadius = 3
    }
}

// MARK: - Action
extension PopularCourseVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
}
