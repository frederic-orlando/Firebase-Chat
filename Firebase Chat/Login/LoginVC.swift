//
//  LoginVC.swift
//  Firebase Chat
//
//  Created by Frederic Orlando on 16/06/20.
//  Copyright © 2020 Frederic Orlando. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}

extension LoginVC: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                print("Login Success")
//
//                let user: User = Auth.auth().currentUser!
//                let fullName = user.displayName!
//                let uid = user.uid
//                let picture = user.photoURL!
//
//                print("Name : ", fullName)
//                print("UID : ", uid)
//                print("Photo : ", picture)
                
                let storyboard = UIStoryboard(name: "Chat", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "ChatVC") as! UINavigationController
                let appDelegate = UIApplication.shared.windows
                appDelegate.first?.rootViewController = vc
                
//                let storyboard = UIStoryboard(name: "Chat", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
//                self.navigationController?.pushViewController(vc, animated: true)
//                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}
