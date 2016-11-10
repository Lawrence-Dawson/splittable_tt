//
//  ViewController.swift
//  splittable_tt
//
//  Created by Lawrence Dawson on 09/11/2016.
//  Copyright © 2016 Lawrence Dawson. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var items = [ProfessionObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        let frame:CGRect = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height-100)
        self.tableView = UITableView(frame: frame)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        
        let btn = UIButton(frame: CGRect(x: 0, y: 25, width: self.view.frame.width, height: 50))
        btn.backgroundColor = UIColor.cyan
        btn.setTitle("Retrieve Data", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(ViewController.addData), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    func addData() {
        print("add data called")
        RestApiManager.sharedInstance.getSheetsuApi { (json: JSON) in
            //print(json)
            if let results = json.array {
                for entry in results {
                   // print(results)
                    self.items.append(ProfessionObject(json: entry))
                }
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
    
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "CELL")
        }
        let profession = self.items[indexPath.row]
        print(profession.pictureURL)

        if let url = NSURL(string: profession.pictureURL) {
            print(url)
            if let data = NSData(contentsOf: url as URL) {
                cell?.imageView?.image = UIImage(data: data as Data)
            }
        }
        cell!.textLabel?.text = profession.name
        return cell!
    }
}
