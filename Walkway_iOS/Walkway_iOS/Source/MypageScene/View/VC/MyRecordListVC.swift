//
//  MyRecordListVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/15.
//

import UIKit

var myRecordDate = ["201210", "201217", "201224", "210101", "210110", "210111"]
var myRecordName = ["관악산 초급 코스", "관악산 초급 코스", "관악산 초급 코스", "관악산 초급 코스", "관악산 초급 코스", "관악산 초급 코스"]
var myRecordDistance = ["5km", "5km", "5km", "5km", "5km", "5km"]
var myRecordTime = ["1시간", "1시간", "1시간", "1시간", "1시간", "1시간"]

class MyRecordListVC: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var viewTitleLabel: UILabel!
    @IBOutlet var myRecordTableView: UITableView!
    
    var delegate: myPagePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStatusBar(.lightGray)
        setUI()
    }
}

// MARK: - TableViewDelegate
extension MyRecordListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyRecordListTVC.identifier) as? MyRecordListTVC else {
            return UITableViewCell()
        }
        cell.setData(record: myRecordDate[indexPath.row], name: myRecordName[indexPath.row],  distance: myRecordDistance[indexPath.row], time: myRecordTime[indexPath.row])
        return cell
    }
}

extension MyRecordListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: - UI
extension MyRecordListVC {
    func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
        setButton()
    }
    
    func setTableView() {
        myRecordTableView.delegate = self
        myRecordTableView.dataSource = self
    }
    
    func setTableViewNib() {
        let nibName = UINib(nibName: "MyRecordListTVC", bundle: nil)
        myRecordTableView.register(nibName, forCellReuseIdentifier: MyRecordListTVC.identifier)
    }
    
    func setLabel() {
        viewTitleLabel.font = .boldSystemFont(ofSize: 20)
        viewTitleLabel.text = "나의 기록"
    }
    
    func setButton() {
        backButton.setTitle("", for: .normal)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
    }
}

// MARK: - Action
extension MyRecordListVC {
    @objc func touchUpBack() {
        dismiss(animated: false, completion: nil)
    }
}
