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
        if let sampleLabelViewController = storyboard?.instantiateViewController(withIdentifier: "SampleLabelViewController") {
            navigationController?.pushViewController(sampleLabelViewController, animated: true)
        }
    }
    
}
