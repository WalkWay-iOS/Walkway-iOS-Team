//
//  CreateCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit
import GoogleMaps
import GooglePlaces

class CreateCourseVC: UIViewController {
    let infoViewButton = UIButton()
    let infoView = UIView()
    let hiddenView = UIView()
    let startTitleLabel = UILabel()
    let destinationTitleLabel = UILabel()
    let startLocalLabel = UILabel()
    let destinationLocalLabel = UILabel()
    let startButton = UIButton()
    let destinationButton = UIButton()
    let makeCourseButton = UIButton()
    let drawCourseButton = UIButton()
    let searchButton = UIButton()
    
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    let startMarker = GMSMarker()
    let destinationMarker = GMSMarker()
    let anotherStartMarker = GMSMarker()
    let anotherDestinationMarker = GMSMarker()
    let geocoder = GMSGeocoder()
    
    var zoomValue: Float = 17.0
    var isStart: Bool = true
    var isFirstStart = false
    var isFirstDestination = false
    var isWhoseButton = false
    
    var startLocation: [CLLocationDegrees] = [37.54643, 126.96482]
    var destinLocation: [CLLocationDegrees] = [37.54643, 126.96482]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMap()
        setUI()
    }
}

// MARK: - MAP
extension CreateCourseVC: GMSMapViewDelegate {
    private func setMap() {
        camera = GMSCameraPosition.camera(withLatitude: 37.54643, longitude: 126.96482, zoom: zoomValue)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.delegate = self
        
        view = mapView
                
        startMarker.icon = GMSMarker.markerImage(with: .bookmarkDarkBlue)
        startMarker.map = mapView
        
        anotherStartMarker.icon = GMSMarker.markerImage(with: .bookmarkDarkBlue)
        anotherStartMarker.map = mapView
        
        destinationMarker.icon = GMSMarker.markerImage(with: .latestBurgundy)
        destinationMarker.map = mapView
        
        anotherDestinationMarker.icon = GMSMarker.markerImage(with: .latestBurgundy)
        anotherDestinationMarker.map = mapView
        
        geocoder.accessibilityLanguage = "Ko-kr"
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        zoomValue = mapView.camera.zoom
        
        let lat = coordinate.latitude
        let long = coordinate.longitude
        let location = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: zoomValue)
        
        mapView.camera = location
        mapView.animate(to: location)
        print("Latitude: \(lat), Longitude: \(long)")
        
