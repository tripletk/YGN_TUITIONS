//
//  ViewController.swift
//  YGN_Tuitions
//
//  Created by Timmy Tseng on 6/30/18.
//  Copyright © 2018 Timmy Tseng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        sideMenus()
        //customizeNavBar()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func imageResize() {
//        if
//    }
    
    func sideMenus() {
        
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 0 //160
            //UINavigationItem.
            
            
            //alertButton.target = revealViewController()
            //alertButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
//    func customizeNavBar() {
//
//
//        navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 132.0, green: 112.0, blue: 255.0, alpha: 1.0)
//        navigationController?.navigationBar.barTintColor = UIColor(red: 132, green: 112, blue: 255, alpha: 1)
//
//        navigationController?.navigationBar.titleTextAttributes = [kCTForegroundColorAttributeName: UIColor.blue] as [NSAttributedStringKey : Any]
//
//
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
