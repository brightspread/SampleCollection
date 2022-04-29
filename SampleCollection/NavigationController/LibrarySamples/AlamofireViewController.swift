//
//  AlamofireViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/27.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {
   
    var blogItems: [Item] = []
    @IBOutlet weak var tvBlogs: UITableView!
    @IBOutlet weak var tfSearch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchButtonTouched(_ sender: Any) {
        if let text = tfSearch.text {
            searchBlogs(query: text)
            tfSearch.text = ""
        }
    }
    
    func searchBlogs(query: String) {
        let query = ["query": query]
        let header: HTTPHeaders = ["X-Naver-Client-Id": "xd5WmkaxTTKYFMqaAqkf",
                                   "X-Naver-Client-Secret": "D59FMGZyOx"]
        
        AF.request("https://openapi.naver.com/v1/search/blog.json",
                   method: .get,
                   parameters: query,
                   headers: header)
            .responseDecodable(completionHandler: { [weak self] (response : DataResponse<Blog, AFError>) in
                NSLog("response : \(response)")
                switch (response.result) {
                case .success(let data):
                    NSLog("data : \(data)")
                    self?.blogItems = data.items
                    self?.tvBlogs.reloadData()
                default:
                    NSLog("response: \(response)")
                }
            })
    }
    
    func removeHTMLTag(text: String) -> String {
        var removedText = text
        if (removedText.contains("<b>") || removedText.contains("</b>") || removedText.contains("&quot;") ||
            removedText.contains("&lt;") || removedText.contains("&gt;") || removedText.contains("&amp;")) {
                removedText = removedText.replacingOccurrences(of: "<b>", with: "")
                removedText = removedText.replacingOccurrences(of: "</b>", with: "")
                removedText = removedText.replacingOccurrences(of: "&quot;", with: "\"")
                removedText = removedText.replacingOccurrences(of: "&lt;", with: "<")
                removedText = removedText.replacingOccurrences(of: "&gt;", with: ">")
                removedText = removedText.replacingOccurrences(of: "&amp;", with: "&")
        }
        return removedText
    }
}

extension AlamofireViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = removeHTMLTag(text: blogItems[indexPath.row].title)
        cell.contentConfiguration = content
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension AlamofireViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Blog
struct Blog: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let itemDescription, bloggername: String
    let bloggerlink: String
    let postdate: String
    
    enum CodingKeys: String, CodingKey {
        case title, link
        case itemDescription = "description"
        case bloggername, bloggerlink, postdate
    }
}
