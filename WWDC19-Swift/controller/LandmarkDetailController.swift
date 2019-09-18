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
    
    private var items:[CategoryItemLarge] = Array()
    private let paddingHorizontal:Int = 20
    private let paddingVerticel:Int = 40
    private let itemPadding:Int = 10
    private let itemWidth:Int = 160
    private let itemHeight:Int = 230
    
    override func viewDidLoad() {
        let mapView = MapView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 400), latitude:34.052235,longitude:-118.243683)
        self.view.addSubview(mapView)
        
        let avatar = Avatar(frame: CGRect(x:0 , y: 300, width: 200, height: 200),imageName: "chilkoottrail")
        avatar.center.x = self.view.center.x
        self.view.addSubview(avatar)
        
        let nameLabel = UILabel(frame: CGRect(x:0 , y: 500, width: UIScreen.main.bounds.size.width, height: 30))
        nameLabel.textAlignment = .center
        nameLabel.text = "Turtle Rock"
        nameLabel.font = UIFont.systemFont(ofSize: 15.0)
        self.view.addSubview(nameLabel)
        
        let label = UILabel(frame: CGRect(x:20 , y: 550, width: 100, height: 30))
        label.text = "All"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        self.view.addSubview(label)
        
        for _ in 0..<10 {
            items.append(CategoryItemLarge(frame: CGRect.zero,imageName: "chilkoottrail"))
        }
        
        let height = itemHeight+(paddingVerticel * 2)
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 580, width: UIScreen.main.bounds.size.width, height:CGFloat(height)))
        scrollView.showsHorizontalScrollIndicator = false
        for index in 0..<items.count {
            let categoryItemLarge = items[index]
            categoryItemLarge.frame = CGRect(x: (index * (itemWidth+itemPadding))+paddingHorizontal , y: paddingVerticel, width: itemWidth, height: itemHeight);
            scrollView.addSubview(categoryItemLarge)
        }
        
        let width =  ((itemWidth+itemPadding) * items.count)+(paddingHorizontal*2)+200
        scrollView.contentSize = CGSize(width:width , height: height)
        caculate(scrollView: scrollView)
        scrollView.delegate = self
        self.view.addSubview(scrollView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        caculate(scrollView: scrollView)
    }
    
    func caculate(scrollView:UIScrollView ){
        for index in 0..<items.count {
            let categoryItemLarge = items[index]
            let contentOffset = scrollView.contentOffset.x + CGFloat(paddingHorizontal)
            
            var offset = contentOffset-categoryItemLarge.frame.origin.x
            offset = offset/450
            offset = -offset

            var rotation = CATransform3DIdentity
            rotation.m34 = -0.005
            rotation = CATransform3DRotate(rotation, offset, 0.0, -1.0, 0.0)
            categoryItemLarge.layer.transform = rotation
        }
    }
}
