//
//  ProjectViewController.swift
//  CondoDefect
//
//  Created by Apple on 5/6/16.
//  Copyright © 2016 Nuizoro. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var projectCollectionView: UICollectionView!
    
    var listProject:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listProject = NSMutableArray()
        
        let model1 = ProjectModel()
        model1.name = "Sansiri"
        model1.imageName = "11.jpg"
        
        let model2 = ProjectModel()
        model2.name = "Lumpini"
        model2.imageName = "22.jpg"
        
        let model3 = ProjectModel()
        model3.name = "KPN"
        model3.imageName = "33.jpg"
        
        let model4 = ProjectModel()
        model4.name = "The Condo"
        model4.imageName = "44.jpg"
        
        listProject.addObject(model1)
        listProject.addObject(model2)
        listProject.addObject(model3)
        listProject.addObject(model4)
        
        self.projectCollectionView.dataSource = self
        self.projectCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return listProject.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let model:ProjectModel = listProject.objectAtIndex(indexPath.row) as! ProjectModel
        let cell:ProjectCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ProjectCollectionViewCell
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        self.projectCollectionView?.reloadData()
        
    }
    
    @IBAction func logoutAction(sender: AnyObject) {
        
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
