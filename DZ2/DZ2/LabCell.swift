//
//  LabCell.swift
//  DZ2
//
//  Created by Юрий Шашкин on 14/10/2018.
//  Copyright © 2018 Юрий Шашкин. All rights reserved.
//

import UIKit

protocol LabCellDelegate: class {
    func addToCartTapped(lab: Lab)
}

class LabCell: UITableViewCell {


    @IBOutlet weak var LabImage: UIImageView!
    @IBOutlet weak var LabName: UILabel!
    @IBOutlet weak var LabPrice: UILabel!
    @IBOutlet weak var LabButton: UIButton!
    
    weak var delegate: LabCellDelegate?
    
    private var lab: Lab?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureView(lab: Lab) {
        self.lab = lab
        LabImage.image = lab.image
        LabName.text = lab.name
        LabPrice.text = "\(lab.price) ₽"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        guard let lab = lab else { return }
        delegate?.addToCartTapped(lab: lab)
    }
}
