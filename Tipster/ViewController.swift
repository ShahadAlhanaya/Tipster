//
//  ViewController.swift
//  Tipster
//
//  Created by Shahad Nasser on 03/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    
    @IBOutlet weak var percentage5Label: UILabel!
    @IBOutlet weak var percentage10Label: UILabel!
    @IBOutlet weak var percentage20Label: UILabel!
    
    @IBOutlet weak var tip5Label: UILabel!
    @IBOutlet weak var tip10Label: UILabel!
    @IBOutlet weak var tip20Label: UILabel!
    
    
    @IBOutlet weak var total5Label: UILabel!
    @IBOutlet weak var total10Label: UILabel!
    @IBOutlet weak var total20Label: UILabel!
    
    var numberInput: Float = 0
    var stringInput: String = ""
    
    var percentage5: Float = 0.05
    var percentage10: Float = 0.10
    var percentage20: Float = 0.20
    
    var groupSize: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputLabel.text = inputLabel.text
    }
    
    @IBAction func numbersPadPressed(_ sender: UIButton) {
        if (sender.tag != 10 && sender.tag != 11 && sender.tag != 12){
            stringInput += "\(sender.tag)"
            numberInput = Float(stringInput)!
            inputLabel.text = stringInput
            calculateTips()
        }else if (sender.tag == 10){
            stringInput = ""
            numberInput = 0
            inputLabel.text = "0"
            calculateTips()
        }else if (sender.tag == 11){
            stringInput += "0"
            numberInput = Float(stringInput)!
            inputLabel.text = stringInput
            calculateTips()
        }else if (sender.tag == 12){
            stringInput += "."
            inputLabel.text = stringInput
            calculateTips()
        }
    }
    
    func calculateTips(){
        percentage5Label.text = String(format: "%.0f%%", percentage5 * 100)
        percentage10Label.text = String(format: "%.0f%%", percentage10 * 100)
        percentage20Label.text = String(format: "%.0f%%", percentage20 * 100)
        
        tip5Label.text = String(format: "%.2f", numberInput * percentage5/Float(groupSize))
        tip10Label.text = String(format: "%.2f", numberInput * percentage10/Float(groupSize))
        tip20Label.text = String(format: "%.2f", numberInput * percentage20/Float(groupSize))
        
        total5Label.text = String(format: "%.2f", numberInput+(numberInput * percentage5))
        total10Label.text = String(format: "%.2f", numberInput+(numberInput * percentage10))
        total20Label.text = String(format: "%.2f", numberInput+(numberInput * percentage20))
    }
    
    @IBAction func tipsSlideChanged(_ sender: UISlider) {
        percentage5 = round((0.05+sender.value)*100)/100
        percentage10 = round((0.1+sender.value)*100)/100
        percentage20 = round((0.2+sender.value)*100)/100
        calculateTips()
    }
    

    
    @IBAction func groupSizeSlideChanged(_ sender: UISlider) {
        groupSize = Int(round(sender.value*100))
        groupSizeLabel.text = "Group size: \(groupSize)"
        calculateTips()
    }
}