        if isStart {
            startMarker.map = mapView
            startMarker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
            startLocation[0] = lat
            startLocation[1] = long
            
            geocoder.reverseGeocodeCoordinate(startMarker.position) { response, error in
                if error != nil {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                } else {
                    if let places = response?.results() {
                        if let place = places.first {
                            if let lines = place.lines {
                                var str: String = ""
                                var strs: [String] = lines[0].components(separatedBy: " ")
                                for s in strs[1...] {
                                    str += s
                                    str += " "
                                }
                                self.startMarker.snippet = str
                                self.startButton.setTitle(str, for: .normal)
                                self.startLocalLabel.text = str
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
        } else {
            destinationMarker.map = mapView
            destinationMarker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
            destinLocation[0] = lat
            destinLocation[1] = long
            
            geocoder.reverseGeocodeCoordinate(destinationMarker.position) { response, error in
                if error != nil {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                } else {
                    if let places = response?.results() {
                        if let place = places.first {
                            if let lines = place.lines {
                                var str: String = ""
                                var strs: [String] = lines[0].components(separatedBy: " ")
                                for s in strs[1...] {
                                    str += s
                                    str += " "
                                }
                                self.destinationMarker.snippet = str
                                self.destinationButton.setTitle(str, for: .normal)
                                self.destinationLocalLabel.text = str
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
    }
}

// MARK: - UI
extension CreateCourseVC {
    private func setUI() {
        setView()
        setLabel()
        setButton()
        setSearchButton()
    }
    
    private func setBools() {
        zoomValue = 17.0
        isStart = true
        isFirstStart = false
        isFirstDestination = false
        isWhoseButton = false
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
        
        hiddenView.backgroundColor = UIColor.bookmarkGray.withAlphaComponent(0.5)
        hiddenView.isHidden = false
        hiddenView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hiddenView)
        hiddenView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hiddenView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hiddenView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hiddenView.bottomAnchor.constraint(equalTo: infoView.topAnchor).isActive = true
        
        let infoLabel = UILabel()
        infoLabel.numberOfLines = 2
        infoLabel.text = "Walkway와 함께\n원하는 길을 찾아봐요🏃🏻‍♀️"
        infoLabel.textColor = .white
        infoLabel.font = .myBoldSystemFont(ofSize: 25)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        hiddenView.addSubview(infoLabel)
        infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: hiddenView.leadingAnchor, constant: 20).isActive = true
    }
    
    private func setLabel() {
        startTitleLabel.text = "출발 위치 정보"
        startTitleLabel.font = .myMediumSystemFont(ofSize: 13)
        startTitleLabel.textColor = .gray70
        startTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoView.addSubview(startTitleLabel)
        startTitleLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15).isActive = true
        startTitleLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 15).isActive = true
        
        destinationTitleLabel.text = "도착 위치 정보"
        destinationTitleLabel.font = .myMediumSystemFont(ofSize: 13)
        destinationTitleLabel.textColor = .gray70
        destinationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoView.addSubview(destinationTitleLabel)
        destinationTitleLabel.topAnchor.constraint(equalTo: startTitleLabel.bottomAnchor, constant: 50).isActive = true
        destinationTitleLabel.leadingAnchor.constraint(equalTo: startTitleLabel.leadingAnchor).isActive = true
        
        startLocalLabel.text = ""
        startLocalLabel.font = .myRegularSystemFont(ofSize: 11)
        startLocalLabel.textColor = .gray90
        startLocalLabel.translatesAutoresizingMaskIntoConstraints = false
        infoView.addSubview(startLocalLabel)
        startLocalLabel.topAnchor.constraint(equalTo: startTitleLabel.bottomAnchor, constant: 25).isActive = true
        startLocalLabel.leadingAnchor.constraint(equalTo: startTitleLabel.leadingAnchor, constant: 20).isActive = true
        
        destinationLocalLabel.text = ""
        destinationLocalLabel.font = .myRegularSystemFont(ofSize: 11)
        destinationLocalLabel.textColor = .gray90
        destinationLocalLabel.translatesAutoresizingMaskIntoConstraints = false
        infoView.addSubview(destinationLocalLabel)
        destinationLocalLabel.topAnchor.constraint(equalTo: destinationTitleLabel.bottomAnchor, constant: 25).isActive = true
        destinationLocalLabel.leadingAnchor.constraint(equalTo: startTitleLabel.leadingAnchor, constant: 20).isActive = true
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
        
        startButton.setTitle("출발 위치 설정", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.titleLabel?.font = .myBoldSystemFont(ofSize: 16)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(touchUpGetStartPoint), for: .touchUpInside)
        infoView.addSubview(startButton)
        startButton.topAnchor.constraint(equalTo: startTitleLabel.bottomAnchor, constant: 3).isActive = true
        startButton.leadingAnchor.constraint(equalTo: startTitleLabel.leadingAnchor, constant: 20).isActive = true
        
        destinationButton.setTitle("도착 위치 설정", for: .normal)
        destinationButton.setTitleColor(.black, for: .normal)
        destinationButton.titleLabel?.font = .myBoldSystemFont(ofSize: 16)
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
        drawCourseButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        drawCourseButton.backgroundColor = .black
        drawCourseButton.layer.cornerRadius = 15
        drawCourseButton.addTarget(self, action: #selector(touchUpDraw), for: .touchUpInside)
        stackView.addArrangedSubview(drawCourseButton)
        drawCourseButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        drawCourseButton.widthAnchor.constraint(equalToConstant: 150).isActive = true

        makeCourseButton.setTitle("경로 생성", for: .normal)
        makeCourseButton.setTitleColor(.white, for: .normal)
        makeCourseButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        makeCourseButton.backgroundColor = .black
        makeCourseButton.layer.cornerRadius = 15
        makeCourseButton.addTarget(self, action: #selector(touchUpCreateCourse), for: .touchUpInside)
        stackView.addArrangedSubview(makeCourseButton)
        makeCourseButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        makeCourseButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setSearchButton() {
        searchButton.setTitle("", for: .normal)
        searchButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        searchButton.layer.cornerRadius = 10
        searchButton.layer.borderWidth = 1
        searchButton.layer.borderColor = UIColor.gray50.cgColor
        searchButton.addTarget(self, action: #selector(touchUpSearchCourse), for: .touchUpInside)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchButton)
        searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width/1.1).isActive = true
        
        let label = UILabel()
        label.text = "길찾기"
        label.font = .myRegularSystemFont(ofSize: 14)
        label.textColor = .gray60
        label.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addSubview(label)
        label.centerYAnchor.constraint(equalTo: searchButton.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: 10).isActive = true
    }
}

// MARK: - 문제가 많은 부분!! Search Course(Delegate)
extension CreateCourseVC: GMSAutocompleteViewControllerDelegate {
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        hiddenView.isHidden = true
        
        DispatchQueue.global().sync {
            guard let name = place.name else {return}
            guard let address = place.formattedAddress else {return}
            if isWhoseButton == false {
                startButton.setTitle(name, for: .normal)
                startLocalLabel.text = address
                
                startMarker.map = nil
                
                anotherStartMarker.map = mapView
                anotherStartMarker.snippet = name
                anotherStartMarker.position = CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
                startLocation[0] = place.coordinate.latitude
                startLocation[1] = place.coordinate.longitude
                
                let location = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: zoomValue)
                mapView.camera = location
            } else {
                destinationButton.setTitle(name, for: .normal)
                destinationLocalLabel.text = address
                
                destinationMarker.map = nil
                
                anotherDestinationMarker.map = mapView
                anotherDestinationMarker.snippet = name
                anotherDestinationMarker.position = CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
                destinLocation[0] = place.coordinate.latitude
                destinLocation[1] = place.coordinate.longitude
                
                let location = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: zoomValue)
                mapView.camera = location
            }
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print(error.localizedDescription)//에러났을 때 출력
    }
}

// MARK: - Action
extension CreateCourseVC {
    @objc func touchUpInfoButton() {
        if infoView.isHidden {
            infoView.isHidden = false
            searchButton.isHidden = false
        } else if infoView.isHidden == false && (isFirstStart || isFirstDestination) {
            infoView.isHidden = true
            searchButton.isHidden = true
        }
    }
    
    @objc func touchUpGetStartPoint() {
        print("출발")
        hiddenView.isHidden = true
        isStart = true
        isWhoseButton = false
        if isFirstStart == false {
            isFirstStart = true
        }
        
        startButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        destinationButton.setTitleColor(.black, for: .normal)
        
        anotherStartMarker.map = nil
        startMarker.map = mapView
        let location = GMSCameraPosition.camera(withLatitude: startLocation[0], longitude: startLocation[1], zoom: zoomValue)
        mapView.camera = location
        startMarker.position = CLLocationCoordinate2D(latitude: startLocation[0], longitude: startLocation[1])
    }
    
    @objc func touchUpGetDestinationPoint() {
        print("도착")
        hiddenView.isHidden = true
        isStart = false
        isWhoseButton = true
        if isFirstDestination == false {
            isFirstDestination = true
        }
        
        startButton.setTitleColor(.black, for: .normal)
        destinationButton.setTitleColor(.latestBurgundy, for: .normal)
        
        anotherDestinationMarker.map = nil
        destinationMarker.map = mapView
        let location = GMSCameraPosition.camera(withLatitude: destinLocation[0], longitude: destinLocation[1], zoom: zoomValue)
        mapView.camera = location
        destinationMarker.position = CLLocationCoordinate2D(latitude: destinLocation[0], longitude: destinLocation[1])
    }
    
    @objc func touchUpSearchCourse() {
        print("길찾기")
        if isFirstStart || isFirstDestination {
            let controller = GMSAutocompleteViewController()
            controller.delegate = self 
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true, completion: nil)
        }
    }
    
    @objc func touchUpDraw() {
        guard let dvc = storyboard?.instantiateViewController(identifier: "MakeCourseVC") as? MakeCourseVC else {
            return
        }
        dvc.lat = startLocation[0]
        dvc.long = startLocation[1]
        dvc.coordinates.append(CLLocationCoordinate2D(latitude: startLocation[0], longitude: startLocation[1]))
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    @objc func touchUpCreateCourse() {
        if isFirstStart && isFirstDestination {
            guard let dvc = storyboard?.instantiateViewController(identifier: "MakeCreateCourseVC") as? MakeCreateCourseVC else {
                return
            }
            dvc.source.append(CLLocationCoordinate2D(latitude: startLocation[0], longitude: startLocation[1]))
            dvc.destination.append(CLLocationCoordinate2D(latitude: destinLocation[0], longitude: destinLocation[1]))
            dvc.modalPresentationStyle = .fullScreen
            dvc.modalTransitionStyle = .crossDissolve
            present(dvc, animated: true, completion: nil)
        }
    }
}
