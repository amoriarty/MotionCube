//
//  ViewController.swift
//  MotionCube
//
//  Created by Alexandra Legent on 29/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

let POLYGON_SIZE: CGFloat = 100
let MAGNITUDE: CGFloat = 10

class ViewController: UIViewController {
    let dynamicAnimator = UIDynamicAnimator()
    let collisionBehavior = UICollisionBehavior()
    let gravityBehavior: UIGravityBehavior = {
        let behavior = UIGravityBehavior()
        behavior.magnitude = MAGNITUDE
        return behavior
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addPolygon))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(gesture)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        
        dynamicAnimator.addBehavior(gravityBehavior)
        dynamicAnimator.addBehavior(collisionBehavior)
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        let topLeft = mainView.bounds.origin
        let topRight = CGPoint(x: mainView.bounds.width, y: mainView.bounds.origin.y)
        let bottomLeft = CGPoint(x: mainView.bounds.origin.x, y: mainView.bounds.height)
        let bottomRight = CGPoint(x: mainView.bounds.width, y: mainView.bounds.height)
        
        collisionBehavior.addBoundary(withIdentifier: "top" as NSCopying, from: topLeft, to: topRight)
        collisionBehavior.addBoundary(withIdentifier: "left" as NSCopying, from: topLeft, to: bottomLeft)
        collisionBehavior.addBoundary(withIdentifier: "right" as NSCopying, from: topRight, to: bottomRight)
        collisionBehavior.addBoundary(withIdentifier: "bottom" as NSCopying, from: bottomLeft, to: bottomRight)
    }
    
    @objc func addPolygon(sender: UITapGestureRecognizer) {
        let origin = sender.location(in: mainView)
        let frame = CGRect(x: origin.x - POLYGON_SIZE / 2, y: origin.y - POLYGON_SIZE / 2, width: POLYGON_SIZE, height: POLYGON_SIZE)
        let polygon = PolygonView(frame: frame)
        
        gravityBehavior.addItem(polygon)
        collisionBehavior.addItem(polygon)
        mainView.addSubview(polygon)
    }
}

