//
//  SearchViewController.swift
//  YGN_Tuitions
//
//  Created by Timmy Tseng on 7/1/18.
//  Copyright © 2018 Timmy Tseng. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
sideMenus()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideMenus() {
        
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 0 //160
            
            
            //alertButton.target = revealViewController()
            //alertButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
