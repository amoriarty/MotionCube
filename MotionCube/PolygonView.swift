//
//  PolygonView.swift
//  MotionCube
//
//  Created by Alexandra Legent on 29/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class PolygonView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let colors: [UIColor] = [.blue, .red, .yellow, .brown, .purple, .black, .green]
        let random = arc4random_uniform(UInt32(colors.count))
        
        backgroundColor = colors[Int(random)]
        layer.cornerRadius = random % 2 == 0 ? POLYGON_SIZE / 2 : 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
