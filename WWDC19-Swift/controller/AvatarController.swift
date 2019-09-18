//
//  AvatarController.swift
//  WWDC19-Swift
//
//  Created by LiYong on 17.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import UIKit

class AvatarController:UIViewController{
    
    override func viewDidLoad() {
        let avatar = Avatar(frame: CGRect(x: 0, y: 0, width: 200, height: 200),imageName: "chilkoottrail")
        avatar.center = self.view.center
        self.view.addSubview(avatar)
    }
}
