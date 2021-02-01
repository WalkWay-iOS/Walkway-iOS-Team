//
//  AlertVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit

class AlertVC: UIViewController {
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var alertTableView: UITableView!
    
    var alerts: [String] = ["따릉이 님이 [ 광화문을 지나는 북악산 트래킹 ] 를 좋아합니다 !", "알림창만들기 님이 [ 서울숲에서 놀자 ] 를 북마크 했습니다 !", "알림창만들기 님이 당신을 팔로우 했습니다.", "따릉이 님이 [ 광화문을 지나는 북악산 트래킹 ] 를 좋아합니다 !", "알림창만들기 님이 [ 서울숲에서 놀자 ] 를 북마크 했습니다 !", "알림창만들기 님이 당신을 팔로우 했습니다.", "방금 새로운 뱃지를 획득했습니다! 확인해보세요!", "WalkWay를 완료했습니다! 기록을 확인해보세요!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension AlertVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlertTVC.identifier) as? AlertTVC else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setData(text: alerts[indexPath.row])
        return cell
    }
}

extension AlertVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

// MARK: - UI
extension AlertVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setButton()
    }
    
    private func setTableView() {
        alertTableView.delegate = self
        alertTableView.dataSource = self
        alertTableView.backgroundColor = .gray30
        alertTableView.separatorColor = .clear
    }
    
    private func setTableViewNib() {
        let alertNib = UINib(nibName: "AlertTVC", bundle: nil)
        alertTableView.register(alertNib, forCellReuseIdentifier: AlertTVC.identifier)
    }
    
    private func setButton() {
        profileButton.layer.cornerRadius = 21
        profileButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        profileButton.layer.shadowOpacity = 1.0
        profileButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        profileButton.layer.shadowRadius = 3
        
        alertButton.addTarget(self, action: #selector(touchUpAlert), for: .touchUpInside)
        messageButton.addTarget(self, action: #selector(touchUpMessage), for: .touchUpInside)
        
        selectedAlertButton()
    }
    
    private func selectedAlertButton() {
        alertButton.backgroundColor = .gray30
        alertButton.setTitle("", for: .normal)
        
        messageButton.backgroundColor = .white
        messageButton.setTitle("", for: .normal)
    }
    
    private func selectedMessageButton() {
        alertButton.backgroundColor = .white
        alertButton.setTitle("", for: .normal)
        
        messageButton.backgroundColor = .gray30
        messageButton.setTitle("", for: .normal)
    }
}

// MARK: - Action
extension AlertVC {
    @objc func touchUpAlert() {
        selectedAlertButton()
    }
    
    @objc func touchUpMessage() {
        selectedMessageButton()
    }
}
