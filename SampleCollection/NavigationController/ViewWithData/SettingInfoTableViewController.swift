//
//  SettingInfoTableViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/07.
//

import UIKit

class SettingInfoTableViewController: UIViewController {
    let arrFirstSection = ["이름", "소프트웨어 버전", "모델명", "모델 번호", "일련 번호"]
    let arrFirstDesc = ["iPhone", "15.2", "iPhone 11", "A2111", "C02YD2EAJGH6"]
    let arrSecondSection = ["노래", "비디오", "사진", "응용 프로그램", "전체 공간", "사용 가능 공간"]
    let arrSecondDesc = ["0", "0", "6", "8", "499.96GB", "211.8GB"]
    let arrThirdSection = ["인증서 신뢰 설정"]
}


extension SettingInfoTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0: return arrFirstSection.count
        case 1: return arrSecondSection.count
        case 2: return arrThirdSection.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        var content = cell.defaultContentConfiguration()
        var text = ""
        var desc = ""
        
        switch (indexPath.section) {
        case 0:
            text = arrFirstSection[indexPath.row]
            desc = arrFirstDesc[indexPath.row]
        case 1:
            text = arrSecondSection[indexPath.row]
            desc = arrSecondDesc[indexPath.row]
        case 2:
            text = arrThirdSection[indexPath.row]
        default :
            NSLog("cellForRowAt \(indexPath)")
        }
        cell.selectionStyle = .none
        content.text = text
        cell.contentConfiguration = content
        return cell
    }
}


extension SettingInfoTableViewController: UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section) {
        case 0:
            NSLog("didSelectRowAt \(indexPath)")
        default:
            NSLog("didSelectRowAt \(indexPath)")
        }
    }
}
