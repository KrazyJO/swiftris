//
//  Array2D.swift
//  Swiftris
//
//  Created by Jörn Otte on 01.10.18.
//  Copyright © 2018 Jörn Otte. All rights reserved.
//

class Array2D<T> {
    let columns : Int;
    let rows : Int;
    
    var array : Array<T?>
    
    init(columns : Int, rows : Int) {
        self.columns = columns
        self.rows = rows
        
        array = Array<T?>(repeating: nil, count: columns * rows)
    }
    
    subscript(column : Int, row : Int) -> T? {
        get {
            return array[(row * columns) + column]
        }
        
        set(newValue) {
            array[(row * columns)+column] = newValue
        }
    }
}
