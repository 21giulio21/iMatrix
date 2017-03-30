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

extension UITextField
{
    func controlloCella(stringaPassata string: String,stringaTotale stringTot : String)->Bool
    {
    
        if string == ""
        {
            return true
        }
        else
        {
            let c = CharacterSet(charactersIn: "-1234567890.")
            if (((string.rangeOfCharacter(from: c)) != nil) && stringTot.characters.count < 5 )
            {              
                    return true

            }else
            {
                return false
            }
        }
    }
}


func myAlert(titolo : String, messaggio: String, sel : UIViewController)
{
    let alert = UIAlertController(title: titolo, message: messaggio, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancell", style: .cancel, handler: nil))
    sel.present(alert, animated: true)

}

func determinante2x2 (view: Matrix2x2, arrayUITextFields: [UITextField] )
{
    var determinante: Double?
    // controllo che tutti abbiano il testo
    if !view.controlloValoreInseritoTUTTI() {
        myAlert(titolo: "Error", messaggio: "Insert numbers", sel: view)
        return
    }
    // prendo il
    if let unoUno = Double(arrayUITextFields[0].text!), let unoDue = Double(arrayUITextFields[1].text!),let dueUno = Double(arrayUITextFields[2].text!), let dueDue = Double(arrayUITextFields[3].text!)
    {
         determinante = (unoUno * dueDue) - ( unoDue * dueUno )
        
        if determinante == 0
        {
            if unoUno==0 && unoDue == 0 && dueUno == 0 && dueDue == 0
            {
                determinante = 0
            }
            
            
        }
    }
   
    if let det = determinante
    {
        myAlert(titolo: "Determinent", messaggio: "\(det)", sel: view)
    }
    
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



func solo3Caratteri(array:[String]) -> [String]
{

    var arrayRitorno = [String]()
    for i in array
    {
        
        let myNSString = i as NSString
        if myNSString.length >= 5
        {
            arrayRitorno.append(myNSString.substring(with: NSRange(location: 0, length: 5)))
        } else if myNSString.length == 4
        {
            arrayRitorno.append(myNSString.substring(with: NSRange(location: 0, length: 4)))
        } else if myNSString.length == 3
        {
            arrayRitorno.append(myNSString.substring(with: NSRange(location: 0, length: 3)))
        } else if myNSString.length == 2
        {
            arrayRitorno.append(myNSString.substring(with: NSRange(location: 0, length: 2)))
        }
        else if myNSString.length == 1
        {
            arrayRitorno.append(myNSString.substring(with: NSRange(location: 0, length: 1)))
        }
        else if myNSString.length == 0
        {
            arrayRitorno.append(myNSString.substring(with: NSRange(location: 0, length: 0)))
        }
        
        
    }
    return arrayRitorno


}



