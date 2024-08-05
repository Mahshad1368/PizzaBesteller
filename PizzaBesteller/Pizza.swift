//
//  Pizza.swift
//  PizzaBesteller
//
//  Created by Mahshad Jafari on 05.08.24.
//

import Foundation

class Pizza: ObservableObject {
    
    static let pizzaTypes = ["Salami", "Funghi", "Margherita", "Mozzarella", "Etna", "Tonno", "Ragu", "Peperoni"]
    
    @Published var pizzaTypeIndex = 0
    @Published var anzahl = 0
    
    static var pizzaSizes = ["Small", "Medium", "Larg"]
    @Published var pizzaSizesIndex = 0
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    
    var isInvalid: Bool {
        return name.isEmpty || streetAddress.isEmpty || city.isEmpty
    }
    
    
}
