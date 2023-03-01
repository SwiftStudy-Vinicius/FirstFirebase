//
//  InitialViewController.swift
//  FirstFirebase
//
//  Created by Vinícius Flores Ribeiro on 09/02/23.
//

import UIKit
import Firebase

class InitialViewController: UIViewController, Coordinating {

    var coordinator: Coordinator?

    var auth: Auth?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        let userName: String = Auth.auth().currentUser?.email ?? ""

        let userEmail = UILabel()
        view.addSubview(userEmail)
        userEmail.text = userName
        userEmail.frame = CGRect(x: 16, y: view.frame.midY, width: 300, height: 32)
        

        let logout = UIButton()
        view.addSubview(logout)
        logout.frame = CGRect(x: 0, y: view.frame.maxY - 32, width: 300, height: 32)
        logout.center = view.center
        logout.setTitle("Logout", for: .normal)
        logout.setTitleColor(.blue, for: .normal)
        logout.addTarget(self, action: #selector(didtapLogout), for: .touchUpInside)
    }

    @objc func didtapLogout() {

        do {
            try self.auth?.signOut()
            coordinator?.eventOccurred(with: .goToLogin)
        } catch {
            print("already logged out")
        }
        print("SIGNOUT: \(auth?.currentUser?.email)")
    }

}
