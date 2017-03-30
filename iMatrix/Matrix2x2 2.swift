//
//  Matrix2x2.swift
//  iMatrix
//
//  Created by Giulio Tavella on 02/02/17.
//  Copyright © 2017 Giulio Tavella. All rights reserved.
//

import UIKit

class Matrix2x2: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var unoUno: UITextField!
    @IBOutlet weak var unoDue: UITextField!
    @IBOutlet weak var dueUno: UITextField!
    @IBOutlet weak var dueDue: UITextField!
   
   
    
    var arrayUITextFields : [UITextField] = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // riempio l'array
        arrayUITextFields.append(unoUno)
        arrayUITextFields.append(unoDue)
        arrayUITextFields.append(dueUno)
        arrayUITextFields.append(dueDue)
        
        for i in arrayUITextFields
        {
            i.delegate = self
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressDeterminante(_ sender: Any)
    {
        // controllo che tutti abbiano il testo
        if !controlloValoreInseritoTUTTI() {
            myAlert(titolo: "Error", messaggio: "Insert numbers", sel: self)
            return
        }
        // prendo il 
        let unoUno = Int(self.unoUno.text!)
        let unoDue = Int(self.unoDue.text!)
        let dueUno = Int(self.dueUno.text!)
        let dueDue = Int(self.dueDue.text!)
        
        var determinante = (unoUno! * dueDue!) - ( unoDue! * dueUno! )
        
        if determinante == 0
        {
            if unoUno==0 && unoDue == 0 && dueUno == 0 && dueDue == 0
            {
                determinante = 0
            }
            else
            {
                determinante = 1
            }
            
        }
        myAlert(titolo: "Determinant", messaggio: "\(determinante)", sel: self)
        
    }
    
   
    
    @IBAction func pressInversa(_ sender: UIButton)
    {
        
    }
    
    @IBAction func pressAdj(_ sender: Any)
    {
        
    }
    
  
    @IBAction func pressTrasposta(_ sender: Any)
    {
        
    }

    @IBAction func pressRango(_ sender: Any)
    {
        
    }
    
    @IBAction func pressReturn(_ sender: Any)
    {
        
    }
    
    func controlloValoreInseritoTUTTI () -> Bool
    {
        var booleano = false
        for i in arrayUITextFields
        {
            if controlloValoreInserito(string: i.text!)
            {
                booleano = true
            }
        }
        return booleano
    }
    
    // tutte le textfield nel momento in cui premo invio si toglie la tastiera
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // quando premo ovunque sullo schermo va via la tastiera
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
}
