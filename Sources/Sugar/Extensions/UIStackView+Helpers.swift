//
//  UIStackView+Helpers.swift
//  
//
//  Created by Dillon McElhinney on 5/9/21.
//

import UIKit

public extension UIStackView {

    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { view in addArrangedSubview(view) }
    }
    
}
