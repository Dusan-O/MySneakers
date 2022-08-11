//
//  ViewController.swift
//  MySneakers
//
//  Created by Dusan Orescanin on 11/08/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeSegmented: UISegmentedControl!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var sizeStepper: UIStepper!
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        updateGenderLabel()
        updateSizeLabel()
    }
    
    func getImage() {
        let imageString = getGender() + "_" + getType() + "_" + getColor()
        print(imageString)
    }

    func getType() -> String {
        switch typeSegmented.selectedSegmentIndex {
        case 0: return "city"
        case 1: return "running"
        default: return "basket"
        }
    }
    
    func getGender() -> String {
        return genderSwitch.isOn ? "boy" : "girl"
    }
    
    func getColor() -> String {
        return ""
    }
    
    func updateGenderLabel() {
        let str = genderSwitch.isOn ? "Homme" : "Femme"
        genderLabel.text = str
    }
    
    func updateSizeLabel() {
        let sizeString = "Pointure: \(Int(sizeStepper.value))"
        sizeLabel.text = sizeString
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        getImage()
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateGenderLabel()
        getImage()
    }
    
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        updateSizeLabel()
        getImage()
    }


    }

extension ViewController: UITextFieldDelegate {
    func setupTextField() {
        nameTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
