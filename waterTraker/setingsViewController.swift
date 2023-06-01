//
//  setingsViewController.swift
//  waterTraker
//
//  Created by sebashtian rodriguez on 4/6/23.
//

import UIKit



class setingsViewController: UIViewController {

    @IBOutlet weak var theSaveWeght: UILabel!
    
    
    @IBOutlet weak var WeghtInsirt: UITextField!
    
    
    
    @IBOutlet weak var theWaterNeedTODrink: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        theSaveWeght.text = "\(yourweght)LB"
        theWaterNeedTODrink.text = "\(waterWeght) OZ"
    }
    
    
    
    
    
    @IBAction func WOne(_ sender: Any) {
        
        if let a = Double(WeghtInsirt.text!){
            theSaveWeght.text = "\(a) LB"

            
        }else{
            theSaveWeght.text = "enter a number plz"
        }
        
        let w = (Double(WeghtInsirt.text!) ?? 0) * 0.5
        theWaterNeedTODrink.text = "\(w)OZ of water"
        
        
        waterWeght = w
        
        print("hi")
        
        print("\(waterWeght)2")
        
    }
    
}
