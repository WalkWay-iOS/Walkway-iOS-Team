//
//  MakeCreateCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/28.
//

import UIKit
import GoogleMaps
import MapKit

class MakeCreateCourseVC: UIViewController {
    var saveButton = UIButton()
    var closeButton = UIButton()
    var hiddenView = UIButton()
    var hiddenLabel = UILabel()
    
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    
    var lat: CLLocationDegrees = 0.0
    var long: CLLocationDegrees = 0.0
    var source: [CLLocationCoordinate2D] = []
    var destination: [CLLocationCoordinate2D] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMap()
        setMapMarkersRoute(vLoc: source[0], toLoc: destination[0])
        setUI()
    }
}

// MARK: - MAP
extension MakeCreateCourseVC: GMSMapViewDelegate {
    private func setMap() {
        camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 14.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.delegate = self
        view = mapView
    }
    
    func setMapMarkersRoute(vLoc: CLLocationCoordinate2D, toLoc: CLLocationCoordinate2D) {
        let markerTo = GMSMarker.init(position: toLoc)
        markerTo.icon = GMSMarker.markerImage(with: .latestBurgundy)
        markerTo.map = mapView
        let vMarker = GMSMarker.init(position: vLoc)
        vMarker.icon = GMSMarker.markerImage(with: .bookmarkDarkBlue)
        vMarker.map = mapView

        var bounds = GMSCoordinateBounds()
        bounds = bounds.includingCoordinate(vLoc)
        bounds = bounds.includingCoordinate(toLoc)
        self.mapView.moveCamera(GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)))

        getRoute(from: vLoc, to: toLoc)
    }
    
    func getRoute(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) {
        let source = MKMapItem(placemark: MKPlacemark(coordinate: from))
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: to))

        let request = MKDirections.Request()
        request.source = source
        request.destination = destination
        request.transportType = .walking
        request.requestsAlternateRoutes = false

        let directions = MKDirections(request: request)

        directions.calculate(completionHandler: { (response, error) in
            if let res = response {
                self.show(polyline: self.googlePolylines(from: res))
            }
        })
    }
    
    private func googlePolylines(from response: MKDirections.Response) -> GMSPolyline {
        let route = response.routes[0]
        var coordinates = [CLLocationCoordinate2D](
            repeating: kCLLocationCoordinate2DInvalid,
            count: route.polyline.pointCount)

        route.polyline.getCoordinates(
            &coordinates,
            range: NSRange(location: 0, length: route.polyline.pointCount))

        let path = GMSMutablePath()
        coordinates.forEach { path.add($0)}
        return GMSPolyline(path: path)
    }
    
    func show(polyline: GMSPolyline) {
        polyline.strokeColor = UIColor.latestBurgundy
        polyline.strokeWidth = 5
        
        polyline.map = mapView
    }
}

// MARK: - UI
extension MakeCreateCourseVC {
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
        
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        saveButton.titleLabel?.font = .myBoldSystemFont(ofSize: 17)
        saveButton.addTarget(self, action: #selector(touchUpSave), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 38).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    private func setLabel() {
        hiddenLabel.text = "함께 걸어보고 싶어요🥰\n경로를 생성하려면 저장버튼을 눌러주세요."
        hiddenLabel.numberOfLines = 2
        hiddenLabel.font = .myBoldSystemFont(ofSize: 17)
        hiddenLabel.textColor = .white
        hiddenLabel.translatesAutoresizingMaskIntoConstraints = false
        hiddenView.addSubview(hiddenLabel)
        hiddenLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        hiddenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    }
}

// MARK: - Action
extension MakeCreateCourseVC {
    @objc func touchUpHiddenView() {
        hiddenView.isHidden = true
    }
    
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpSave() {
        print("저장")
        guard let dvc = storyboard?.instantiateViewController(identifier: "CompleteCourseVC") as? CompleteCourseVC else {
            return
        }
        dvc.coordinates.append(contentsOf: source)
        dvc.coordinates.append(contentsOf: destination)
        dvc.isMakeCourse = false
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}
