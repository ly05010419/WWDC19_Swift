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
    
    private var items:[CategoryItemLarge] = Array()
    private var dataList:[Landmark] = Array()
    private let paddingHorizontal:Int = 20
    private let paddingVerticel:Int = 40
    private let itemPadding:Int = 10
    private let itemWidth:Int = 160
    private let itemHeight:Int = 230
    
    init(frame: CGRect, dataList:[Landmark]) {
        self.dataList = dataList
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
       let label = UILabel(frame: CGRect(x:20 , y: 10, width: 100, height: 30))
        label.text = "All"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        self.addSubview(label)
        
        for data in dataList {
            items.append(CategoryItemLarge(frame: CGRect.zero,imageName:data.imageName ?? ""))
        }
        
        let height = itemHeight+(paddingVerticel * 2)
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 30, width: self.frame.width, height:CGFloat(height)))
        scrollView.showsHorizontalScrollIndicator = false
        for index in 0..<items.count {
            let categoryItemLarge = items[index]
            categoryItemLarge.frame = CGRect(x: (index * (itemWidth+itemPadding))+paddingHorizontal , y: paddingVerticel, width: itemWidth, height: itemHeight);
            scrollView.addSubview(categoryItemLarge)
        }
        
        let width =  ((itemWidth+itemPadding) * items.count)+(paddingHorizontal*2)+200
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}













