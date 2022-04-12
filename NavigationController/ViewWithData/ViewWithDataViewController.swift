//
//  ViewWithDataViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/04.
//

import UIKit

class ViewWithDataViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func basicTableViewButtonTouched(_ sender: Any) {
        if let basicTableViewController = storyboard?.instantiateViewController(withIdentifier: "BasicTableViewController") {
            navigationController?.pushViewController(basicTableViewController, animated: true)
        }
    }
    
    @IBAction func basic2TableViewButtonTouched(_ sender: Any) {
        if let basic2TableViewButtonTouched = storyboard?.instantiateViewController(withIdentifier: "Basic2TableViewController") {
            navigationController?.pushViewController(basic2TableViewButtonTouched, animated: true)
        }
    }
    
    @IBAction func CustomTableViewButtonTouched(_ sender: Any) {
        if let customTableViewController = storyboard?.instantiateViewController(withIdentifier: "CustomTableViewController") {
            navigationController?.pushViewController(customTableViewController, animated: true)
        }
    }
    
    @IBAction func SettingTableViewController(_ sender: Any) {
        if let settingTableViewController = storyboard?.instantiateViewController(withIdentifier: "SettingTableViewController") {
            navigationController?.pushViewController(settingTableViewController, animated: true)
        }
    }
    
    @IBAction func SampleTableViewButtonTouched(_ sender: Any) {
        if let sampleViewController = storyboard?.instantiateViewController(withIdentifier: "SampleViewController") {
            navigationController?.pushViewController(sampleViewController, animated: true)
        }
    }
}
