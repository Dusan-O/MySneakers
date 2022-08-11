//
//  ViewController.swift
//  MySneakers
//
//  Created by Dusan Orescanin on 11/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeSegmented: UISegmentedControl!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var sizeStepper: UIStepper!
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
    }
    
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
    }
    
    
    
    
    


}

