//
//  ViewController.swift
//  TodoApp
//
//  Created by cs4jcmac on 30/8/2016.
//  Copyright © 2016 jc. All rights reserved.
//


import UIKit
import Alamofire


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var jsonArray:NSMutableArray?
    var newArray: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self

        
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request(.GET, "https://intense-bastion-31010.herokuapp.com/todo") .responseJSON { response in
            print(response.request)  // 原始的 URL 要求
            print(response.response) // URL 回應
            print(response.data)     // 伺服器資料
            print(response.result)   // 回應的序列化結果
            
            if let JSON = response.result.value {
                self.jsonArray = JSON as? NSMutableArray
                for item in self.jsonArray!{
                    if let name = item["name"], myName = name as? String{
                        print(myName)
                        self.newArray.append(myName)
                    }
                }
                
                self.tableView.reloadData()
//                print("JSON: \(JSON)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mycell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = self.newArray[indexPath.row]
        return cell
    }
    


}

