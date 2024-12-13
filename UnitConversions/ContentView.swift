//
//  ContentView.swift
//  UnitConversions
//
//  Created by Marko Zivanovic on 12.12.24..
//

import SwiftUI

struct ContentView: View {
    
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedTemperatureUnits = "Celsius"
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Unit input") {
                    Picker("Choose a unit of measure", selection: $selectedTemperatureUnits) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Enter a input unit value") {
                    
                }
                
                Section("Output unit") {
                    
                }
                
                Section("Output of the conversion") {
                    
                }
            }
            .navigationTitle("Unit Conversions")
        }
    }
}


#Preview {
    ContentView()
}
