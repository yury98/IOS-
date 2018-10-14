//
//  LabController.swift
//  DZ2
//
//  Created by Юрий Шашкин on 14/10/2018.
//  Copyright © 2018 Юрий Шашкин. All rights reserved.
//

import UIKit

class LabController: UIViewController {
    
    
    @IBOutlet weak var LabImage: UIImageView!
    @IBOutlet weak var LabName: UILabel!
    @IBOutlet weak var LabPrice: UILabel!
    var getImage = UIImage()
    var lab: Lab!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        LabImage.isUserInteractionEnabled = true
        LabImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setupUI() {
        LabImage.image = lab.image
        LabName.text = lab.name
        LabPrice.text = "\(lab.price) ₽"
        }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FullImageController") as! FullImageController
        vc.lab = self.lab
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
