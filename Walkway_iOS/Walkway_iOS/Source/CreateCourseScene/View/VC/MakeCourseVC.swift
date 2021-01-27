//
//  MakeCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/28.
//

import UIKit
import GoogleMaps

class MakeCourseVC: UIViewController {
    var closeButton = UIButton()
    var removeButton = UIButton()
    var saveButton = UIButton()
    
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    
    var zoomValue: Float = 16.0
    var lat: CLLocationDegrees = 0.0
    var long: CLLocationDegrees = 0.0
    var coordinates: [CLLocationCoordinate2D] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setMap()
        setLine()
        setUI()
    }
}

// MARK: - MAP
extension MakeCourseVC: GMSMapViewDelegate {
    private func setMap() {
        camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: zoomValue)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.delegate = self
        view = mapView
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        let lati = coordinate.latitude
        let longi = coordinate.longitude
        
        coordinates.append(CLLocationCoordinate2D(latitude: lati, longitude: longi))
        setLine()
    }
    
    private func setLine() {
        let path = GMSMutablePath()
        for coord in coordinates {
            path.add(coord)
        }
        let line = GMSPolyline(path: path)
        line.strokeColor = .bookmarkDarkBlue
        line.strokeWidth = 3.0
        line.map = self.mapView
    }
}

// MARK: - UI
extension MakeCourseVC {
    private func setUI() {
        setButton()
    }
    
    private func setButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .bookmarkDarkBlue
        closeButton.setPreferredSymbolConfiguration(.init(pointSize: 20, weight: .regular, scale: .large), forImageIn: .normal)
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        removeButton.setTitle("", for: .normal)
        removeButton.setImage(UIImage(systemName: "sparkles"), for: .normal)
        removeButton.layer.cornerRadius = 29
        removeButton.backgroundColor = .bookmarkDarkBlue
        removeButton.tintColor = .white
        removeButton.setPreferredSymbolConfiguration(.init(pointSize: 20, weight: .regular, scale: .large), forImageIn: .normal)
        removeButton.addTarget(self, action: #selector(touchUpRemove), for: .touchUpInside)
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(removeButton)
        removeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        removeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        removeButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        removeButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
}

// MARK: - Action
extension MakeCourseVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpRemove() {
        mapView.clear()
        coordinates.removeAll()
    }
}
