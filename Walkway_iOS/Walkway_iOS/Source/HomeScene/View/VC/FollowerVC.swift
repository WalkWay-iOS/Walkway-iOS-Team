//
//  FollowerVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerVC: UIViewController {
    @IBOutlet weak var followerTableView: UITableView!
    
    let closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .bookmarkDarkBlue
        closeButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        return closeButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UI
extension FollowerVC {
    private func setUI() {
        
    }
    
    private func setButton() {
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
    }
}
