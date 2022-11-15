//
//  StoryboardInstantiator.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import Foundation
import UIKit

/// Create `Viewcontroller` from a storyboard
protocol Storyboarded {
    static func instantiate(with storyBoard: Constants.Storyboard) -> Self?
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(with storyBoard: Constants.Storyboard) -> Self? {
        let className = String(describing: Self.self)

        // load our storyboard
        let storyboard = UIStoryboard(name: storyBoard.rawValue, bundle: Bundle.main)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as? Self
    }
}
