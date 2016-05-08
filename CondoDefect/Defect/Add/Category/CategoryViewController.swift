//
//  CategoryViewController.swift
//  CondoDefect
//
//  Created by Apple on 5/9/16.
//  Copyright © 2016 Nuizoro. All rights reserved.
//

import UIKit

let TAG_CATEGORY_TABLEVIEW = 999

class CategoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var refController:AddDefectViewController!
    
    var listCategory:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listCategory = CategoryManager.getDummyCategory()
        
        self.tableView.dataSource = self
        self.tableView.tag = TAG_CATEGORY_TABLEVIEW
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listCategory.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model:Category = listCategory.objectAtIndex(indexPath.row) as! Category
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel?.text = model.name
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let model:Category = CategoryManager.getDummyCategory().objectAtIndex(indexPath.row) as! Category
        refController.selectedCategory = model
        refController.categoryBtn.setTitle(refController.selectedCategory.name, forState: UIControlState.Normal)
        refController.tableView.reloadData()
        
        self.dismissViewControllerAnimated(true) { 
        
        }
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
