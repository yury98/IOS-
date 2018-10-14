//
//  AdCell.swift
//  DZ2
//
//  Created by Юрий Шашкин on 14/10/2018.
//  Copyright © 2018 Юрий Шашкин. All rights reserved.
//

import UIKit

class AdCell: UITableViewCell {

    @IBOutlet weak var AdImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureView() {
        AdImage.image = #imageLiteral(resourceName: "Ad")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
