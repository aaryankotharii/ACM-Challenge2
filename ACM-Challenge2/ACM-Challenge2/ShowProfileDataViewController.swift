//
//  ShowProfileDataViewController.swift
//  ACM-Challenge2
//
//  Created by Aaryan Kothari on 20/03/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit
import MapKit

class ShowProfileDataViewController: UIViewController{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - Variables
    var name : String = ""
    var birthday : String = ""
    var phone : String = ""
    var latitude : String = ""
    var longitude : String = ""
    var gender : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        nameLabel.text = name
        birthdayLabel.text = birthday
        genderLabel.text = gender
        locationLabel.text = "\(latitude)   \(longitude)"
        
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(Double(latitude)!, Double(longitude)!)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: location,span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = ""
        annotation.subtitle = ""
        mapView.addAnnotation(annotation)
    }
}
