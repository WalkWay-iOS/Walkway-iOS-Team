//
//  DetailPhotoPopUpVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/05.
//

import UIKit

class DetailPhotoPopUpVC: UIViewController {
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var isLike = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTouchAction()
    }
}

// MARK: - UI
extension DetailPhotoPopUpVC {
    private func setUI() {
        setView()
        setButton()
        setLabel()
    }
    
    private func setView() {
        popUpView.layer.cornerRadius = 15
        popUpView.backgroundColor = .gray50
    }
    
    private func setButton() {
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.titleLabel?.font = .myMediumSystemFont(ofSize: 13)
        profileButton.backgroundColor = .bookmarkDarkBlue
        profileButton.layer.cornerRadius = 15
        profileButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        profileButton.layer.shadowOpacity = 1.0
        profileButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        profileButton.layer.shadowRadius = 3
        profileButton.setTitle("따", for: .normal)
        profileButton.isUserInteractionEnabled = false
        
        likeButton.tintColor = .bookmarkDarkBlue
        likeButton.setPreferredSymbolConfiguration(.init(pointSize: 27, weight: .regular, scale: .large), forImageIn: .normal)
        likeButton.addTarget(self, action: #selector(touchUpLike), for: .touchUpInside)
        settingLike()
    }
    
    private func setLabel() {
        nameLabel.font = .myMediumSystemFont(ofSize: 13)
        nameLabel.textColor = .gray60
        nameLabel.text = "따릉이"
        
        dateLabel.font = .myMediumSystemFont(ofSize: 13)
        dateLabel.textColor = .gray60
        dateLabel.text = "21. 02. 03"
    }
    
    private func settingLike() {
        if isLike {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else if isLike == false {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}

// MARK: - Action
extension DetailPhotoPopUpVC {
    @objc func touchUpLike() {
        if isLike {
            isLike = false
        } else {
            isLike = true
        }
        settingLike()
    }
}

//MARK: Touch Action
extension DetailPhotoPopUpVC {
    private func setTouchAction() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissGestureView))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissGestureView() {
        dismiss(animated: true, completion: nil)
    }
}
