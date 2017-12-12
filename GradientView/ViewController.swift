//
//  ViewController.swift
//  GradientView
//
//  Created by Lee Dowthwaite on 10/12/2017.
//  Copyright © 2017 Echelon Developments Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientView: GradientView!
    //@IBOutlet weak var gradientView3: GradientView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        let gradientView2 = GradientView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
//        gradientView2.startColor = UIColor.blue
//        self.view.addSubview(gradientView2)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

