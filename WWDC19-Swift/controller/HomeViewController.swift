//
//  HomeViewController.swift
//  WWDC19-Swift
//
//  Created by LiYong on 05.10.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController,UIScrollViewDelegate {
    
    var model:Landmark = Landmark()
    var dataList: [Landmark] = Array()
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: dataList,
            by: { $0.category }
        )
    }
    
    override func viewDidLoad() {
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: 200));
        imageView.image = UIImage(named: "Los_Angeles")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        scrollView.addSubview(imageView)
        
        let landmarkDetail:LandmarkDetail = LandmarkDetail(frame:
            CGRect(x:0 , y: 200, width:width , height: 320),dataList: dataList,controller: self)
        scrollView.addSubview(landmarkDetail)
        
        var index:CGFloat = 0.0;
        for (name,item) in categories{
            let y = 520+index*235
            let rowView = CategoryRow(frame: CGRect(x: 0, y: y, width: width, height: 230),dataList: item,name:name,controller: self)
            rowView.clipsToBounds = true
            scrollView.addSubview(rowView)
            index = index+1
        }
        
        scrollView.contentSize = CGSize(width: width, height: CGFloat(categories.keys.count*235+530))
        scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(scrollView)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                
            case "landmarkDetail":
                guard let vc = segue.destination as? LandmarkDetailController else {return}
                vc.dataList = self.dataList
                guard let model = sender as? Landmark else {return}
                vc.model = model
                
            default: break
            }
        }
    }
    
}

