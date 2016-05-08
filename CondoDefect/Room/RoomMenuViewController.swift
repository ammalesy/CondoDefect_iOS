//
//  RoomMenuViewController.swift
//  CondoDefect
//
//  Created by Apple on 5/8/16.
//  Copyright © 2016 Nuizoro. All rights reserved.
//

import UIKit

class RoomMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var project:ProjectModel?
    var building:BuildingModel?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pjImageView: UIImageView!
    @IBOutlet weak var buildingImageView: UIImageView!
    @IBOutlet weak var borderPjView: UIView!
    @IBOutlet weak var borderBuildingView: UIView!
    @IBOutlet weak var pjLb: UILabel!
    @IBOutlet weak var buildingLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.cornerRadiusOnView(self.pjImageView, value: self.pjImageView.frame.size.width / 2)
        self.cornerRadiusOnView(self.buildingImageView, value: self.buildingImageView.frame.size.width / 2)
        self.cornerRadiusOnView(self.borderPjView, value: self.borderPjView.frame.size.width / 2)
        self.cornerRadiusOnView(self.borderBuildingView, value: self.borderBuildingView.frame.size.width / 2)
        
        self.pjLb.text = project?.name
        self.buildingLb.text = building?.name
        self.pjImageView.image = project?.image
        self.buildingImageView.image = building?.image
        
        self.tableView.contentInset = UIEdgeInsetsMake(-1.0, 0.0, 0.0, 0.0);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cornerRadiusOnView(view: UIView, value: CGFloat){
        
        view.layer.cornerRadius = value
        view.layer.masksToBounds = true
        
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (building?.listRoom.count)!
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model:RoomModel = building?.listRoom.objectAtIndex(indexPath.row) as! RoomModel
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel?.text = model.name
        if model.status == "N" {
            cell.imageView?.image = UIImage(named: "red")
        }else{
            cell.imageView?.image = UIImage(named: "grees")
        }
        
        return cell
        
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let model:RoomModel = building?.listRoom.objectAtIndex(indexPath.row) as! RoomModel
        //Present new view controller
       
        let destViewController:NavDefectViewController = self.storyboard?.instantiateViewControllerWithIdentifier("NavDefectViewController") as! NavDefectViewController
        let controllers:NSArray = destViewController.viewControllers
        for controller in controllers {
            if(controller.isKindOfClass(DefectMainViewController)){

                (controller as! DefectMainViewController).project = self.project
                (controller as! DefectMainViewController).building = self.building
                (controller as! DefectMainViewController).room = model
            }
        }
        self.splitViewController?.showDetailViewController(destViewController, sender: nil)
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
