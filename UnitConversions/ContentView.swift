//
//  ContentView.swift
//  UnitConversions
//
//  Created by Marko Zivanovic on 12.12.24..
//

// Celsius -> Fahrenheit
// Celsius -> Kelvin
// Kelvin -> Celsius
// Kelvin -> Fahrenheit
// Fahrenheit -> Kelvin
// Fahrenheit -> Celsius

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit = 0.0
    @State private var outputUnit = 0.0
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @State private var selectedInputTemperatureUnits = "Celsius"
    @State private var selectedOutputTemperatureUnit = "Fahrenheit"
    
    func convertTemperature() {
        switch selectedInputTemperatureUnits {
        case "Celsius":
            if selectedOutputTemperatureUnit == "Fahrenheit" {
                outputUnit = (inputUnit * 9 / 5) + 32
            } else if selectedOutputTemperatureUnit == "Kelvin" {
                outputUnit = inputUnit + 273.15
            } else {
                outputUnit = inputUnit
            }
        case "Fahrenheit":
            if selectedOutputTemperatureUnit == "Celsius" {
                outputUnit = (inputUnit - 32) * 5 / 9
            } else if selectedOutputTemperatureUnit == "Kelvin" {
                outputUnit = ((inputUnit - 32) * 5 / 9) + 273.15
            } else {
                outputUnit = inputUnit
            }
        case "Kelvin":
            if selectedOutputTemperatureUnit == "Celsius" {
                outputUnit = inputUnit - 273.15
            } else if selectedOutputTemperatureUnit == "Fahrenheit" {
                outputUnit = ((inputUnit - 273.15) * 9 / 5) + 32
            } else {
                outputUnit = inputUnit
            }
        default:
            outputUnit = 0.0
        }
    }
    
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
                        .onChange(of: inputUnit) { _ in
                            convertTemperature()
                        }
                }
                
                Section("Output unit") {
                    Picker("Choose a unit of measure", selection: $selectedOutputTemperatureUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .onChange(of: selectedOutputTemperatureUnit) { _ in
                        convertTemperature()
                    }
                }
                
                Section("Output of the conversion") {
                    Text("\(outputUnit, specifier: "%.2f") \(selectedOutputTemperatureUnit)")
                }
            }
            .navigationTitle("Unit Conversions")
        }
    }
}

#Preview {
    ContentView()
}
