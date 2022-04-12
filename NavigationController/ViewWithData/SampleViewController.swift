//
//  SampleViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/05.
//

import UIKit

class SampleViewController: UIViewController {
 
    let sections = ["우량주", "성장주", "코인"]
    let arrImage = ["dollarsign.circle", "dollarsign.circle", "bitcoinsign.circle"]
    
    let arrWoo = ["삼성전자", "현대자동차", "LG생활건강"]
    let arrDescWoo = ["69,200", "177,500", "912,000"]

    let arrSung = ["LG에너지솔루션", "카카오뱅크", "셀트리온"]
    let arrDescSung = ["443,000", "50,200", "170,000"]

    let arrCoin = ["비트코인", "이더리움", "도지코인"]
    let arrDescCoin = ["56,891,000", "4,293,000", "184"]

}

extension SampleViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return arrWoo.count
        case 1:
            return arrSung.count
        case 2:
            return arrCoin.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell") as! SampleTableViewCell
        
        var title = ""
        var desc = ""
        var imageName = arrImage[indexPath.section]
        switch (indexPath.section) {
        case 0:
            title = arrWoo[indexPath.row]
            desc = arrDescWoo[indexPath.row]
        case 1:
            title = arrSung[indexPath.row]
            desc = arrDescSung[indexPath.row]
        case 2:
            title = arrCoin[indexPath.row]
            desc = arrDescCoin[indexPath.row]
        default:
            NSLog("cellForRowAt \(indexPath)")
        }
        
        cell.accessoryType = .disclosureIndicator
        
        cell.selectionStyle = .none
     
        
        cell.setup(title: title, desc: desc, imageName: imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}

extension SampleViewController: UITableViewDelegate {
  
}


