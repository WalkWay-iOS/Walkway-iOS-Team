//
//  MakeCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/28.
//

import UIKit
import GoogleMaps
import Alamofire
import SwiftyJSON

class MakeCourseVC: UIViewController {
    var closeButton = UIButton()
    var removeButton = UIButton()
    var createCourseButton = UIButton()
    var saveButton = UIButton()
    var hiddenView = UIButton()
    var hiddenLabel = UILabel()
    var centerLabel = UILabel()
    
    var marker = GMSMarker()
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    
    var zoomValue: Float = 16.0
    var lat: CLLocationDegrees = 0.0
    var long: CLLocationDegrees = 0.0
    var coordinates: [CLLocationCoordinate2D] = []
    
    var didTap: Bool = true

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
        if didTap {
            let lati = coordinate.latitude
            let longi = coordinate.longitude
            
            coordinates.append(CLLocationCoordinate2D(latitude: lati, longitude: longi))
            setLine()
            
            if coordinates.count > 1 {
                createCourseButton.isHidden = false
            }
        }
    }
    
    private func setLine() {
        let path = GMSMutablePath()
        for coord in coordinates {
            path.add(coord)
        }
        let line = GMSPolyline(path: path)
        line.strokeColor = .latestBurgundy
        line.strokeWidth = 3.0
        line.geodesic = true
        line.map = self.mapView
    }
    
    func getRoute(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) {
        let sourceLocation = "\(from.latitude),\(from.longitude)"
        let destinationLocation = "\(to.latitude),\(to.longitude)"
        // MARK: Create URL
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(sourceLocation)&destination=\(destinationLocation)&mode=driving&key=YOUR_API_KEY"

        // MARK: Request for response from the google
        AF.request(url).responseJSON { (reseponse) in
            guard let data = reseponse.data else {
                return
            }
            
            do {
                let jsonData = try JSON(data: data)
                let routes = jsonData["routes"].arrayValue
                
                for route in routes {
                    let overview_polyline = route["overview_polyline"].dictionary
                    let points = overview_polyline?["points"]?.string
                    let path = GMSPath.init(fromEncodedPath: points ?? "")
                    let polyline = GMSPolyline.init(path: path)
                    polyline.geodesic = true
                    polyline.strokeColor = .latestBurgundy
                    polyline.strokeWidth = 5
                    polyline.map = self.mapView
                }
                
                let sourceMarker = GMSMarker()
                sourceMarker.position = CLLocationCoordinate2D(latitude: from.latitude, longitude: from.longitude)
                sourceMarker.map = self.mapView
                
                let destinationMarker = GMSMarker()
                destinationMarker.position = CLLocationCoordinate2D(latitude: to.latitude, longitude: to.longitude)
                destinationMarker.map = self.mapView
                
                let camera = GMSCameraPosition(latitude: from.latitude, longitude: from.longitude, zoom: 15.0)
                self.mapView.animate(to: camera)
            }
                catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UI
extension MakeCourseVC {
    private func setUI() {
        setView()
        setButton()
        setLabel()
    }
    
    private func setView() {
        hiddenView.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5)
        hiddenView.setTitle("", for: .normal)
        hiddenView.addTarget(self, action: #selector(touchUpHiddenView), for: .touchUpInside)
        hiddenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hiddenView)
        hiddenView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hiddenView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hiddenView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hiddenView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
        
        createCourseButton.setTitle("경로생성", for: .normal)
        createCourseButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        createCourseButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        createCourseButton.addTarget(self, action: #selector(touchUpCreate), for: .touchUpInside)
        createCourseButton.translatesAutoresizingMaskIntoConstraints = false
        createCourseButton.isHidden = true
        view.addSubview(createCourseButton)
        createCourseButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 38).isActive = true
        createCourseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        saveButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        saveButton.addTarget(self, action: #selector(touchUpSave), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.isHidden = true
        view.addSubview(saveButton)
        saveButton.topAnchor.constraint(equalTo: createCourseButton.topAnchor).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: createCourseButton.leadingAnchor, constant: -10).isActive = true
    }
    
    private func setLabel() {
        hiddenLabel.text = "자신만의 Walkway를 만들어봐요.\n원하는 길을 탭해보세요👆🏼"
        hiddenLabel.numberOfLines = 2
        hiddenLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        hiddenLabel.textColor = .white
        hiddenLabel.translatesAutoresizingMaskIntoConstraints = false
        hiddenView.addSubview(hiddenLabel)
        hiddenLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        hiddenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        centerLabel.text = "📍"
        centerLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        centerLabel.textColor = .white
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        hiddenView.addSubview(centerLabel)
        centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

// MARK: - Action
extension MakeCourseVC {
    @objc func touchUpHiddenView() {
        hiddenView.isHidden = true
    }
    
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpRemove() {
        mapView.clear()
        coordinates.removeAll()
        createCourseButton.isHidden = true
        saveButton.isHidden = true
        didTap = true
    }
    
    @objc func touchUpCreate() {
        print("경로생성")
        saveButton.isHidden = false
        
        let index = coordinates.count - 1
        getRoute(from: coordinates[0], to: coordinates[index])
        didTap = false
    }
    
    @objc func touchUpSave() {
        print("저장")
    }
}
