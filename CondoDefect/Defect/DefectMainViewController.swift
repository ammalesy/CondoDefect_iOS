
//
//  DefectMainViewController.swift
//  CondoDefect
//
//  Created by Apple on 5/8/16.
//  Copyright © 2016 Nuizoro. All rights reserved.
//

import UIKit

class DefectMainViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var project:ProjectModel?
    var building:BuildingModel?
    var room:RoomModel?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var passLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var failLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        room?.listDefect = NSMutableArray()
        let model1:DefectModel = DefectModel()
        model1.name = "Defect1"
        model1.subTitle = "Test Subtitle Defect1"
        model1.status = "N"
        
        let model2:DefectModel = DefectModel()
        model2.name = "Defect2"
        model2.subTitle = "Test Subtitle Defect2"
        model2.status = "Y"
        
        let model3:DefectModel = DefectModel()
        model3.name = "Defect3"
        model3.subTitle = "Test Subtitle Defect3"
        model3.status = "N"
        
        let model4:DefectModel = DefectModel()
        model4.name = "Defect4"
        model4.subTitle = "Test Subtitle Defect4"
        model4.status = "N"
        
        let model5:DefectModel = DefectModel()
        model5.name = "Defect5"
        model5.subTitle = "Test Subtitle Defect5"
        model5.status = "Y"
        
        let model6:DefectModel = DefectModel()
        model6.name = "Defect6"
        model6.subTitle = "Test Subtitle Defect6"
        model6.status = "Y"
        
        let model7:DefectModel = DefectModel()
        model7.name = "Defect7"
        model7.subTitle = "Test Subtitle Defect7"
        model7.status = "N"
        
        self.room?.listDefect.addObject(model1)
        self.room?.listDefect.addObject(model2)
        self.room?.listDefect.addObject(model3)
        self.room?.listDefect.addObject(model4)
        self.room?.listDefect.addObject(model5)
        self.room?.listDefect.addObject(model6)
        self.room?.listDefect.addObject(model7)
        
        self.configtitleLabel()
        self.configTableView()
    }
    func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 137.0
        self.tableView.contentInset = UIEdgeInsetsMake(-1.0, 0.0, 0.0, 0.0);
    }
    func configtitleLabel(){
        var countPass = 0
        var countFail = 0
        
        for  model:DefectModel in ((self.room?.listDefect)! as NSArray as! [DefectModel]) {
            if model.status == "Y" {
                countPass = countPass + 1
            }else{
                countFail = countFail + 1
            }
        }
        
        self.titleLb.text = "\(String(self.room!.listDefect.count)) defect"
        self.passLb.text = "\(String(countPass)) pass"
        self.failLb.text = "\(String(countFail)) reject"
        
        self.topView.layer.cornerRadius = 5.0
        self.topView.layer.masksToBounds = true
        
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (room?.listDefect.count)!
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model:DefectModel = room?.listDefect.objectAtIndex(indexPath.row) as! DefectModel
        let cell:DefectTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! DefectTableViewCell
        //cell.textLabel?.text = model.name
        cell.subCategoriesValueLb?.text = model.subTitle
        
        if model.status == "N" {
            cell.iconStatusImgView?.image = UIImage(named: "red")
        }else{
            cell.iconStatusImgView?.image = UIImage(named: "grees")
        }
        
        
        return cell
        
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addDefectAction(sender: AnyObject) {
        
        let controller:AddDefectViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AddDefectViewController") as! AddDefectViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBAction func showCustomerInfoAction(sender: AnyObject) {
        
        
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
