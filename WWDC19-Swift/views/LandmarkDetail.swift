//
//  LandmarkDetail.swift
//  WWDC19-Swift
//
//  Created by LiYong on 19.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import UIKit

class LandmarkDetail : UIView,UIScrollViewDelegate{
    var controller:HomeViewController?
    public var items:[ItemView] = Array()
    public var dataList:[Landmark]?
    
    private let paddingVerticel:Int = 40
    
    init(frame: CGRect, dataList:[Landmark]?,controller:HomeViewController?) {
        self.dataList = dataList
        self.controller = controller
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        let label = UILabel(frame: CGRect(x:15 , y: 10, width: 100, height: 20))
        label.text = "All"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        self.addSubview(label)
        
        let height:CGFloat = self.frame.size.height-30;
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 30, width: self.frame.width, height:height))
        scrollView.showsHorizontalScrollIndicator = false
        
        var index = 0
        
        guard let list = dataList else {
            return
        }
        
        for data in list {
            let categoryItem = ItemView(frame: CGRect(x: (index * (160+10))+15 , y: paddingVerticel, width: 160, height: 250),model: data,width: 160,height: 200,controller:self.controller )
            scrollView.addSubview(categoryItem)
            items.append(categoryItem)
            index = index+1
        }
        
        let width:CGFloat =  CGFloat(((160+10) * list.count)+15+230)
        scrollView.contentSize = CGSize(width:width , height: height)
        caculatePosition(scrollView: scrollView)
        scrollView.delegate = self
        self.addSubview(scrollView)
        self.clipsToBounds = true
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        caculatePosition(scrollView: scrollView)
    }
    
    func caculatePosition(scrollView:UIScrollView ){
        for index in 0..<items.count {
            let categoryItemLarge = items[index]
            let contentOffset = scrollView.contentOffset.x + CGFloat(15)
            
            var offset = contentOffset-categoryItemLarge.frame.origin.x
            offset = offset/450
            offset = -offset
            
            var rotation = CATransform3DIdentity
            rotation.m34 = -0.005
            rotation = CATransform3DRotate(rotation, offset, 0.0, -1.0, 0.0)
            categoryItemLarge.layer.transform = rotation
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}













