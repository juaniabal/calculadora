//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Juan Ignacio Abal on 3/11/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit
struct CalculatorBrain{
    var bmi : BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height*height)
        if(bmiValue < 18.5){
            bmi = BMI(value: bmiValue, color: UIColor.blue, advice: "Come mas")
        }else if(bmiValue < 24.9){
            bmi = BMI(value: bmiValue, color: UIColor.green, advice: "Segui asi")
        }else{
            bmi = BMI(value: bmiValue, color: UIColor.yellow, advice: "BASTA")
        }
    }
    func getBMIValue() -> String{
        let bmiToDecimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDecimal
    }
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
}

