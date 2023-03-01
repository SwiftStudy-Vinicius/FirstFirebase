//
//  Coordinator.swift
//  FirstFirebase
//
//  Created by Vinícius Flores Ribeiro on 09/02/23.
//

import Foundation
import UIKit

enum Event {
    case openSheetView
    case openNavigationView
    case successLogin
    case goToLogin
}

protocol Coordinator {

    var navigationController: UINavigationController? { get set }

    var children: [Coordinator]? { get set }

    func eventOccurred(with type: Event)

    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
