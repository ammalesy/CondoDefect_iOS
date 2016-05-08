//
//  LoginViewController.swift
//  CondoDefect
//
//  Created by Apple on 5/6/16.
//  Copyright © 2016 Nuizoro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var containerUsernameTxtView: UIView!
    @IBOutlet weak var containerPasswordTxtView: UIView!
    @IBOutlet weak var iconUsernameImgView: UIImageView!
    @IBOutlet weak var iconPasswordImgView: UIImageView!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialLayoutView()
    }
    
    func initialLayoutView() {
    
        self.cornerRadiusOnView(self.containerUsernameTxtView, value: 5.0)
        self.cornerRadiusOnView(self.containerPasswordTxtView, value: 5.0)
        self.cornerRadiusOnView(self.signInBtn, value: 5.0)
        
    }
    
    func cornerRadiusOnView(view: UIView, value: CGFloat){
        
        view.layer.cornerRadius = value
        view.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInAction(sender: AnyObject) {
        
        
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
