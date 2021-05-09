//
//  UIView+Helpers.swift
//  
//
//  Created by Dillon McElhinney on 5/9/21.
//

import UIKit

public extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { view in addSubview(view) }
    }

}
