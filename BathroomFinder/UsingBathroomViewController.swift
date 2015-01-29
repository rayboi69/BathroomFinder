//
//  UsingBathroomViewController.swift
//  BathroomFinder
//
//  Created by Raul Rey Aso on 11/8/14.
//  Copyright (c) 2014 ReyAsoIndustries. All rights reserved.
//

import UIKit

class UsingBathroomViewController: UIViewController {


    @IBOutlet weak var labelTimeElapse: UILabel!
    @IBOutlet weak var labelEstimatedCost: UILabel!
    
    var timer = NSTimer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTimeElapse.text = String(counter)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("Update"), userInfo: nil, repeats:true)
        
        
        // Do any additional setup after loading the view.
    }
    
    func Update() {

        var tempCounter:Int = counter++
        labelTimeElapse.text = String(tempCounter)
        
        var pricePerSecond:Float = 0.01667
        var counterValue:Float = Float(tempCounter)
        var result = counterValue * pricePerSecond
        
        let s = NSString(format: "%.2f", result)
        
        labelEstimatedCost.text = s
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
