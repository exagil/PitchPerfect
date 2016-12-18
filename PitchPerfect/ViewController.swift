//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Chirag Aggarwal on 18/12/16.
//  Copyright © 2016 Chirag Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTapToRecord: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func  recordAudio(_ sender: Any) {
          print("recordAudio button was pressed")
        labelTapToRecord.text = "Recording in Progress"
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        
    }
}
