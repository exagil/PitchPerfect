 //
//  ViewController.swift
//  PitchPerfect
//
//  Created by Chirag Aggarwal on 18/12/16.
//  Copyright © 2016 Chirag Aggarwal. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate   {

    @IBOutlet weak var labelTapToRecord: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var buttonStopRecording: UIButton! 
    private var isRecording : Bool = false
    var audioRecorder : AVAudioRecorder!
    
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
        audioRecorder = getAVAudioRecorder()
        audioRecorder.delegate = self 
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
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
        audioRecorder.stop()
        try! AVAudioSession.sharedInstance().setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
    }

    private func getAVAudioRecorder() -> AVAudioRecorder {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath!)
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: AVAudioSessionCategoryOptions.defaultToSpeaker)
        return try! AVAudioRecorder(url: filePath!, settings: [:])
    }
}
