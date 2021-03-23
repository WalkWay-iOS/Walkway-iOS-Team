//
//  CourseWalkingMapCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit
import GoogleMaps
import MapKit

class CourseWalkingMapCVC: UICollectionViewCell, GMSMapViewDelegate {
    static let identifier = "CourseWalkingMapCVC"

    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var timerTitleLabel: UILabel!
    @IBOutlet weak var walkingTimeLabel: UILabel!
    @IBOutlet weak var decimalTimeLabel: UILabel!
    
    var delegate: walkingCoursePresentDelegate?
    
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    var locationManager = CLLocationManager()
    
    var isStart: Bool = true
    var timer: Timer?
    var time = ""
    var currentTimeCount: Int = 0
    var realDistance: Double = 0.0
    
    let timeSelector: Selector = #selector(CourseWalkingMapCVC.updateTime)
    
    let userDefault = UserDefaults.standard
    
    var coursePos: [[Double]] = [[]]
    var globalPos: [CLLocationCoordinate2D] = []
    var coordinates: [CLLocation] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
}

// MARK: - UI
extension CourseWalkingMapCVC: CLLocationManagerDelegate {
    func setUI() {
        setBackground()
        setLabel()
        setButton()
        setMap()
    }
    
    func setBackground() {
        timerView.backgroundColor = UIColor.bookmarkDarkBlue.withAlphaComponent(0.8)
        timerView.layer.cornerRadius = 20
    }
    
    func setLabel() {
        timerTitleLabel.font = .myBoldSystemFont(ofSize: 20)
        timerTitleLabel.textColor = .white
        timerTitleLabel.text = "Time"
        walkingTimeLabel.font = .myBoldSystemFont(ofSize: 50)
        walkingTimeLabel.textColor = .white
        walkingTimeLabel.text = timeFormatter(0)
        
        decimalTimeLabel.text = timeFormatterSec(0)
        decimalTimeLabel.textColor = .white
        decimalTimeLabel.font = .myMediumSystemFont(ofSize: 15)
    }
    
    func setButton() {
        pauseButton.setTitle("정지", for: .normal)
        pauseButton.titleLabel?.font = .myBoldSystemFont(ofSize: 18)
        pauseButton.setTitleColor(.white, for: .normal)
        pauseButton.backgroundColor = .bookmarkDarkBlue
        pauseButton.layer.cornerRadius = 12
        pauseButton.addTarget(self, action: #selector(touchUpPause), for: .touchUpInside)
    }
    
    func setMap() {
        camera = GMSCameraPosition.camera(withLatitude: 37.54643, longitude: 126.96482, zoom: 14)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        self.backgroundView = mapView
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        if (gesture) {
            print("dragged")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        coordinates.append(location)
        print("Location: \(location)")

        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 18.0)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
    }
    
    private func drawMap() {
        if coursePos.count == 2 {
            var pos: [CLLocationCoordinate2D] = []
            for coord in coursePos {
                let lat = coord[0]
                let long = coord[1]
                let complainLoc = CLLocationCoordinate2DMake(lat, long)
                
                pos.append(complainLoc)
            }
            let location = GMSCameraPosition.camera(withLatitude: pos[0].latitude, longitude: pos[0].longitude, zoom: 17.0)
            mapView.camera = location
            mapView.animate(to: location)
            setMapMarkersRoute(vLoc: pos[0], toLoc: pos[1])
        } else {
            setLine()
        }
    }
    
    func setDistance() {
        var index = 0
        let cnt = coordinates.count - 2
        var totalDistance: CLLocationDistance = 0
        print(coordinates)
        for _ in coordinates[...cnt] {
            let myLocation = coordinates[index]
            let myBuddysLocation = coordinates[index+1]
            let distance = myLocation.distance(from: myBuddysLocation)
            index += 1
            totalDistance += distance
        }
        realDistance = totalDistance/1000
        print("거리: \(realDistance)")
    }
    
//    func setCamera(vLoc: CLLocationCoordinate2D, toLoc: CLLocationCoordinate2D) {
//        var bounds = GMSCoordinateBounds()
//        var midLat = CLLocationDegrees()
//        var midLon = CLLocationDegrees()
//        midLat = (vLoc.latitude + toLoc.latitude) / 2
//        midLon = (vLoc.longitude + toLoc.longitude) / 2
//        let midLoc = CLLocationCoordinate2D(latitude: midLat, longitude: midLon)
//        bounds = bounds.includingCoordinate(vLoc)
//        bounds = bounds.includingCoordinate(midLoc)
//        self.mapView.moveCamera(GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 110, left: 110, bottom: 110, right: 110)))
//    }
    
    func setMapMarkersRoute(vLoc: CLLocationCoordinate2D, toLoc: CLLocationCoordinate2D) {
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
    
    private func setLine() {
        let path = GMSMutablePath()
        var pos: [CLLocationCoordinate2D] = []
        for coord in coursePos {
            let lat = coord[0]
            let long = coord[1]
            let complainLoc = CLLocationCoordinate2DMake(lat, long)
            
            pos.append(complainLoc)
            path.add(complainLoc)
        }
        let line = GMSPolyline(path: path)
        line.strokeColor = .latestBurgundy
        line.strokeWidth = 3.0
        line.geodesic = true
        line.map = self.mapView
        let location = GMSCameraPosition.camera(withLatitude: pos[0].latitude, longitude: pos[0].longitude, zoom: 17.0)
        mapView.camera = location
        mapView.animate(to: location)
    }
    
    func startTimer() {
    }
    
    func setData(pos: [[Double]]) {
        coursePos = pos
        print(coursePos)
        drawMap()
    }
}

// MARK: - Action
extension CourseWalkingMapCVC {
    @objc func touchUpPause() {
        isStart = false
        timer?.invalidate()
        time = timeFormatter(currentTimeCount)
        guard let dvc = UIStoryboard(name: "CourseRunningTab", bundle: nil).instantiateViewController(identifier: "CoursePauseVC") as? CoursePauseVC else {
            return
        }
        
        dvc.dismissView = {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: self.timeSelector, userInfo: nil, repeats: true)
        }
        
        dvc.modalPresentationStyle = .fullScreen
        userDefault.setValue(time, forKey: "time")
        
        setDistance()
        let disNum = round(realDistance * 100) / 100
        userDefault.set(disNum, forKey: "distance")
        
        delegate?.buttonTappedPause(dvc: dvc)
    }
}

// MARK: - Timer
extension CourseWalkingMapCVC {
    func timeFormatter(_ intTime: Int) -> String {
        let hour = intTime / 3600
        let minute = (intTime % 3600) / 60
        
        let hourString = hour < 10 ? "0\(hour)" : String(hour)
        let minuteString = minute < 10 ? "0\(minute)" : String(minute)
        
        return "\(hourString):\(minuteString)"
    }
    
    func timeFormatterSec(_ intTime: Int) -> String {
        let sec = (intTime % 3600) % 60
        
        let secStr = sec < 10 ? "0\(sec)" : String(sec)
        
        return "\(secStr)"
    }
    
    @objc func updateTime() {
        currentTimeCount += 1
        walkingTimeLabel.text = timeFormatter(currentTimeCount)
        decimalTimeLabel.text = timeFormatterSec(currentTimeCount)
    }
}
