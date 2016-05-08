//
//  BuildingViewController.swift
//  CondoDefect
//
//  Created by Apple on 5/7/16.
//  Copyright © 2016 Nuizoro. All rights reserved.
//

import UIKit

class BuildingViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var project:ProjectModel?

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleNameLb: UILabel!
    @IBOutlet weak var buildingCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        project?.listBuilding = NSMutableArray()
        let model1:BuildingModel = BuildingModel()
        model1.name = "Building 1"
        model1.imageName = "11-11.jpg"
        model1.image = UIImage(named: model1.imageName)
        
        let model2:BuildingModel = BuildingModel()
        model2.name = "Building 2"
        model2.imageName = "22-11.jpg"
        model2.image = UIImage(named: model2.imageName)
        
        let model3:BuildingModel = BuildingModel()
        model3.name = "Building 3"
        model3.imageName = "33-11.jpg"
        model3.image = UIImage(named: model3.imageName)
        
        let model4:BuildingModel = BuildingModel()
        model4.name = "Building 4"
        model4.imageName = "44-11.jpeg"
        model4.image = UIImage(named: model4.imageName)
        
        project?.listBuilding.addObject(model1)
        project?.listBuilding.addObject(model2)
        project?.listBuilding.addObject(model3)
        project?.listBuilding.addObject(model4)
        
        
        self.backgroundImageView.image = project?.image
        self.iconImageView.image = project?.image
        self.titleNameLb.text = project?.name
        self.cornerRadiusOnView(self.iconImageView, value: self.iconImageView.frame.size.width / 2)
        self.cornerRadiusOnView(self.circleView, value: self.circleView.frame.size.width / 2)
//        self.circleView.layer.borderWidth = 10.0
//        self.circleView.layer.borderColor = UIColor.whiteColor().CGColor
        
        
        
        self.buildingCollectionView.dataSource = self
        self.buildingCollectionView.delegate  = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func cornerRadiusOnView(view: UIView, value: CGFloat){
        
        view.layer.cornerRadius = value
        view.layer.masksToBounds = true
        
        
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (project?.listBuilding.count)!
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let model:BuildingModel = project?.listBuilding.objectAtIndex(indexPath.row) as! BuildingModel
        let cell:BuildingCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! BuildingCollectionViewCell
        
        cell.backgroundImageView.image = UIImage(named: String(model.imageName))
        cell.titleTextLb.text = model.name
        cell.layer.shouldRasterize = true;
        cell.layer.rasterizationScale = UIScreen.mainScreen().scale;
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        
        
        let bounds = UIScreen.mainScreen().bounds
        
        let size = CGSizeMake((bounds.size.width/3)-21, 250)
        return size
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let model:BuildingModel = project?.listBuilding.objectAtIndex(indexPath.row) as! BuildingModel
        model.listRoom = NSMutableArray()
        let model1:RoomModel = RoomModel()
        model1.name = "Room1"
        model1.status = "N"
        
        let model2:RoomModel = RoomModel()
        model2.name = "Room2"
        model2.status = "N"
        
        let model3:RoomModel = RoomModel()
        model3.name = "Room3"
        model3.status = "N"
        
        let model4:RoomModel = RoomModel()
        model4.name = "Room4"
        model4.status = "Y"
        
        let model5:RoomModel = RoomModel()
        model5.name = "Room5"
        model5.status = "N"
        model.listRoom.addObject(model1)
        model.listRoom.addObject(model2)
        model.listRoom.addObject(model3)
        model.listRoom.addObject(model4)
        model.listRoom.addObject(model5)
        
        let controller:SplitViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SplitViewController") as! SplitViewController
        let controllers:NSArray = controller.viewControllers
        for controller in controllers {
            if controller.isKindOfClass(NavRoomsViewController) {
                
                let navControllers:NSArray = (controller as! NavRoomsViewController).viewControllers
                
                (navControllers[0] as! RoomMenuViewController).project = self.project
                (navControllers[0] as! RoomMenuViewController).building = model
            }else if(controller.isKindOfClass(NavDefectViewController)){
                
                let navControllers:NSArray = (controller as! NavDefectViewController).viewControllers
                
                (navControllers[0] as! DefectMainViewController).project = self.project
                (navControllers[0] as! DefectMainViewController).building = model
                (navControllers[0] as! DefectMainViewController).room = model.listRoom.objectAtIndex(0) as? RoomModel
            }
        }
        self.presentViewController(controller, animated: true) {
            
            
            
        }
        
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        self.buildingCollectionView?.reloadData()
        
    }
    
    @IBAction func backAction(sender: AnyObject) {
        
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
