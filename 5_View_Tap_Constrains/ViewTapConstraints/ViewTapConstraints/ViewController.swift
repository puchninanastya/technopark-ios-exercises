//
//  ViewController.swift
//  ViewTapConstraints
//
//  Created by Anastasia Puchnina on 28/11/2018.
//  Copyright © 2018 Anastasia Puchnina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorSliderRed: UISlider!
    @IBOutlet weak var colorSliderGreen: UISlider!
    @IBOutlet weak var colorSliderBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 100
        colorView.layer.masksToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.changeViewVisability(_:)))
        tapGesture.numberOfTapsRequired = 2
        colorView.addGestureRecognizer(tapGesture)
        colorView.isUserInteractionEnabled = true
    }

    @IBAction func setRedValueInColor(_ sender: UISlider) {
        var redValue: CGFloat = 0
        var greenValue: CGFloat = 0
        var blueValue: CGFloat = 0
        var alphaValue: CGFloat = 0
        colorView.backgroundColor?.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)
        colorView.backgroundColor? = UIColor(red: CGFloat(sender.value)/255, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
    
    @IBAction func setGreenValueInColor(_ sender: UISlider) {
        var redValue: CGFloat = 0
        var greenValue: CGFloat = 0
        var blueValue: CGFloat = 0
        var alphaValue: CGFloat = 0
        colorView.backgroundColor?.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)
        colorView.backgroundColor? = UIColor(red: redValue, green: CGFloat(sender.value)/255, blue: blueValue, alpha: alphaValue)
    }
    
    @IBAction func setBlueValueInColor(_ sender: UISlider) {
        var redValue: CGFloat = 0
        var greenValue: CGFloat = 0
        var blueValue: CGFloat = 0
        var alphaValue: CGFloat = 0
        colorView.backgroundColor?.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)
        colorView.backgroundColor? = UIColor(red: redValue, green: greenValue, blue: CGFloat(sender.value)/255, alpha: alphaValue)
    }
    
    @objc func changeViewVisability(_ sender: UITapGestureRecognizer) {
        if (self.colorView.alpha == 1) {
            self.colorView.alpha = 0.1
        } else {
            self.colorView.alpha = 1
        }
    }
}

