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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - UI
extension CoursePauseVC {
    func setUI() {
        setLabel()
        setButton()
    }
    
    func setLabel() {
        courseNameLabel.font = .systemFont(ofSize: 15, weight: .bold)
        courseNameLabel.textColor = .darkGray
        courseNameLabel.text = "[관악산 달빛 둘레길]"
        distanceTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        distanceTitleLabel.textColor = .systemIndigo
        distanceTitleLabel.text = "함께 산책한 거리"
        timeTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        timeTitleLabel.textColor = .systemIndigo
        timeTitleLabel.text = "함께 산책한 시간"
        distanceLabel.font = .systemFont(ofSize: 30, weight: .bold)
        distanceLabel.textColor = .black
        distanceLabel.text = "0.00"
        timeLabel.font = .systemFont(ofSize: 30, weight: .bold)
        timeLabel.textColor = .black
        timeLabel.text = "00:00"
        restartTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        restartTitleLabel.textColor = .darkGray
        restartTitleLabel.text = "다시 걷기"
        stopTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        stopTitleLabel.textColor = .darkGray
        stopTitleLabel.text = "종료"
    }
    
    func setButton() {
        restartButton.setTitle("", for: .normal)
        restartButton.backgroundColor = .systemIndigo
        restartButton.tintColor = .white
        restartButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        restartButton.addTarget(self, action: #selector(touchUpRestart), for: .touchUpInside)
        stopButton.setTitle("", for: .normal)
        stopButton.backgroundColor = .systemIndigo
        stopButton.tintColor = .white
        stopButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        stopButton.addTarget(self, action: #selector(touchUpStop), for: .touchUpInside)
    }
}

// MARK: - Action
extension CoursePauseVC {
    @objc func touchUpRestart() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpStop() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "CourseCompleteVC") as? CourseCompleteVC else {
            return
        }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}
