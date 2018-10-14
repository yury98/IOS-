//
//  Labs.swift
//  DZ2
//
//  Created by Юрий Шашкин on 14/10/2018.
//  Copyright © 2018 Юрий Шашкин. All rights reserved.
//

import Foundation

final class Labs {
    var labs: [Lab]
    
    init() {
        let lab1 = Lab(id: 1, image: #imageLiteral(resourceName: "Lab1"), name: "Операционные системы", price: 750)
        let lab2 = Lab(id: 2, image: #imageLiteral(resourceName: "Lab2"), name: "IOS разработка", price: 1300)
        let lab3 = Lab(id: 3, image: #imageLiteral(resourceName: "Lab3"), name: "Сети и телекоммуникации", price: 1250)
        let lab4 = Lab(id: 4, image: #imageLiteral(resourceName: "Lab4"), name: "Схемотехника", price: 2000)
        labs = [lab1, lab2, lab3, lab4]
    }
}
