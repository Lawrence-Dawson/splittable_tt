////
////  ViewController.swift
////  splittable_tt
////
////  Created by Lawrence Dawson on 09/11/2016.
////  Copyright © 2016 Lawrence Dawson. All rights reserved.
////
//
//import UIKit
//import SwiftyJSON
//
//class ViewController: UITableViewController{
//    
//    var items = [ProfessionObject]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addData()
//    }
//    
//    //    override func viewWillAppear(_ animated: Bool) {
//    //        let frame:CGRect = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height-100)
//    //        self.tableView = UITableView(frame: frame)
//    //        self.tableView.dataSource = self
//    //        self.tableView.delegate = self
//    //        self.view.addSubview(self.tableView)
//    //        addData()
//    //    }
//    func addData() {
//        print("add data called")
//        RestApiManager.sharedInstance.getSheetsuApi { (json: JSON) in
//            if let results = json.array {
//                for entry in results {
//                    self.items.append(ProfessionObject(json: entry))
//                }
//                self.items.sort{$0.sortOrder < $1.sortOrder}
//                DispatchQueue.main.async(execute: {
//                    self.tableView.reloadData()
//                })
//            }
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.items.count;
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
//        
//        if cell == nil {
//            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "CELL")
//        }
//        let profession = self.items[indexPath.row]
//        
//        if let url = NSURL(string: profession.pictureURL) {
//            if let data = NSData(contentsOf: url as URL) {
//                
//                cell?.imageView?.image = UIImage(data: data as Data)
//            }
//        }
//        cell!.textLabel?.text = profession.name
//        return cell!
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//}
