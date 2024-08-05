//
//  ContentView.swift
//  PizzaBesteller
//
//  Created by Mahshad Jafari on 05.08.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pizza = Pizza()
    @State var showingConfirmation = false
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Wähle deine Pizza aus", selection: $pizza.pizzaTypeIndex) {
                        ForEach(0..<Pizza.pizzaTypes.count) {
                            Text(Pizza.pizzaTypes[$0]).tag($0)
                        }
                    }
                    Stepper(value: $pizza.anzahl, in: 0...7) {
                        Text("Anzahl an Pizzen : \(pizza.anzahl)")
                    }
                }
                Section {
                    Picker("", selection: $pizza.pizzaSizesIndex) {
                        ForEach(0..<Pizza.pizzaSizes.count) {
                            Text(Pizza.pizzaSizes[$0]).tag($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text( "Lieferung")) {
                    TextField("Name", text: $pizza.name)
                    TextField("Addresse", text: $pizza.streetAddress)
                    TextField("City", text: $pizza.city)
                }
                
                
                Section{
                    
                    Button(action: {showingConfirmation = true}) {
                        Text("Kostenpflichtig bestellen")
                    }.disabled(pizza.isInvalid)
                }
            }
            
            
            .navigationBarTitle("Pizza Beschtellung")
            .alert(isPresented: $showingConfirmation) {
                Alert(title: Text("Vielen Dank für Ihre Bestellung"), message: Text("Ihre Bestellung (\(pizza.anzahl) x Pizza \(Pizza.pizzaTypes[pizza.pizzaTypeIndex]) in der Größe \(Pizza.pizzaSizes[pizza.pizzaSizesIndex])) wird in kürze an die folgende Adresse geliefert:\nName:  \(pizza.name)\nStraße: \(pizza.streetAddress)\nStadt: \(pizza.city)"), dismissButton: .cancel())
            }
        }
    }
}
#Preview {
    ContentView()
}
