//
//  SignInViewController.swift
//  Pay
//
//  Created by Stephanie Tang on 4/27/17.
//  Copyright © 2017 Stephanie Tang. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    var ref : FIRDatabaseReference!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()

        // Do any additional setup after loading the view.
        ref = FIRDatabase.database().reference(withPath: "users")
        // Do any additional setup after loading the view.
        
        ref.observe(.value, with: { snapshot in
            UserDatabase.clearUsers()
            
            for item in snapshot.children {
                let newUser = User(snapshot: item as! FIRDataSnapshot)
                UserDatabase.addUser(User: newUser)
            }
            
        })
        print(self.view.frame.origin.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showAlert() {
        let alert = UIAlertController(title: "Oops", message: "Invalid. This username is not registered yet.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showInvalidAlert() {
        let alert = UIAlertController(title: "Oops", message: "Invalid. Username and password may not be empty fields.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showPasswordAlert() {
        let alert = UIAlertController(title: "Oops", message: "Invalid Password for Username.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "signInToStartScanning" {
            if(usernameTextField.text == "" || passwordTextField.text == "") {
                showInvalidAlert()
                return false
            }else if(!UserDatabase.containsUsername(username: usernameTextField.text!)){
                showAlert()
                return false
            }else if(UserDatabase.getUserFromUsername(username: usernameTextField.text!).password != passwordTextField.text){
                showPasswordAlert()
                return false
            }else{
                return true
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signInToStartScanning"{
            CurrUser.setCurrUser(user: UserDatabase.getUserFromUsername(username: usernameTextField.text!))
        }
    }
    
    @IBAction func signOutSegue(segue: UIStoryboardSegue){
        CurrUser.clearCurrUser()
    }

    @IBAction func keyboardWillShow(_ sender: Any) {
        showKeyboard()
    }
    
    @IBAction func keyboardShows(_ sender: Any) {
        showKeyboard2()
    }
    
    func showKeyboard() {
        self.view.frame.origin.y = -100
    }
    
    func showKeyboard2() {
        self.view.frame.origin.y = -100
    }
    
}
