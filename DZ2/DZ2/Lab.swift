//
//  Lab.swift
//  DZ2
//
//  Created by Юрий Шашкин on 14/10/2018.
//  Copyright © 2018 Юрий Шашкин. All rights reserved.
//

import UIKit

final class Lab {
    var id: Int
    var image: UIImage
    var name: String
    var price: Double
    
    init(id: Int, image: UIImage, name: String, price: Double) {
        self.id = id
        self.image = image
        self.name = name
        self.price = price
    }
}
