//
//  CoursePauseVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CoursePauseVC: UIViewController {
    static let identifier = "CoursePauseVC"
    
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var distanceTitleLabel: UILabel!
    @IBOutlet var timeTitleLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var restartTitleLabel: UILabel!
    @IBOutlet var stopTitleLabel: UILabel!
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    
    var delegate: walkingCoursePresentDelegate?
    var courseId: String?
    
    var dismissView: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getText()
        setNotification()
    }
}

// MARK: - UI
extension CoursePauseVC {
    func setUI() {
        setLabel()
        setButton()
    }
    
    func setLabel() {
        courseNameLabel.font = .myBoldSystemFont(ofSize: 18)
        courseNameLabel.textColor = .gray70
        
        distanceTitleLabel.font = .myBoldSystemFont(ofSize: 13)
        distanceTitleLabel.textColor = .bookmarkDarkBlue
        distanceTitleLabel.text = "함께 산책한 거리"
        
        timeTitleLabel.font = .myBoldSystemFont(ofSize: 13)
        timeTitleLabel.textColor = .bookmarkDarkBlue
        timeTitleLabel.text = "함께 산책한 시간"
        
        distanceLabel.font = .myBoldSystemFont(ofSize: 30)
        distanceLabel.textColor = .black
        
        timeLabel.font = .myBoldSystemFont(ofSize: 30)
        timeLabel.textColor = .black
        
        restartTitleLabel.font = .myBoldSystemFont(ofSize: 15)
        restartTitleLabel.textColor = .gray70
        restartTitleLabel.text = "다시 걷기"
        
        stopTitleLabel.font = .myBoldSystemFont(ofSize: 15)
        stopTitleLabel.textColor = .latestBurgundy
        stopTitleLabel.text = "종료"
    }
    
    func setButton() {
        restartButton.setTitle("", for: .normal)
        restartButton.backgroundColor = .bookmarkDarkBlue
        restartButton.layer.cornerRadius = 10
        restartButton.tintColor = .white
        restartButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        restartButton.addTarget(self, action: #selector(touchUpRestart), for: .touchUpInside)
        
        stopButton.setTitle("", for: .normal)
        stopButton.backgroundColor = .bookmarkDarkBlue
        stopButton.layer.cornerRadius = 10
        stopButton.tintColor = .white
        stopButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        stopButton.addTarget(self, action: #selector(touchUpStop), for: .touchUpInside)
    }
    
    func getText() {
        let userDefault = UserDefaults.standard
        
        if let time = userDefault.string(forKey: "time") {
            timeLabel.text = time
        }
        
        if let title = userDefault.string(forKey: "title") {
            courseNameLabel.text = "[\(title)]"
        }
        
        if let distance = userDefault.object(forKey: "distance") {
            let num = distance as! Double
            print("disNum: \(num)")
            distanceLabel.text = "\(num)"
        }
    }
}

// MARK: - Action
extension CoursePauseVC {
    @objc func touchUpRestart() {
        dismissView?()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpStop() {
        print("끝내자")
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "CourseCompleteVC") as? CourseCompleteVC else {
            return
        }
        dvc.courseId = courseId
        dvc.modalPresentationStyle = .fullScreen
        dvc.modalTransitionStyle = .crossDissolve
        self.present(dvc, animated: true, completion: nil)
    }
}

// MARK: Notification
extension CoursePauseVC {
    private func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(saveAction), name: NSNotification.Name("recordSave"), object: nil)
    }
    
    @objc func saveAction() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
