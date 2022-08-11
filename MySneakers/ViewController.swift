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
    
    var colors: [String] = ["Blanc", "Noir", "Rouge", "Bleu", "Vert"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        updateGenderLabel()
        updateSizeLabel()
        getImage()
    }
    
    func getImage() {
        let imageString = getGender() + "_" + getType() + "_" + getColor()
        resultImageView.image = UIImage(named: imageString)
        updateResultLabel()
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
        let index = colorPicker.selectedRow(inComponent: 0)
        switch index {
        case 0: return "white"
        case 1: return "black"
        case 2: return "red"
        case 3: return "blue"
        default: return "green"
        }
    }
    
    func updateResultLabel() {
        var str = ""
        if let name = nameTextField.text, name != "" {
            str += "Salut " + name + ". "
        }
        str += "J'ai trouvé pour vous cette chaussure dans la pointure: " + String(Int(sizeStepper.value))
        resultLabel.text = str
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

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func setupPicket() {
        colorPicker.delegate = self
        colorPicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getImage()
    }
}
