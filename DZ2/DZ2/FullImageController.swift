//
//  FullImage.swift
//  DZ2
//
//  Created by Юрий Шашкин on 14/10/2018.
//  Copyright © 2018 Юрий Шашкин. All rights reserved.
//

import UIKit

class FullImageController: UIViewController {
    @IBOutlet weak var LabImage: UIImageView!
    
    
    var lab: Lab!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LabImage.image = lab.image
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
