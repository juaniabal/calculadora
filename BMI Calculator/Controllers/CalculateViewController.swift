//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Juan Ignacio Abal on 3/11/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//
import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue = "0.0"
    var bmiColor : UIColor?
    var bmiAdvice: String?
    
    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: Any) {
        heightLabel.text = "\(String(format: "%.2f", heightSlider.value))m"
    }
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = "\(String(format: "%.0f", weightSlider.value))kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        //let bmi  = weightSlider.value/(heightSlider.value * heightSlider.value)
        
        calculatorBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.bmiAdvice = calculatorBrain.getAdvice()
            destinationVC.bmiColor = calculatorBrain.getColor()
        }
    }
    
}

