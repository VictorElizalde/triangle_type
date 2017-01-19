//
//  ViewController.swift
//  Tarea 1
//
//  Created by Victor Elizalde on 1/16/17.
//  Copyright © 2017 Victor Elizalde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var dim1TF: UITextField!
    @IBOutlet weak var dim2TF: UITextField!
    @IBOutlet weak var dim3TF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var buttonValues: UIButton!
    @IBOutlet weak var toogleButton: UISwitch!

    
    @IBAction func typeAreaButton(_ sender: UIButton) {

        view.endEditing(true)
        
        let dim1 = Double(dim1TF.text!)
        let dim2 = Double(dim2TF.text!)
        let dim3 = Double(dim3TF.text!)
        
        if dim1 != nil && dim2 != nil && dim3 != nil {
            
            if toogleButton.isOn {
                
                if dim1 == dim2 && dim2 == dim3 {
                    
                    resultLabel.text = "Equilátero"
                    image.image = UIImage(named: "Equilatero")
                    
                } else if dim1 != dim2 && dim2 != dim3 && dim1 != dim3 {
                    
                    resultLabel.text = "Escaleno"
                    image.image = UIImage(named: "Escaleno")
                    
                } else {
                    
                    resultLabel.text = "Isóceles"
                    image.image = UIImage(named: "Isoceles")
                    
                }
                
            } else {
                
                let s = (dim1! + dim2! + dim3!) / 2
                let area = sqrt(s * (s - dim1!) * (s - dim2!) * (s - dim3!))
                
                if area == 0 {
                    
                    resultLabel.text = "Triángulo no posible"
                    
                } else {
                    
                    resultLabel.text = String(format:"%.2f", area)
                    
                }
            }
 
        } else {
            
            let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos", preferredStyle: .alert)
            
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alerta, animated: true, completion: nil)
            
        }
        
    }

    
    @IBAction func typeAreaSwitch(_ sender: UISwitch) {
        
        if toogleButton.isOn{
            
            buttonValues.setTitle("Tipo de Triángulo", for: [])
            image.isHidden = false
            resultLabel.text = ""
            
        } else{
            
            buttonValues.setTitle("Calcular área", for: [])
            image.image = nil
            image.isHidden = true
            resultLabel.text = ""
            
        }

    }
    
    @IBAction func awayKeyboard(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

