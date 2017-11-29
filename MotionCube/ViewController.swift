//
//  ViewController.swift
//  MotionCube
//
//  Created by Alexandra Legent on 29/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

let POLYGON_SIZE: CGFloat = 100

class ViewController: UIViewController {
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
        
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    @objc func addPolygon(sender: UITapGestureRecognizer) {
        let origin = sender.location(in: mainView)
        let frame = CGRect(x: origin.x - POLYGON_SIZE / 2, y: origin.y - POLYGON_SIZE / 2, width: POLYGON_SIZE, height: POLYGON_SIZE)
        let polygon = PolygonView(frame: frame)
        mainView.addSubview(polygon)
    }
}

