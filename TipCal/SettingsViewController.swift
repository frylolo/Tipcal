//
//  SettingsViewController.swift
//  TipCal
//
//  Created by Juan M Franco on 8/12/16.
//  Copyright © 2016 Juan M Franco. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var StarPercentage5: UITextField!
    @IBOutlet weak var StarPercentage4: UITextField!
    @IBOutlet weak var StarPercentage3: UITextField!
    @IBOutlet weak var StarPercentage2: UITextField!
    @IBOutlet weak var StarPercentage1: UITextField!
    
    @IBOutlet weak var StarMessage5: UITextField!
    @IBOutlet weak var StarMessage4: UITextField!
    @IBOutlet weak var StarMessage3: UITextField!
    @IBOutlet weak var StarMessage2: UITextField!
    @IBOutlet weak var StarMessage1: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let svStarPercentage5 = defaults.objectForKey("StarPercentage5") as? String {
            StarPercentage5.text = svStarPercentage5
        } else {
            StarPercentage5.text = "25.00"
        }
        
        if let svStarPercentage4 = defaults.objectForKey("StarPercentage4") as? String {
            StarPercentage4.text = svStarPercentage4
        } else {
            StarPercentage4.text = "20.00"
        }
        
        if let svStarPercentage3 = defaults.objectForKey("StarPercentage3") as? String {
            StarPercentage3.text = svStarPercentage3
        } else {
            StarPercentage3.text = "15.00"
        }
        
        if let svStarPercentage2 = defaults.objectForKey("StarPercentage2") as? String {
            StarPercentage2.text = svStarPercentage2
        } else {
            StarPercentage2.text = "10.00"
        }
        
        if let svStarPercentage1 = defaults.objectForKey("StarPercentage1") as? String {
            StarPercentage1.text = svStarPercentage1
        } else {
            StarPercentage1.text = "5.00"
        }
        
        if let svStarMessage5 = defaults.objectForKey("StarMessage5") as? String {
            StarMessage5.text = svStarMessage5
        } else {
            StarMessage5.text = " Truely Amazing!! "
        }
        
        if let svStarMessage4 = defaults.objectForKey("StarMessage4") as? String {
            StarMessage4.text = svStarMessage4
        } else {
            StarMessage4.text = " Great food and service "
        }
        
        if let svStarMessage3 = defaults.objectForKey("StarMessage3") as? String {
            StarMessage3.text = svStarMessage3
        } else {
            StarMessage3.text = " It was OK, I guess :|"
        }
        
        if let svStarMessage2 = defaults.objectForKey("StarMessage2") as? String {
            StarMessage2.text = svStarMessage2
        } else {
            StarMessage2.text = " Not coming back :( "
        }
        
        if let svStarMessage1 = defaults.objectForKey("StarMessage1") as? String {
            StarMessage1.text = svStarMessage1
        } else {
            StarMessage1.text =  " Horrible! "        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnTabCalc(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func FormatField(sender: UITextField) {
        let newValue = Double(sender.text!) ?? 0.00
        sender.text = String(format:"%.2f", newValue )
    }
    
    @IBAction func SvData(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(StarPercentage5.text, forKey: "StarPercentage5")
        defaults.setObject(StarPercentage4.text, forKey: "StarPercentage4")
        defaults.setObject(StarPercentage3.text, forKey: "StarPercentage3")
        defaults.setObject(StarPercentage2.text, forKey: "StarPercentage2")
        defaults.setObject(StarPercentage1.text, forKey: "StarPercentage1")
        
        defaults.setObject(StarMessage5.text, forKey: "StarMessage5")
        defaults.setObject(StarMessage4.text, forKey: "StarMessage4")
        defaults.setObject(StarMessage3.text, forKey: "StarMessage3")
        defaults.setObject(StarMessage2.text, forKey: "StarMessage2")
        defaults.setObject(StarMessage1.text, forKey: "StarMessage1")
        
        defaults.synchronize()
        
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
