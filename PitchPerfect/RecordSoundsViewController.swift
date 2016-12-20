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
    var audioRecorder : AVAudioRecorder!
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        buttonStopRecording.isEnabled = false;
    }
    
    @IBAction func  recordAudio(_ sender: Any) {
        showRecordingInProgressUI()
        startRecording()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        showRecordingNotInProgressUI()
        audioRecorder.stop()
        try! AVAudioSession.sharedInstance().setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if (flag) {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("could not save audio file")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsViewController = segue.destination as! PlaySoundsViewController
            playSoundsViewController.recordedAudioUrl = sender as! URL  
        }
    }

    private func getAVAudioRecorder() -> AVAudioRecorder {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: AVAudioSessionCategoryOptions.defaultToSpeaker)
        return try! AVAudioRecorder(url: filePath!, settings: [:])
    }
    
    private func showRecordingInProgressUI() {
        labelTapToRecord.text = "Recording in Progress"
        buttonStopRecording.isEnabled = true
        recordButton.isEnabled = false
    }
    
    private func startRecording() {
        audioRecorder = getAVAudioRecorder()
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    private func showRecordingNotInProgressUI() {
        buttonStopRecording.isEnabled = false
        recordButton.isEnabled = true
        labelTapToRecord.text = "Tap to Record"
    }
}
