import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var recordedAudioUrl : URL!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer: Timer!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated )
        configureUI(.notPlaying)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
    }

    @IBAction func stopButtonPressed(_ sender: Any) {
        stopAudio()
    }

    @IBAction func playSoundForButton(_ sender: UIButton ) {
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
    }
}

 
