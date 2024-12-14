//
//  ContentView.swift
//  UnitConversions
//
//  Created by Marko Zivanovic on 12.12.24..
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit = 0.0
    @State private var outputUnit = 0.0
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedInputTemperatureUnits = "Celsius"
    @State private var selectedOutputTemperatureUnit = "Fahrenheit"
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Unit input") {
                    Picker("Choose a unit of measure", selection: $selectedInputTemperatureUnits) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Enter a input unit value") {
                    TextField("Input value", value: $inputUnit, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section("Output unit") {
                    Picker("Choose a unit of measure", selection: $selectedOutputTemperatureUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Output of the conversion") {
                    TextField("Output value", value: $outputUnit, format: .number)
                }
            }
            .navigationTitle("Unit Conversions")
        }
    }
}


#Preview {
    ContentView()
}



