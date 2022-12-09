//
//  ViewController.swift
//  newBall
//
//  Created by Никитин Артем on 7.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    let myBall = Ball()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .black

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myBall.ball)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myBall.setBall()
    }

}

