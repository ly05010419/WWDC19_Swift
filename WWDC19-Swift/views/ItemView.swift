//
//  CategoryItem.swift
//  WWDC19-Swift
//
//  Created by LiYong on 05.10.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import Foundation
import UIKit

class ItemView : UIView{
    var model:Landmark = Landmark()
    var height:CGFloat = 150
    var width:CGFloat = 150
    var controller:HomeViewController?
    
    init(frame: CGRect, model:Landmark,width:CGFloat,height:CGFloat,controller:HomeViewController?) {
        self.model = model
        self.width = width
        self.height = height
        self.controller = controller
        super.init(frame: frame)
    }
    
    override func didMoveToSuperview() {
        setup()
    }
    
    private func setup(){
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.systemGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        let imageView = UIImageView(image:UIImage(named:self.model.imageName));
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(buttonPressed))
        imageView.addGestureRecognizer(gesture)
        imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        imageView.layer.cornerRadius = self.layer.cornerRadius
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        
        let nameLabel = UILabel(frame: CGRect(x:0 , y: height, width: self.frame.size.width, height: 30))
        nameLabel.textAlignment = .left
        nameLabel.text = self.model.name
        nameLabel.font = UIFont.systemFont(ofSize: 12.0)
        self.addSubview(nameLabel)
    }
    
    @objc func buttonPressed(){
        let vc = LandmarkDetailController()
        vc.dataList = self.controller?.dataList
        vc.model = self.controller?.model
        self.controller?.navigationController?.pushViewController(vc, animated: true)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}





