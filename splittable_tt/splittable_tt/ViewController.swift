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
        btn.setTitle("Add new Dummy", for: UIControlState.normal)
        btn.addTarget(self, action: "addDummyData", for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    func addDummyData() {
        RestApiManager.sharedInstance.getSheetsuApi { (json: JSON) in
            if let results = json["results"].array {
                for entry in results {
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


}

