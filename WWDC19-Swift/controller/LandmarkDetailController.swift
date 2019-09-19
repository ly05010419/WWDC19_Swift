//
//  MapViewController.swift
//  WWDC19-Swift
//
//  Created by LiYong on 17.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import GoogleMaps


struct Landmark: Codable {
    var id: Int?
    var name: String?
    var category: String?
    var city: String?
    var state: String?
    var isFeatured: Bool?
    var isFavorite: Bool?
    var park: String?
    var imageName: String?
    var coordinates: Coordinate?
}

struct Coordinate: Codable {
    var longitude: Double?
    var latitude: Double?
}

class LandmarkDetailController: UIViewController,UIScrollViewDelegate {
    
    override func viewDidLoad() {
        do {
            let path = Bundle.main.path(forResource: "landmarkData", ofType: "json")
            
            let data = try Data(contentsOf: URL(fileURLWithPath: path!))
            
            let jsonDecoder = JSONDecoder()
            let dataList: [Landmark] = try jsonDecoder.decode([Landmark].self, from: data)
            
            let model:Landmark = dataList[0]
            
            let mapView = MapView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 400), latitude:model.coordinates?.latitude ?? 0,longitude:model.coordinates?.longitude ?? 0)
            self.view.addSubview(mapView)
            
            let avatar = Avatar(frame: CGRect(x:0 , y: 300, width: 200, height: 200),imageName: model.imageName ?? "")
            avatar.center.x = self.view.center.x
            self.view.addSubview(avatar)
            
            let nameLabel = UILabel(frame: CGRect(x:0 , y: 500, width: UIScreen.main.bounds.size.width, height: 30))
            nameLabel.textAlignment = .center
            nameLabel.text = model.name
            nameLabel.font = UIFont.systemFont(ofSize: 15.0)
            self.view.addSubview(nameLabel)
            
            let landmarkDetail:LandmarkDetail = LandmarkDetail(frame: CGRect(x:0 , y: 550, width: UIScreen.main.bounds.size.width, height: 320), dataList: dataList)
            
            self.view.addSubview(landmarkDetail)
        
        } catch let error  {
            print("Error:\(error)")
        }

    }
}
