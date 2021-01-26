//
//  CreateCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit
import GoogleMaps

class CreateCourseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
        let camera = GMSCameraPosition.camera(withLatitude: 37.54643, longitude: 126.96482, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            
        view = mapView
            
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.54643, longitude: 126.96482)
        marker.title = "Korea"
        marker.snippet = "Sookmyung Womens University"
        marker.map = mapView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
