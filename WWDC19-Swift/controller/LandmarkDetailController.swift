//
//  MapViewController.swift
//  WWDC19-Swift
//
//  Created by LiYong on 17.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import GoogleMaps

class LandmarkDetailController: UIViewController,UIScrollViewDelegate {
    
    var model:Landmark = Landmark()
    var dataList: [Landmark] = Array()
    
    override func viewDidLoad() {
        let width = UIScreen.main.bounds.size.width
        let mapView = MapView(frame: CGRect(x: 0, y: 0, width: width, height: 400),model:model)
        self.view.addSubview(mapView)
        
        let avatar = Avatar(frame: CGRect(x:0 , y: 300, width: 200, height: 200),imageName: model.imageName)
        avatar.center.x = self.view.center.x
        self.view.addSubview(avatar)
        
        let nameLabel = UILabel(frame: CGRect(x:0 , y: 500, width: width, height: 30))
        nameLabel.textAlignment = .center
        nameLabel.text = model.name
        nameLabel.font = UIFont.systemFont(ofSize: 15.0)
        self.view.addSubview(nameLabel)
        
        let landmarkDetail:LandmarkDetail = LandmarkDetail(frame:
            CGRect(x:0 , y: 550, width:width , height: 320),dataList: dataList,controller: self)
        self.view.addSubview(landmarkDetail)
    }
}






