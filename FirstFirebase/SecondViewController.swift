//
//  SecondViewController.swift
//  FirstFirebase
//
//  Created by Vinícius Flores Ribeiro on 09/02/23.
//

import UIKit
import Firebase

class SecondViewController: UIViewController, Coordinating {

    var coordinator: Coordinator?

    var auth: Auth?

    var enterEmail = UITextField()
    var enterPassword = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Register"

        auth = Auth.auth()

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
        loginButton.setTitle("Cadastrar", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)

        let registerButton = UIButton()
        view.addSubview(registerButton)
        registerButton.frame = CGRect(x: view.safeAreaInsets.left + 16, y: loginButton.frame.maxY + 16, width: 300, height: 32)
        registerButton.setTitle("Voltar", for: .normal)
        registerButton.setTitleColor(.blue, for: .normal)
        registerButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
    }

    @objc func didTapLogin() {

    }

    @objc func didTapRegister() {
        let email: String = self.enterEmail.text ?? ""
        let password: String = self.enterPassword.text ?? ""
        self.auth?.createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print("Register erro: \(error)")
            } else {
                print("Success register: \(result?.user)")
            }

        }
    }
}
