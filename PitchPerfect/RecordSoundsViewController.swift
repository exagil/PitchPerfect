 //
//  ViewController.swift
//  PitchPerfect
//
//  Created by Chirag Aggarwal on 18/12/16.
//  Copyright © 2016 Chirag Aggarwal. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var labelTapToRecord: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var buttonStopRecording: UIButton! 
    private var isRecording : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        buttonStopRecording.isEnabled = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func  recordAudio(_ sender: Any) {
        print("recordAudio button was pressed")
        labelTapToRecord.text = "Recording in Progress"
        isRecording = true 
        buttonStopRecording.isEnabled = true
        recordButton .isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print ("viewDidAppear")
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        isRecording = false   
        buttonStopRecording.isEnabled = false
        recordButton.isEnabled = true
         labelTapToRecord.text = "Tap to Record"
    }
}
