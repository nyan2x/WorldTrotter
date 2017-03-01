//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Marianne Grace Borces on 3/1/17.
//  Copyright © 2017 Marianne Grace Borces. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLable: UILabel!
    
    @IBAction func fahrenheitFieldEditingChanged( _ textField: UITextField ) {
        if let text = textField.text, let value = Double( text ) {
            fahrenheitValue = Measurement( value : value, unit : .fahrenheit )
        } else {
            fahrenheitValue = nil
        }
    }

    var fahrenheitValue : Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue : Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted( to: .celsius )
        } else {
            return nil
        }
    }
    
    let numberFormatter : NumberFormatter = {
        let nf = NumberFormatter()

        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1

        return nf
    }()
    
    func updateCelsiusLabel () {
        if let celsiusValue = celsiusValue {
            celsiusLable.text = numberFormatter.string(from: NSNumber( value : celsiusValue.value ) )
        } else {
            celsiusLable.text = "???"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsiusLabel()
    }
}

