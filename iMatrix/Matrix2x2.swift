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
    @IBOutlet weak var determinanteButton: UIButton!
    @IBOutlet weak var inversaButton: UIButton!
    @IBOutlet weak var adjButton: UIButton!
    @IBOutlet weak var traspostsButton: UIButton!
    @IBOutlet weak var rangoButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
   
   
    var arrayValoriVecchi = [[String]]()
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
        
        creoLayout()
        
    }
    
    func creoLayout()
    {
        
        // cella unoUno
        self.unoUno.translatesAutoresizingMaskIntoConstraints = false
        self.unoUno.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: self.view.frame.height/14).isActive = true
        self.unoUno.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/6).isActive = true
        self.unoUno.heightAnchor.constraint(equalToConstant: self.view.frame.height/7).isActive = true
        self.unoUno.widthAnchor.constraint(equalToConstant: self.view.frame.height/7).isActive = true
        
        // cella unoDue
        self.unoDue.translatesAutoresizingMaskIntoConstraints = false
        self.unoDue.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -self.view.frame.height/14).isActive = true
        self.unoDue.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/6).isActive = true
        self.unoDue.heightAnchor.constraint(equalToConstant: self.view.frame.height/7).isActive = true
        self.unoDue.widthAnchor.constraint(equalToConstant: self.view.frame.height/7).isActive = true
        
        // cella dueUno
        self.dueUno.translatesAutoresizingMaskIntoConstraints = false
        self.dueUno.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: self.view.frame.height/14).isActive = true
        self.dueUno.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/2.5).isActive = true
        self.dueUno.heightAnchor.constraint(equalToConstant: self.view.frame.height/7).isActive = true
        self.dueUno.widthAnchor.constraint(equalToConstant: self.view.frame.height/7).isActive = true
        
        // cella dieDue
        self.dueDue.translatesAutoresizingMaskIntoConstraints = false
        self.dueDue.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -self.view.frame.height/14).isActive = true
        self.dueDue.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/2.5).isActive = true
        self.dueDue.heightAnchor.constraint(equalToConstant: self.view.frame.height/7).isActive = true
        self.dueDue.widthAnchor.constraint(equalToConstant: self.view.frame.height/7).isActive = true
        
        // tasto determinante
        


    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressDeterminante(_ sender: Any)
    {
        determinante2x2(view: self, arrayUITextFields: arrayUITextFields)
        
    }
    
    func salvoValoriVecchi()
    {
        let vecchi =  [arrayUITextFields[0].text!,arrayUITextFields[1].text!,arrayUITextFields[2].text!,arrayUITextFields[3].text!]
    
        arrayValoriVecchi.append(vecchi)
    
    }
    
    // controllo che i caratteri inseriti siano proprio quelli inseriti nel range ossia numeri
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     
        
        return textField.controlloCella(stringaPassata: string, stringaTotale: textField.text!)
    }
    
   
    
    @IBAction func pressInversa(_ sender: UIButton)
    {
        // salvo i valori vecchi
        salvoValoriVecchi()
        // matto la matrice in questo verso: [1,2,3,4,5,6]
        var array = [Double]()
        for i in arrayUITextFields
        {
            // provo a convertirla in double
            guard let dou = Double(i.text!) else {
                return
            }
                
            array.append(dou)
            
        }
        
        // chiamo la funzione inversa con l'array creato cosi 
        let matriceInvertitaDouble = invert(matrix: array)
        
        // faccio si che ogni elemento ritornato abbia solo 3 carattteri seno eccede dalla cella
        var matriceInversaString = [String]()
        
        // riempio la matrice inversaStringa
        for i in matriceInvertitaDouble
        {
            matriceInversaString.append("\(i)")
        }
        
        matriceInversaString = solo3Caratteri(array: matriceInversaString)
        
        // riempio le celle col testo corretto
        for i in 0..<arrayUITextFields.count
        {
            arrayUITextFields[i].text = matriceInversaString[i]
        
        }
        
       
        
    }
    
    @IBAction func pressAdj(_ sender: Any)
    {
        // salvo i valori
        salvoValoriVecchi()
        // controllo che tutti abbiano il testo
        if !controlloValoreInseritoTUTTI() {
            myAlert(titolo: "Error", messaggio: "Insert numbers", sel: self)
            return
        }
        // prendo il
        guard let unoUno = Double(arrayUITextFields[0].text!) else
        {
            return
        }
        
        guard let unoDue = Double(arrayUITextFields[1].text!) else
        {
            return
        }
        guard let dueUno = Double(arrayUITextFields[2].text!) else
        {
            return
        }
        guard let dueDue = Double(arrayUITextFields[3].text!) else
        {
            return
        }
        
        arrayUITextFields[0].text = "\(dueDue)"
        arrayUITextFields[1].text = "\(-dueUno)"
        arrayUITextFields[2].text = "\(-unoDue)"
        arrayUITextFields[3].text = "\(unoUno)"
        
        
    }
    
  
    @IBAction func pressTrasposta(_ sender: Any)
    {
        // salvo i valori
        salvoValoriVecchi()
        // inverto direttamente gli elementi, salvo ogni elemento
        let unoDue = arrayUITextFields[1].text
        let dueUno = arrayUITextFields[2].text
        
        // inverto
        arrayUITextFields[1].text = dueUno
        arrayUITextFields[2].text = unoDue
        
        
    }

    @IBAction func pressRango(_ sender: Any)
    {
        // inserisco tutti i valori in variabili cosi faccio prima
       // calcolo il determinante 2x2
        // controllo che tutti abbiano il testo
        if !controlloValoreInseritoTUTTI() {
            myAlert(titolo: "Error", messaggio: "Insert numbers", sel: self)
            return
        }
        // prendo il
        guard let unoUno = Double(arrayUITextFields[0].text!) else
        {
            return
        }
        
        guard let unoDue = Double(arrayUITextFields[1].text!) else
        {
            return
        }
        guard let dueUno = Double(arrayUITextFields[2].text!) else
        {
            return
        }
        guard let dueDue = Double(arrayUITextFields[3].text!) else
        {
            return
        }
        
        var determinante = (unoUno * dueDue) - ( unoDue * dueUno )
        if determinante == 0
        {
            // guardo de ho almeno un elemento non nullo
            if unoUno==0 && unoDue == 0 && dueUno == 0 && dueDue == 0
            {
                determinante = 0
                myAlert(titolo: "Determinant:", messaggio: "0", sel: self)
            }
            else
            {
                myAlert(titolo: "Determinant:", messaggio: "1", sel: self)
            }
        }
        else
        {
            myAlert(titolo: "Determinant:", messaggio: "2", sel: self)
        }
        
        
    }
    
    @IBAction func pressReturn(_ sender: Any)
    {
        if arrayValoriVecchi.count > 0
        {
        let valori = arrayValoriVecchi.removeLast()
        arrayUITextFields[0].text = valori[0]
        arrayUITextFields[1].text = valori[1]
        arrayUITextFields[2].text = valori[2]
        arrayUITextFields[3].text = valori[0]
        }
        
        
    }
    
    func controlloValoreInseritoTUTTI () -> Bool
    {
        var booleano = false
        for i in arrayUITextFields
        {
            booleano = i.controlloCella(stringaPassata: "", stringaTotale: i.text!)
                
            
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
