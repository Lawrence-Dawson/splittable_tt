//
//  ViewController.swift
//  splittable_tt
//
//  Created by Lawrence Dawson on 09/11/2016.
//  Copyright © 2016 Lawrence Dawson. All rights reserved.
//

import UIKit
import SwiftyJSON
var rowNow = Int()

class TableViewController: UITableViewController{
 
    var items = [ProfessionObject]()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            addData()
        }
    
    func addData() {
            RestApiManager.sharedInstance.getSheetsuApi { (json: JSON) in
                if let results = json.array {
                    for entry in results {
                        self.items.append(ProfessionObject(json: entry))
                    }
                    self.items.sort{$0.sortOrder < $1.sortOrder}
                    DispatchQueue.main.async(execute: {
                        self.tableView.reloadData()
                    })
                }
            }
        }
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.items.count;
        }
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row > 0 {
                rowNow = indexPath.row
                
                let currentViewController = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                currentViewController.dataPassed = items[rowNow].url
                navigationController?.pushViewController(currentViewController, animated: true)
                
               // performSegue(withIdentifier: "showServiceDetails", sender: indexPath.row)
            }
        }
    
   
  
//       override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if (segue.identifier == "showServiceDetails") {
//            print("called")
//            var svc = segue.destination as! WebViewController;
//            var url = svc.dataPassed
//        }
//    }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let profession = self.items[indexPath.row]
            
            if  profession.name == "Banner" {
                let cell = Bundle.main.loadNibNamed("TableViewCellBanner", owner: self, options: nil)?.first as! TableViewCellBanner
                
                let url = NSURL(string: profession.pictureURL)
                let data = NSData(contentsOf: url as! URL)
                
                cell.mainImageView.image = UIImage(data: data as! Data)
                
                return cell
                
            } else {
                let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
               
                let url = NSURL(string: profession.pictureURL)
                let data = NSData(contentsOf: url as! URL)
                
                cell.mainImageView.image = UIImage(data: data as! Data)
                cell.mainImageLabel.text = profession.name
                
                return cell
            }
            
            
        }
    
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if  self.items[indexPath.row].name == "Banner" {
                return 200
            } else {
                return 250
            }
        }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    }
