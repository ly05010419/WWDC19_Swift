//
//  Avatar.swift
//  WWDC19-Swift
//
//  Created by LiYong on 17.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import UIKit

class Avatar : UIView{
    
    var imageName:String = ""
    
    init(frame: CGRect, imageName:String) {
        self.imageName = imageName
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        self.backgroundColor = UIColor.systemBlue
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowColor = UIColor.systemGray.cgColor
        self.layer.shadowOpacity = 1
        
        
        let imageView = UIImageView(image:UIImage(named:imageName));
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        imageView.layer.cornerRadius = self.layer.cornerRadius
        imageView.clipsToBounds = true
        self.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}














