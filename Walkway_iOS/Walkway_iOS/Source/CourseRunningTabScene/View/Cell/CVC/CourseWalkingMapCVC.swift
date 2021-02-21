//
//  CourseWalkingMapCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit
import GoogleMaps

class CourseWalkingMapCVC: UICollectionViewCell, GMSMapViewDelegate {
    static let identifier = "CourseWalkingMapCVC"
    
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var timerView: UIView!
    @IBOutlet var timerTitleLabel: UILabel!
    @IBOutlet var walkingTimeLabel: UILabel!
    
    var delegate: walkingCoursePresentDelegate?
    
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    
    var isStart: Bool = true
    var timer: Timer?
    var currentTimeCount: Int = 0
    
    let timeSelector: Selector = #selector(CourseWalkingMapCVC.updateTime)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        setTimer()
    }
}

// MARK: - UI
extension CourseWalkingMapCVC {
    func setUI() {
        setBackground()
        setLabel()
        setButton()
        setMap()
    }
    
    func setBackground() {
        timerView.backgroundColor = .systemIndigo
        timerView.layer.cornerRadius = 20
    }
    
    func setLabel() {
        timerTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        timerTitleLabel.textColor = .white
        timerTitleLabel.text = "Time"
        walkingTimeLabel.font = .systemFont(ofSize: 50, weight: .bold)
        walkingTimeLabel.textColor = .white
        walkingTimeLabel.text = "00:05"
        
    }
    
    func setButton() {
        pauseButton.setTitle("정지", for: .normal)
        pauseButton.setTitleColor(.white, for: .normal)
        pauseButton.backgroundColor = .systemIndigo
        pauseButton.layer.cornerRadius = 12
        pauseButton.addTarget(self, action: #selector(touchUpPause), for: .touchUpInside)
    }
    
    func setMap() {
        camera = GMSCameraPosition.camera(withLatitude: 37.54643, longitude: 126.96482, zoom: 14)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        
        self.backgroundView = mapView
    }
}

// MARK: - Action
extension CourseWalkingMapCVC {
    @objc func touchUpPause() {
        isStart = false
        timer?.invalidate()
        delegate?.buttonTappedPause()
    }
}

// MARK: - Timer
extension CourseWalkingMapCVC {
    func setTimer() {
        walkingTimeLabel.text = timeFormatter(0)
    }
    
    func timeFormatter(_ intTime: Int) -> String {
        let hour = intTime / 3600
        let minute = (intTime % 3600) / 60
        
        let hourString = hour < 10 ? "0\(hour)" : String(hour)
        let minuteString = minute < 10 ? "0\(minute)" : String(minute)
        
        return "\(hourString):\(minuteString)"
    }
    
    @objc func updateTime() {
        currentTimeCount += 1
        walkingTimeLabel.text = timeFormatter(currentTimeCount)
    }
}
