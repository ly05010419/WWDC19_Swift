//
//  MapViewController.swift
//  WWDC19-Swift
//
//  Created by LiYong on 17.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import UIKit

class MapViewController:UIViewController{
    var model:Landmark = Landmark()
    override func viewDidLoad() {
        let mapView = MapView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), model: model)
        self.view.addSubview(mapView)
    }
}
