//
//  CategoryItem.swift
//  WWDC19-Swift
//
//  Created by LiYong on 18.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import UIKit

class CategoryItemLarge : UIView{
    
    var imageName:String = ""
    
    init(frame: CGRect, imageName:String) {
        self.imageName = imageName
        super.init(frame: frame)
        
    }
    
    override func didMoveToSuperview() {
        setup()
    }
    
    private func setup(){
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.systemGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        
        let imageView = UIImageView(image:UIImage(named:imageName));
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height-30)
        imageView.layer.cornerRadius = self.layer.cornerRadius
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        
        let nameLabel = UILabel(frame: CGRect(x:0 , y: self.frame.size.height-30, width: self.frame.size.width, height: 30))
        nameLabel.textAlignment = .left
        nameLabel.text = "Turtle Rock"
        nameLabel.font = UIFont.systemFont(ofSize: 10.0)
        self.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}






