//
//  UIComponentViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/03/24.
//

import UIKit

class UIComponentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func labelButtonTouched(_ sender: Any) {
        if let labelViewController = storyboard?.instantiateViewController(withIdentifier: "LabelViewController") {
            navigationController?.pushViewController(labelViewController, animated: true)
        }
    }
    
    @IBAction func sampleButtonTouched(_ sender: Any) {
        if let sampleLabelViewController = storyboard?.instantiateViewController(withIdentifier: "SampleTextFieldViewController") {
            navigationController?.pushViewController(sampleLabelViewController, animated: true)
        }
    }
    
    @IBAction func textFieldButtonTouched(_ sender: Any) {
        if let textFieldViewController = storyboard?.instantiateViewController(withIdentifier: "TextFieldViewController") {
            navigationController?.pushViewController(textFieldViewController, animated: true)
        }
    }
    
    @IBAction func webkitButtonTouched(_ sender: Any) {
        if let webKitViewController = storyboard?.instantiateViewController(withIdentifier: "SampleWebKitViewController") {
            navigationController?.pushViewController(webKitViewController, animated: true)
        }
        
    }
}
