//
//  CreateCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit
import GoogleMaps

class CreateCourseVC: UIViewController {
    let infoViewButton = UIButton()
    let infoView = UIView()
    let startTitleLabel = UILabel()
    let destinationTitleLabel = UILabel()
    let startLocalLabel = UILabel()
    let destinationLocalLabel = UILabel()
    let startButton = UIButton()
    let destinationButton = UIButton()
    let makeCourseButton = UIButton()
    let drawCourseButton = UIButton()
    
    let marker = GMSMarker()
    let mapView = GMSMapView()
    let geocoder = GMSGeocoder()
    
    var zoomValue: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMap()
        setUI()
    }
}

// MARK: - MAP
extension CreateCourseVC: GMSMapViewDelegate {
    private func setMap() {
        zoomValue = 17.0
        let camera = GMSCameraPosition.camera(withLatitude: 37.54643, longitude: 126.96482, zoom: zoomValue)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.delegate = self
        
        view = mapView
            
        marker.position = CLLocationCoordinate2D(latitude: 37.54643, longitude: 126.96482)
        marker.icon = GMSMarker.markerImage(with: .bookmarkDarkBlue)
        marker.title = "Korea"
        marker.snippet = "Sookmyung Womens University"
        marker.map = mapView
        
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        zoomValue = mapView.camera.zoom
        
        let lat = coordinate.latitude
        let long = coordinate.longitude
        let location = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: zoomValue)
        
        mapView.camera = location
        mapView.animate(to: location)
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        print("Latitude: \(lat), Longitude: \(long)")
        
        geocoder.reverseGeocodeCoordinate(marker.position) { response, error in
            if error != nil {
                print("reverse geodcode fail: \(error!.localizedDescription)")
            } else {
                if let places = response?.results() {
                    if let place = places.first {
                        if let lines = place.lines {
                            self.startLocalLabel.text = "\(lines)"
                            print("GEOCODE: Formatted Address: \(lines)")
                        } else {
                            print("GEOCODE: nil first in places")
                        }
                    } else {
                    print("GEOCODE: nil in places")
                    }
                }
            }
        }
    }
    
    func performGoogleSearch(for string: String) {
        var components = URLComponents(string: "https://maps.googleapis.com/maps/api/geocode/json")!
        let key = URLQueryItem(name: "key", value: "...") // use your key
        let address = URLQueryItem(name: "address", value: string)
        components.queryItems = [key, address]

        let task = URLSession.shared.dataTask(with: components.url!) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, error == nil else {
                print(String(describing: response))
                print(String(describing: error))
                return
            }

            guard let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else {
                print("not JSON format expected")
                print(String(data: data, encoding: .utf8) ?? "Not string?!?")
                return
            }

            guard let results = json["results"] as? [[String: Any]],
                let status = json["status"] as? String,
                status == "OK" else {
                    print("no results")
                    print(String(describing: json))
                    return
            }

            DispatchQueue.main.async {
                // now do something with the results, e.g. grab `formatted_address`:
                let strings = results.compactMap { $0["formatted_address"] as? String }
                print(strings)
            }
        }

        task.resume()
    }
}

// MARK: - UI
extension CreateCourseVC {
    private func setUI() {
        setView()
        setLabel()
        setButton()
    }
    
