//
//  Products.swift
//  tash6.4
//
//  Created by Islam Erlan Uulu on 6/6/23.
//

import Foundation
import UIKit


struct Products {
    
    var name: String
    var image: UIImage
}


class Menu {
    var products = [Products]()
    init(){
        setup()
        
        
    }
    func setup(){
        let p1 = Products(name: "Tony Romas", image: UIImage(named: "TonyRomas")!)
        let p2 = Products(name: "Tony Romas", image: UIImage(named: "TonyRomas")!)
        self.products = [p1, p2]
    }
}
