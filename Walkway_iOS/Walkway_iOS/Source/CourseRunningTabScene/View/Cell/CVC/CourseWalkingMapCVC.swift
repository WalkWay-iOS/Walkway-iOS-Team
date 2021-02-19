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
    
    var delegate: walkingCoursePresentDelegate?
    
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - UI
extension CourseWalkingMapCVC {
    func setUI() {
        setButton()
        setMap()
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
        delegate?.buttonTappedPause()
    }
}
