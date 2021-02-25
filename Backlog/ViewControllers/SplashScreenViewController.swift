//
//  SplashScreenViewController.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/9/21.
//

import Foundation
import UIKit
import Firebase

class SplashScreenViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    var user = UserModel()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            self.user.uid = user?.uid
            self.user.email = user?.email
            self.user.displayName = user?.displayName
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if user.uid == nil {
            login()
        } else {
            home()
        }

    }
    
    func login() {
        let loadLoginViewController = LoginViewController()
        loadLoginViewController.modalPresentationStyle = .fullScreen
        self.present(loadLoginViewController, animated: true, completion: nil)
    }
    
    func home() {
        let mainViewController = MainViewController(user: user)
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: true, completion: nil)
    }
}
