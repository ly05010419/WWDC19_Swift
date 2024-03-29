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
    var model : Landmark = Landmark()
    var dataList : [Landmark] = Array()
    var categories : [String:[Landmark]] {
        Dictionary(
            grouping: dataList,
            by: { $0.category }
        )
    }

    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.white
        self.title = "Home"
        
        do {
            let path = Bundle.main.path(forResource: "landmarkData", ofType: "json")
            let data = try Data(contentsOf: URL(fileURLWithPath: path!))
            let jsonDecoder = JSONDecoder()
            self.dataList = try jsonDecoder.decode([Landmark].self, from: data)
            self.model = dataList[0]
        } catch let error  {
            print("Error:\(error)")
        }
        
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
            let rowView = RowView(frame: CGRect(x: 0, y: y, width: width, height: 230),dataList: item,name:name,controller: self)
            rowView.clipsToBounds = true
            scrollView.addSubview(rowView)
            index = index+1
        }
        
        scrollView.contentSize = CGSize(width: width, height: CGFloat(categories.keys.count*235+530))
        scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(scrollView)
        
    }
}

struct Landmark : Codable {
    var id: Int!
    var name: String!
    var category: String!
    var city: String!
    var state: String!
    var isFeatured: Bool!
    var isFavorite: Bool!
    var park: String!
    var imageName: String!
    var coordinates: Coordinate!
}

struct Coordinate: Codable {
    var longitude: Double!
    var latitude: Double!
}

