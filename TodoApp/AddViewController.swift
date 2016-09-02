//
//  AddViewController.swift
//  TodoApp
//
//  Created by cs4jcmac on 2/9/2016.
//  Copyright © 2016 jc. All rights reserved.
//

import UIKit
import Alamofire

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBAction func saveButtonTapped(sender: AnyObject) {
        guard let todoItem = textField.text else {
            return
        }
        Alamofire.request(.POST, "https://intense-bastion-31010.herokuapp.com/todo", parameters: ["name": todoItem])
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
