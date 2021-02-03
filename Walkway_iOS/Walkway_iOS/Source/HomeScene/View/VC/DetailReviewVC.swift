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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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
        
    }
    
    private func setTableViewNib() {
        
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
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}
