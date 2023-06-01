//
//  ViewController.swift
//  waterTraker
//
//  Created by sebashtian rodriguez on 3/30/23.

// persistent to save data
var waterWeght = 0.0
//it is the amount of water the ueser neds to drink
var needToDrinck = 0.0
// thes are found in bothe views
var yourweght = 0.0
// the weght of you

import UIKit

var waterSavedH = 0.0

var HowMuch = 0.0
 
var LB = 0.0

var lastDrank = 0.0

var callOut = true

class ViewController: UIViewController{
    //    this is he prgres view
    @IBOutlet weak var lodeWater: UIProgressView!
    //    it is the add water UITextFeld in the mid
    @IBOutlet weak var waterupdateText: UITextField!
    //    maby a tempry lable for on skreen debug
    @IBOutlet weak var quotesAndDebug: UILabel!
    
    //    display the water amount
    @IBOutlet weak var fullWaterAmunt: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setingsViewControll
    }
    override func viewDidAppear(_ animated: Bool) {
        //       the input alert func
        AlertDisclamer()
        
        print(lastDrank,"lastDrank")
        
    }
    
    @IBAction func waterUpdate(_ sender: UIButton) {
        print(waterWeght,"waterWeght")
        print(needToDrinck,"needToDrinck")
        //           LIGHN 52 of code is ware the text felds number is saved to send the data to other func
        //        NOTE try to make the lodeWater to display the amunt in the debug PS do it last!!!
        //         lighn 55  it will display the amount add
        //                  lighn 53  this is the progrs view and it will display the amount darank in a lighn
        //         58   it is jest incas the number is nout a  number
        //   65     howMuch is the full amount of the user water intake
        //   60  ths is dividing the hole by the aming givin and it will get a % PS make the code neeter
        //     66 AND 65   if the goal is reches ti will dispay the text
        quotesAndDebug.text = ""
        if let a = Double(waterupdateText.text!){
            print(a,"a")
            waterSavedH = Double(waterupdateText.text!) ?? 0
            print(waterSavedH,"water update in water saved waterSavedH")
            
            lastDrank = a
            print(lastDrank,"lastDrank")
            
            waterupdateText.text = ""
            
            //    quotesAndDebug.text = String(waterPerseng())
            lodeWater.progress += Float(Double(waterPerseng()))
            HowMuch += waterSavedH
            print("\(HowMuch) it shold add HowMuch")
            
            fullWaterAmunt.text = "\(HowMuch)"
        }else{
            quotesAndDebug.text = "enter a valid number"
        }
        
        func waterPerseng() -> Double{
            let p = waterSavedH / waterWeght
            print(p,"waterPerseng1")
            print(waterSavedH,"waterSavedH")
            print(waterWeght,"waterWeght")
            return Double(p)
        }
        if callOut == true && HowMuch >= waterWeght{
            print("goals good")
            callOut = false
            print(callOut,"callout false")
            alertOnCongrats()
            
        }
    }
    
    func alertOnCongrats(){
        let alertControlerTwo = UIAlertController(title: "Congrats on hiting your goal!", message: nil, preferredStyle: .alert)
        
        let confermAction = UIAlertAction(title: "continue", style: .default)
        
        alertControlerTwo.addAction(confermAction)
        self.present(alertControlerTwo, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func sixTeenOz(_ sender: UIButton) {
        lodeWater.progress += 0.16
        HowMuch += 16
        
        print(HowMuch,"from SixTeen Oz")
        fullWaterAmunt.text = "\(HowMuch)"
        lastDrank = 16
        
    }
    @IBAction func TenOz(_ sender: UIButton) {
        lodeWater.progress += 0.10
        HowMuch += 10
        print(HowMuch,"10 Oz")
        fullWaterAmunt.text = "\(HowMuch)"
        lastDrank = 10
        
    }
    
    @IBAction func FiveOz(_ sender: UIButton) {
        lodeWater.progress += 0.05
        HowMuch += 5
        print(HowMuch,"from 5Oz")
        fullWaterAmunt.text = "\(HowMuch)"
        lastDrank = 5
        
        
    }
    
    
    
    
    //    fixit ti jest remove the last saved prgres made
    @IBAction func resetTheprogrs(_ sender: UIButton) {
        lodeWater.progress -= Float(lastDrank * 0.01)
        HowMuch -= lastDrank
        fullWaterAmunt.text = "\(HowMuch)"
        lastDrank = 0
        print("reset Good")
        
        
    }
    //    this is a alert thing it is a test
    func showAlertWithTextField() {
        let alertController = UIAlertController(title: "Add your Weight", message: nil, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Update", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text{
                txtField.placeholder = "Enter Weight"
                print("Text==>" + text)
                let w = Double(txtField.text!) ?? 0
                print("text==>",w)
                let U = Double(w) * 0.5
                waterWeght = U
                print("need to drink")
                print(needToDrinck,waterWeght,"the amoune user needs to drink and how much the ueser wghis")
                let b = waterWeght * 2
                print(b,"this is b for your waght")
                yourweght = b
                let i = Double(txtField.text!) ?? 0
                                if i >= 800{
                    print("invaled weight")
                    self.alertInvalidWeight()
                }
            }
        }
        
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter a Number"
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func alertInvalidWeight(){
        print("alertInvalidWeigh")
        let alertConroler = UIAlertController(title: "Invalid", message: nil, preferredStyle: .alert)
        let aleertOK = UIAlertAction(title: "OK", style: .default){ (_) in
            self.showAlertWithTextField()
        }
        alertConroler.addAction(aleertOK)
        self.present(alertConroler,animated: true,completion: nil)
        
    }
    func AlertDisclamer(){
        print("alertDisclamer")
        let AlertControler = UIAlertController(title: "Disclaimer", message: "this app is made to only save how much water you drink and this app is not a medical professional remener to talk to your doctor about any helth change thank you.", preferredStyle: .alert)
        let OK = UIAlertAction(title: "Ok", style: .default){(_)in
            self.showAlertWithTextField()
        }
        let NO = UIAlertAction(title: "No", style: .default){(_) in
            self.AlertDisclamer()
        }
        AlertControler.addAction(NO)
        AlertControler.addAction(OK)
        self.present(AlertControler, animated: true,completion: nil)
    }
}