    private func setView() {
        self.view.backgroundColor = .white
        
        infoView.backgroundColor = UIColor.bookmarkBlue.withAlphaComponent(0.7)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(infoView)
        infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height/2.8).isActive = true
    }
    
    private func setLabel() {
        startTitleLabel.text = "출발 위치 정보"
        startTitleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        startTitleLabel.textColor = .gray70
        startTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoView.addSubview(startTitleLabel)
        startTitleLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15).isActive = true
        startTitleLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 15).isActive = true
        
        destinationTitleLabel.text = "도착 위치 정보"
        destinationTitleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        destinationTitleLabel.textColor = .gray70
        destinationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoView.addSubview(destinationTitleLabel)
        destinationTitleLabel.topAnchor.constraint(equalTo: startTitleLabel.bottomAnchor, constant: 50).isActive = true
        destinationTitleLabel.leadingAnchor.constraint(equalTo: startTitleLabel.leadingAnchor).isActive = true
        
        startLocalLabel.text = ""
        startLocalLabel.font = .systemFont(ofSize: 11)
        startLocalLabel.textColor = .gray50
        startLocalLabel.translatesAutoresizingMaskIntoConstraints = false
        infoView.addSubview(startLocalLabel)
        startLocalLabel.topAnchor.constraint(equalTo: startTitleLabel.bottomAnchor, constant: 30).isActive = true
        startLocalLabel.leadingAnchor.constraint(equalTo: startTitleLabel.leadingAnchor, constant: 20).isActive = true
    }
    
    private func setButton() {
        infoViewButton.setTitle("", for: .normal)
        infoViewButton.setImage(UIImage(systemName: "moon.stars"), for: .normal)
        infoViewButton.tintColor = .white
        infoViewButton.backgroundColor = UIColor.bookmarkDarkBlue.withAlphaComponent(0.8)
        infoViewButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        infoViewButton.layer.cornerRadius = 27
        infoViewButton.setPreferredSymbolConfiguration(.init(pointSize: 20, weight: .regular, scale: .large), forImageIn: .normal)
        infoViewButton.addTarget(self, action: #selector(touchUpInfoButton), for: .touchUpInside)
        infoViewButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoViewButton)
        infoViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        infoViewButton.bottomAnchor.constraint(equalTo: infoView.topAnchor, constant: -10).isActive = true
        infoViewButton.widthAnchor.constraint(equalToConstant: 53).isActive = true
        infoViewButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        
        startButton.setTitle("출발 위치 설정하기", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(touchUpGetStartPoint), for: .touchUpInside)
        infoView.addSubview(startButton)
        startButton.topAnchor.constraint(equalTo: startTitleLabel.bottomAnchor, constant: 3).isActive = true
        startButton.leadingAnchor.constraint(equalTo: startTitleLabel.leadingAnchor, constant: 20).isActive = true
        
        destinationButton.setTitle("도착 위치 설정하기", for: .normal)
        destinationButton.setTitleColor(.black, for: .normal)
        destinationButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        destinationButton.translatesAutoresizingMaskIntoConstraints = false
        destinationButton.addTarget(self, action: #selector(touchUpGetDestinationPoint), for: .touchUpInside)
        infoView.addSubview(destinationButton)
        destinationButton.topAnchor.constraint(equalTo: destinationTitleLabel.bottomAnchor, constant: 3).isActive = true
        destinationButton.leadingAnchor.constraint(equalTo: startTitleLabel.leadingAnchor, constant: 20).isActive = true
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 21
        stackView.translatesAutoresizingMaskIntoConstraints = false

        infoView.addSubview(stackView)
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        stackView.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        
        drawCourseButton.setTitle("직접 그리기", for: .normal)
        drawCourseButton.setTitleColor(.white, for: .normal)
        drawCourseButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        drawCourseButton.backgroundColor = .black
        drawCourseButton.layer.cornerRadius = 15
        drawCourseButton.addTarget(self, action: #selector(touchUpDraw), for: .touchUpInside)
        stackView.addArrangedSubview(drawCourseButton)
        drawCourseButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        drawCourseButton.widthAnchor.constraint(equalToConstant: 150).isActive = true

        makeCourseButton.setTitle("경로 생성", for: .normal)
        makeCourseButton.setTitleColor(.white, for: .normal)
        makeCourseButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        makeCourseButton.backgroundColor = .black
        makeCourseButton.layer.cornerRadius = 15
        stackView.addArrangedSubview(makeCourseButton)
        makeCourseButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        makeCourseButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

// MARK: - Action
extension CreateCourseVC {
    @objc func touchUpInfoButton() {
        if infoView.isHidden {
            infoView.isHidden = false
        } else {
            infoView.isHidden = true
        }
    }
    
    @objc func touchUpGetStartPoint() {
        print("출발")
    }
    
    @objc func touchUpGetDestinationPoint() {
        print("도착")
    }
    
    @objc func touchUpDraw() {
        
    }
}
