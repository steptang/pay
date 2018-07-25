//
//  CreateAccountViewController.swift
//  Pay
//
//  Created by Stephanie Tang on 4/27/17.
//  Copyright © 2017 Stephanie Tang. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        ref = FIRDatabase.database().reference(withPath: "users")
        // Do any additional setup after loading the view.
        
        ref.observe(.value, with: { snapshot in
            UserDatabase.clearUsers()
            
            for item in snapshot.children {
                let newUser = User(snapshot: item as! FIRDataSnapshot)
                UserDatabase.addUser(User: newUser)
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var ref : FIRDatabaseReference!
    var newUser: User!
    
    @IBOutlet var nameTextField: UITextField!

    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var phoneNumberTextField: UITextField!
    
    @IBOutlet var userNameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    func showAlert() {
        let alert = UIAlertController(title: "Oops", message: "Invalid Account. Some field(s) empty.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showPhoneAlert() {
        let alert = UIAlertController(title: "Oops", message: "Invalid. This phone number has already been registered.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showEmailAlert() {
        let alert = UIAlertController(title: "Oops", message: "Invalid. This email has already been registered.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showUsernameAlert() {
        let alert = UIAlertController(title: "Oops", message: "Invalid. This username has already been registered.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "createAccountToStartScanning" {
             if(userNameTextField.text == "" || nameTextField.text == "" || emailTextField.text == "" || phoneNumberTextField.text == "" || passwordTextField.text == "") {
                showAlert()
                return false
             }else if(UserDatabase.containsEmail(email: emailTextField.text!)){
                showEmailAlert()
                return false
             }else if(UserDatabase.containsUsername(username: userNameTextField.text!)){
                showUsernameAlert()
                return false
             }else if(UserDatabase.containsPhone(phone: Int(phoneNumberTextField.text!)!)){
                showPhoneAlert()
                return false
             }else{
                return true
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createAccountToStartScanning"{
            newUser = User(username: userNameTextField.text!, name: nameTextField.text!, email: emailTextField.text!, phoneNumber: Int(phoneNumberTextField.text!)!, password: passwordTextField.text!)
            UserDatabase.addUser(User: newUser)
            if let addUser = newUser {
                let userRef = self.ref.child(addUser.username!)
                userRef.setValue(addUser.toAnyObject())
            }
            CurrUser.setCurrUser(user: newUser)
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
    @IBAction func keyboardShow1(_ sender: Any) {
        showKeyboard()
    }
    @IBAction func keyboardShow2(_ sender: Any) {
        showKeyboard()
    }
    @IBAction func keyboardShow3(_ sender: Any) {
        showKeyboard()
    }
    @IBAction func keyboardShow4(_ sender: Any) {
        showKeyboard()
    }
    @IBAction func keyboardShow5(_ sender: Any) {
        showKeyboard2()
    }
    
    
    
    func showKeyboard() {
        self.view.frame.origin.y = -100
    }
    
    func showKeyboard2() {
        self.view.frame.origin.y = -120
    }

}
