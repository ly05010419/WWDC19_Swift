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
    
   var model:Landmark = Landmark()
    
    init(frame: CGRect, model:Landmark) {
        self.model = model
        super.init(frame: frame)
        setup(frame:frame)
    }
    
    private func setup(frame: CGRect){
        let camera = GMSCameraPosition.camera(withLatitude: self.model.coordinates.latitude, longitude: self.model.coordinates.longitude, zoom: 7.5)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.frame = frame
        self.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = camera.target
        marker.title = self.model.name
        marker.map = mapView
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup(frame:CGRect.zero)
    }
    
}





