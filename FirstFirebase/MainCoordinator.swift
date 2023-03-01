//
//  MainCoordinator.swift
//  FirstFirebase
//
//  Created by Vinícius Flores Ribeiro on 09/02/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?

    var children: [Coordinator]? = nil

    func eventOccurred(with type: Event) {
        var vc: UIViewController & Coordinating = SecondViewController()
        var initialVC: UIViewController & Coordinating = InitialViewController()
        switch type {
        case .openSheetView:
            vc.coordinator = self
            navigationController?.present(vc, animated: true)
        case .openNavigationView:
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        case .successLogin:
            initialVC.coordinator = self
            navigationController?.pushViewController(initialVC, animated: true)
        case .goToLogin:
            var loginVC: UIViewController & Coordinating = ViewController()
            loginVC.coordinator = self
            navigationController?.pushViewController(loginVC, animated: true)
        }
    }

    func start() {
        var vc: UIViewController & Coordinating = ViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
