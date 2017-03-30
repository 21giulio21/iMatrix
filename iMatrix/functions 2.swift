//
//  functions.swift
//  iMatrix
//
//  Created by Giulio Tavella on 05/02/17.
//  Copyright © 2017 Giulio Tavella. All rights reserved.
//

import Foundation
import UIKit
import Accelerate


func controlloValoreInserito (string :String) -> Bool
{
    if string == "" {
        return false
    }
    let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
    return string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
}

func myAlert(titolo : String, messaggio: String, sel : UIViewController)
{
    let alert = UIAlertController(title: titolo, message: messaggio, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancell", style: .cancel, handler: nil))
    sel.present(alert, animated: true)

}

// vuole la matrice in questo ordine var matrix = [1,2,3,4]
func invert(matrix : [Double]) -> [Double] {
    var inMatrix:[Double]       = matrix
    // Get the dimensions of the matrix. An NxN matrix has N^2
    // elements, so sqrt( N^2 ) will return N, the dimension
    var N:__CLPK_integer        = __CLPK_integer( sqrt( Double( matrix.count ) ) )
    // Initialize some arrays for the dgetrf_(), and dgetri_() functions
    var pivots:[__CLPK_integer] = [__CLPK_integer](repeating: 0, count: Int(N))
    var workspace:[Double]      = [Double](repeating: 0.0, count: Int(N))
    var error: __CLPK_integer   = 0
    // Perform LU factorization
    dgetrf_(&N, &N, &inMatrix, &N, &pivots, &error)
    // Calculate inverse from LU factorization
    dgetri_(&N, &inMatrix, &N, &pivots, &workspace, &N, &error)
    return inMatrix
}

func determinant3X3 ( a : [[Double]]) -> Double
{
    var determinant: Double = 0;
    for i in 0..<3
    {
        let c = a[2][(i+2)%3]
        let h = a[1][(i+1)%3]
        let v = a[1][(i+2)%3]
        let x = a[2][(i+1)%3]
        let p = (h*c - v*x)
        determinant = determinant + Double((a[0][i]*p))
    }
   
    return determinant
}



