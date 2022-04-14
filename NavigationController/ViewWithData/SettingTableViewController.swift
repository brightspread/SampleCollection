//
//  SettingTableViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/07.
//

import UIKit

class SettingTableViewController: UIViewController {
    let arrFirstSection = ["정보"]
    let arrSecondSection = ["키보드", "게임 컨트롤러", "서체", "언어 및 지역", "사전"]
    let arrThirdSection = ["전송 또는 iPhone 재설정"]
}

extension SettingTableViewController: UITableViewDataSource {
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

        var attributes: [NSAttributedString.Key: Any] = [:]
        
        switch (indexPath.section) {
        case 0:
            text = arrFirstSection[indexPath.row]
            cell.accessoryType = .disclosureIndicator
        case 1:
            text = arrSecondSection[indexPath.row]
            cell.selectionStyle = .none
            attributes = [.foregroundColor: UIColor.lightGray]
        case 2:
            text = arrThirdSection[indexPath.row]
            cell.selectionStyle = .none
            attributes = [.foregroundColor: UIColor.lightGray]
        default :
            NSLog("cellForRowAt \(indexPath)")
        }
        
        // var, let
        let att = NSMutableAttributedString.init(string: text, attributes: attributes)
        att.append(NSAttributedString.init(string: "파랑파랑파랑파랑", attributes: [.foregroundColor: UIColor.blue]))
        att.append(NSAttributedString.init(string: "노랑노랑노랑노랑", attributes: [.foregroundColor: UIColor.yellow]))
        att.removeAttribute(.foregroundColor, range: NSRange.init(location: 3, length: 7))
        //att = NSMutableAttributedString.init(string: text, attributes: attributes)
        content.attributedText = att
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 55
    }
}

extension SettingTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section) {
        case 0:
            if let settingInfoTableViewController = storyboard?.instantiateViewController(withIdentifier: "SettingInfoTableViewController") {
                navigationController?.pushViewController(settingInfoTableViewController, animated: true)
            }
        default:
            NSLog("didSelectRowAt \(indexPath)")
        }
    }
}
