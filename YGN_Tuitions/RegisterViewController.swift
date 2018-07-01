//
//  RegisterViewController.swift
//  YGN_Tuitions
//
//  Created by Timmy Tseng on 6/30/18.
//  Copyright © 2018 Timmy Tseng. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var usenameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var townshipField: UITextField!
    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var teacherStatusField: UISwitch!
    
    
    @IBAction func onSlide(_ sender: Any) {
        if teacherStatusField.isOn {
            townshipField.isUserInteractionEnabled = true
            subjectField.isUserInteractionEnabled = true
        } else {
            townshipField.isUserInteractionEnabled = false
            subjectField.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func onRegisterPressed(_ sender: Any) {
        let status = serverRegister(username: usenameField.text!, password: passwordField.text!, email: emailField.text!, isTeacher: teacherStatusField.isOn, township: townshipField.text!, subject: subjectField.text!)
        if !status {
            print("failed!")
        } else {
            print("success!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
