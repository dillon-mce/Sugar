//
//  UIImage+Helpers.swift
//  
//
//  Created by Dillon McElhinney on 5/9/21.
//

import UIKit

public extension UIImage {

    convenience init?(named name: String?) {
        guard let name = name else { return nil }
        self.init(named: name)
    }
    
}
