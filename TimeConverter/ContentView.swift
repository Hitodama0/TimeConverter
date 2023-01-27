//
//  ContentView.swift
//  TimeConverter
//
//  Created by Biagio Ricci on 27/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber: Double = 0
    @State private var inputUnit: String = "Seconds"
    @State private var outputUnit: String = "Seconds"
    @FocusState private var isFocused: Bool
    
    let units = ["Seconds", "Minutes", "Hours", "Days"]
    
    var input: Double {
        let number = inputNumber
        
        if inputUnit == "Minutes" {
            return number * 60
        }
        else if inputUnit == "Hours" {
            return number * 3600
        }
        else if inputUnit == "Days" {
            return number * 86400
        }
        
        return number
    }
    
    var output: Double {
        let number = input
        
        if outputUnit == "Minutes" {
            return number / 60
        }
        
        else if outputUnit == "Hours" {
            return number / 3600
        }
        else if outputUnit == "Days" {
            return number / 86400
        }
        else if outputUnit == "Seconds" {
            return number
        }
        
        return number
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section{
                    TextField("Input value", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Text(output, format: .number)
                } header: {
                    Text("Your conversion is: ")
                }
            }
            .navigationTitle("Time converter")
            .toolbar {
                ToolbarItem(placement: .principal) { Image(systemName: "clock")
                }
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

