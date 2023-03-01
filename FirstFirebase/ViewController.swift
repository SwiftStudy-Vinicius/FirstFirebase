//
//  ViewController.swift
//  FirstFirebase
//
//  Created by Vinícius Flores Ribeiro on 09/02/23.
//

import UIKit
import Firebase

class ViewController: UIViewController, Coordinating {

    var coordinator: Coordinator?

    var auth: Auth?

    var enterEmail = UITextField()
    var enterPassword = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Login"
        navigationItem.hidesBackButton = true

        self.auth = Auth.auth()

        let email = UILabel()
        view.addSubview(email)
        email.text = "Email"
        email.frame = CGRect(x: view.safeAreaInsets.left + 16, y: view.safeAreaInsets.top + 128, width: 120, height: 32)

        view.addSubview(enterEmail)
        enterEmail.placeholder = "Digite o seu email"
        enterEmail.borderStyle = .roundedRect
        enterEmail.frame = CGRect(x: view.safeAreaInsets.left + 16, y: email.frame.maxY + 8, width: 300, height: 32)

        let password = UILabel()
        view.addSubview(password)
        password.text = "Senha"
        password.frame = CGRect(x: view.safeAreaInsets.left + 16, y: enterEmail.frame.maxY + 8, width: 120, height: 32)

        view.addSubview(enterPassword)
        enterPassword.placeholder = "Digite a senha"
        enterPassword.borderStyle = .roundedRect
        enterPassword.frame = CGRect(x: view.safeAreaInsets.left + 16, y: password.frame.maxY + 8, width: 300, height: 32)

        let loginButton = UIButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: view.safeAreaInsets.left + 16, y: enterPassword.frame.maxY + 16, width: 300, height: 32)
        loginButton.backgroundColor = .blue
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)

        let registerButton = UIButton()
        view.addSubview(registerButton)
        registerButton.frame = CGRect(x: view.safeAreaInsets.left + 16, y: loginButton.frame.maxY + 16, width: 300, height: 32)
        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.setTitleColor(.blue, for: .normal)
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)


//        let sheetViewButton = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
//        view.addSubview(sheetViewButton)
//        sheetViewButton.center = view.center
//        sheetViewButton.backgroundColor = .systemGreen
//        sheetViewButton.setTitleColor(.white, for: .normal)
//        sheetViewButton.setTitle("Open Modal", for: .normal)
//        sheetViewButton.addTarget(self, action: #selector(tapOpenSheetView), for: .touchUpInside)
//
//        let navigationViewButton = UIButton(frame: CGRect(x: sheetViewButton.frame.minX, y: sheetViewButton.frame.maxY + 32, width: 220, height: 55))
//        view.addSubview(navigationViewButton)
//        navigationViewButton.backgroundColor = .systemGreen
//        navigationViewButton.setTitleColor(.white, for: .normal)
//        navigationViewButton.setTitle("Open Navigation", for: .normal)
//        navigationViewButton.addTarget(self, action: #selector(tapOepnNavigationView), for: .touchUpInside)
    }

    func alert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(cancel)
        self.present(alertController, animated: true)
    }

    @objc func didTapLogin() {
        let email: String = self.enterEmail.text ?? ""
        let password: String = self.enterPassword.text ?? ""
        self.auth?.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.alert(title: "Error", message: "Wrong user or password")
            } else {
                if result == nil {
                    self.alert(title: "Error", message: "User is nil")
                } else {
                    //self.alert(title: "Success", message: "Success Login")
                    self.coordinator?.eventOccurred(with: .successLogin)
                }
            }
        }
    }

    @objc func didTapRegister() {
        coordinator?.eventOccurred(with: .openNavigationView)
    }

    @objc func tapOpenSheetView() {
        coordinator?.eventOccurred(with: .openSheetView)
    }

    @objc func tapOepnNavigationView() {
        coordinator?.eventOccurred(with: .openNavigationView)
    }

}

