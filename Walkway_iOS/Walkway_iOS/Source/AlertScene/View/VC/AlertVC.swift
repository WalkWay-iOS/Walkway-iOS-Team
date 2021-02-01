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
    
    var isAlert = true
    
    var alerts: [String] = ["따릉이 님이 [ 광화문을 지나는 북악산 트래킹 ] 를 좋아합니다 !", "알림창만들기 님이 [ 서울숲에서 놀자 ] 를 북마크 했습니다 !", "알림창만들기 님이 당신을 팔로우 했습니다.", "따릉이 님이 [ 광화문을 지나는 북악산 트래킹 ] 를 좋아합니다 !", "알림창만들기 님이 [ 서울숲에서 놀자 ] 를 북마크 했습니다 !", "알림창만들기 님이 당신을 팔로우 했습니다.", "방금 새로운 뱃지를 획득했습니다! 확인해보세요!", "WalkWay를 완료했습니다! 기록을 확인해보세요!"]
    var messages: [Message] = [Message(name: "따릉이", content: "와 올리신 풍경 사진이 너무 좋아요! 추천해주신 코스별로 돌았는데 너무 좋네요."), Message(name: "관악산대장", content: "관악산으로 같이 코스 가시지 않겠습니까? 역시 산이란.. 함께 가는 맛이 있는 것이지요…"), Message(name: "쪽지창만들기", content: "좋아요하고 북마크했습니다~~ 반사 부탁드려요~~"), Message(name: "따릉이2", content: "와 올리신 풍경 사진이 너무 좋아요! 추천해주신 코스별로 돌았는데 너무 좋네요."), Message(name: "Walkway", content: "WalkWay의 개인정보 보호법이 변경된 점 안내드립니다."), Message(name: "Walkway", content: "달리자 달려 님, WalkWay와 함께 신나는 도심 속 산책이 될 수 있길 바라겠습니다.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension AlertVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isAlert {
            return alerts.count
        } else {
            return messages.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isAlert {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AlertTVC.identifier) as? AlertTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.setData(text: alerts[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageTVC.identifier) as? MessageTVC else {
                return UITableViewCell()
            }
            cell.setData(data: messages[indexPath.row])
            return cell
        }
        
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
        
        let messageNib = UINib(nibName: "MessageTVC", bundle: nil)
        alertTableView.register(messageNib, forCellReuseIdentifier: MessageTVC.identifier)
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
        
        isAlert = true
        alertTableView.reloadData()
    }
    
    private func selectedMessageButton() {
        alertButton.backgroundColor = .white
        alertButton.setTitle("", for: .normal)
        
        messageButton.backgroundColor = .gray30
        messageButton.setTitle("", for: .normal)
        
        isAlert = false
        alertTableView.reloadData()
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
