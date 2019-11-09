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
    
    var model:Landmark?
    var dataList: [Landmark]?
    var mapView:MapView?
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        self.title = model?.name;
        
        let scrollView =  UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height));
        scrollView.showsVerticalScrollIndicator = false
        
        let width = UIScreen.main.bounds.size.width
        mapView = MapView(frame: CGRect(x: 0, y: 0, width: width, height: 400),model:self.model)
        mapView?.isUserInteractionEnabled=false
        
        scrollView.addSubview(mapView!)
        
        let avatar = Avatar(frame: CGRect(x:0 , y: 300, width: 200, height: 200),imageName: model?.imageName)
        avatar.center.x = self.view.center.x
        scrollView.addSubview(avatar)
        
        let nameLabel = UILabel(frame: CGRect(x:0 , y: 500, width: width, height: 30))
        nameLabel.textAlignment = .center
        nameLabel.text = model?.name
        nameLabel.font = UIFont.systemFont(ofSize: 15.0)
        scrollView.addSubview(nameLabel)
        
        let landmarkDetail:LandmarkDetail = LandmarkDetail(frame:
            CGRect(x:0 , y: 550, width:width , height: 320),dataList: dataList,controller: nil)
        scrollView.addSubview(landmarkDetail)
        
        scrollView.contentSize = CGSize(width: width, height: 870)
        self.view.addSubview(scrollView);
    }
}






