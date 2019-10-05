//
//  CategoryRow.swift
//  WWDC19-Swift
//
//  Created by LiYong on 05.10.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import UIKit


class CategoryRow : UIView{
    var name:String = "";
    var dataList: [Landmark] = Array()
    var controller:UIViewController?
    
    init(frame: CGRect, dataList:[Landmark],name:String,controller:UIViewController?) {
        self.dataList = dataList
        self.name = name
        self.controller = controller
        super.init(frame: frame)
    }
    
    override func didMoveToSuperview() {
        setup()
    }
    
    private func setup(){
        let width = self.frame.size.width
        let label = UILabel(frame: CGRect(x:15 , y: 0, width: width, height: 20))
        label.text = self.name
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        self.addSubview(label)
        
        var height = self.frame.size.height-30;
        
        let rowView = UIScrollView(frame: CGRect(x: 0, y: 30, width: width, height: height))
        height = height-20;
        for index in 0..<dataList.count {
            let item = dataList[index]
            rowView.addSubview(CategoryItem(frame: CGRect(x: CGFloat(15+165*index), y: 10, width: height, height: height), model: item,width: 150,height: 150, controller: self.controller))
        }
        rowView.showsHorizontalScrollIndicator = false
        rowView.contentSize = CGSize(width:dataList.count*165+15, height: 150)
        self.addSubview(rowView)
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}


