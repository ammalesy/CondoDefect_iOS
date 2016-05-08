//
//  AddDefectViewController.swift
//  CondoDefect
//
//  Created by Apple on 5/8/16.
//  Copyright © 2016 Nuizoro. All rights reserved.
//

import UIKit
import MobileCoreServices
import NYTPhotoViewer

class AddDefectViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,NYTPhotosViewControllerDelegate {

    @IBOutlet weak var roomKindLb: UILabel!
    @IBOutlet weak var directionLb: UILabel!
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cameraImageView: UIImageView!
    var selectedCategory:Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        
        let arrayCat:NSMutableArray = CategoryManager.getDummyCategory()
        selectedCategory = arrayCat.objectAtIndex(0) as! Category
        
        self.categoryBtn.setTitle(selectedCategory.name, forState: UIControlState.Normal)
        self.configNavBarButton()
    }
    func configNavBarButton() {
        
        self.navigationController!.navigationBar.tintColor = UIColor(red: 35.0/255.0, green: 103.0/255.0, blue: 174.0/255.0, alpha: 1)
        
        let rightBtn:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: #selector(AddDefectViewController.doneAction))
        self.navigationItem.rightBarButtonItem = rightBtn
        
    
    }
    func configTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.contentInset = UIEdgeInsetsMake(-1.0, 0.0, 0.0, 0.0);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showCameraAction(sender: AnyObject) {
        
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.Camera) {
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType =
                UIImagePickerControllerSourceType.Camera
            imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
            imagePicker.allowsEditing = false
            
            self.splitViewController?.presentViewController(imagePicker, animated: true, completion: { 
                
            })
        }
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == (kUTTypeImage as String) {
            let image = info[UIImagePickerControllerOriginalImage]
                as! UIImage
            
            cameraImageView.image = image
            
        }
        
        picker.dismissViewControllerAnimated(true) { 
            
        }
        
    }

    @IBAction func selectCategoryAction(sender: AnyObject) {
        
        //self.addCategory()
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "POPOVER" {

            let destinationNav:NavCategoryViewController =  segue.destinationViewController as! NavCategoryViewController
            let catController:CategoryViewController = destinationNav.viewControllers[0] as! CategoryViewController
            catController.refController = self
            
            
        }
        
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCategory.listSubCategory.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model:SubCategory = selectedCategory.listSubCategory.objectAtIndex(indexPath.row) as! SubCategory
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel?.text = model.name
        if model.selected == true {
            cell.imageView?.image = UIImage(named: "checked")
        }else{
            cell.imageView?.image = UIImage(named: "uncheck")
        }
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let model:SubCategory = selectedCategory.listSubCategory.objectAtIndex(indexPath.row) as! SubCategory
        model.selected = !model.selected
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
 
    }
    @IBAction func openFullImage(sender: AnyObject) {
        let title = NSAttributedString(string: "", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        let summary = NSAttributedString(string: "" , attributes: [NSForegroundColorAttributeName: UIColor.grayColor()])
        let photo:NZPhoto = NZPhoto(image: cameraImageView.image, attributedCaptionTitle: title, attributedCaptionSummary: summary)
        
        let photosViewController = NYTPhotosViewController(photos: [photo])
        photosViewController.delegate = self
        self.splitViewController!.presentViewController(photosViewController, animated: true, completion: nil)
        
        UIApplication.sharedApplication().statusBarHidden = true
    }
    func photosViewControllerWillDismiss(photosViewController: NYTPhotosViewController) {
        
        UIApplication.sharedApplication().statusBarHidden = false
        
    }
    func doneAction() {
        
        self.navigationController?.popViewControllerAnimated(true)
    
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
