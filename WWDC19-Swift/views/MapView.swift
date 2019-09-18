//
//  MapView.swift
//  WWDC19-Swift
//
//  Created by LiYong on 17.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class MapView:UIView{
    
    var latitude:Double = 0
    var longitude:Double = 0
    
    init(frame: CGRect, latitude:Double,longitude:Double) {
        self.latitude = latitude
        self.longitude = longitude
        super.init(frame: frame)
        setup(frame:frame)
    }
    
    private func setup(frame: CGRect){
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 7.5)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.frame = frame
        self.addSubview(mapView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup(frame:CGRect.zero)
    }
    
}





