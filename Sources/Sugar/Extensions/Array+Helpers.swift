//
//  Array+Helpers.swift
//  
//
//  Created by Dillon McElhinney on 6/13/22.
//

import Foundation

public extension Array {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
