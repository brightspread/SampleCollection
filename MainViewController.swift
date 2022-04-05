//
//  ViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/03/24.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func UIComponentButtonTouched(_ sender: Any) {
        if let uiComponentViewController = storyboard?
            .instantiateViewController(withIdentifier: "UIComponentViewController") as? UIComponentViewController {
            navigationController?.pushViewController(uiComponentViewController, animated: true)
        }
    }
    
    @IBAction func ViewSamplesButtonTouched(_ sender: Any) {
        if let viewSamplesViewController = storyboard?
            .instantiateViewController(withIdentifier: "ViewSamplesViewController") as? ViewSamplesViewController {
            navigationController?.pushViewController(viewSamplesViewController, animated: true)
        }

    }
    
    @IBAction func ViewWithDataButtonTouched(_ sender: Any) {
        if let viewWithDataViewController = storyboard?
            .instantiateViewController(withIdentifier: "ViewWithDataViewController") as? ViewWithDataViewController {
            navigationController?.pushViewController(viewWithDataViewController, animated: true)
        }
    }
}

