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
    
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var timerView: UIView!
    @IBOutlet var timerTitleLabel: UILabel!
    @IBOutlet var walkingTimeLabel: UILabel!
    @IBOutlet var decimalTimeLabel: UILabel!
    
    var delegate: walkingCoursePresentDelegate?
    
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    
    var isStart: Bool = true
    var timer: Timer?
    var time = ""
    var currentTimeCount: Int = 0
    
    let timeSelector: Selector = #selector(CourseWalkingMapCVC.updateTime)
    
    let userDefault = UserDefaults.standard
    
    var coursePos: [[Double]] = [[]]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeSelector, userInfo: nil, repeats: true)
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
        timerView.backgroundColor = .bookmarkDarkBlue
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
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.delegate = self
        self.backgroundView = mapView
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        // MARK: TAP해도 줌인이 안된다!!!!
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
            setCamera(vLoc: pos[0], toLoc: pos[1])
            setMapMarkersRoute(vLoc: pos[0], toLoc: pos[1])
        } else {
            setLine()
        }
    }
    
    func setCamera(vLoc: CLLocationCoordinate2D, toLoc: CLLocationCoordinate2D) {
        var bounds = GMSCoordinateBounds()
        bounds = bounds.includingCoordinate(vLoc)
        bounds = bounds.includingCoordinate(toLoc)
        self.mapView.moveCamera(GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)))
    }
    
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
        setCamera(vLoc: pos[0], toLoc: pos[pos.count-1])
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
