//
//  ViewSamplesViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/03/28.
//

import UIKit

class ViewSamplesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func lockScreenButtonTouched(_ sender: Any) {
        if let lockScreenViewController = storyboard?.instantiateViewController(withIdentifier: "LockScreenViewController") {
            navigationController?.pushViewController(lockScreenViewController, animated: true)
        }
    }
}
