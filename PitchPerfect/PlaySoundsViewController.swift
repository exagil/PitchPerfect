import UIKit

class PlaySoundsViewController: UIViewController {

    var recordedAudioUrl : URL!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        print("PlaySoundsViewController: " + recordedAudioUrl.absoluteString  )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stopButtonPressed(_ sender: Any) {
        print("stopButtonPressed")
    }

    @IBAction func playSoundForButton(_ sender: Any) {
        print("playSoundForButton")
    }
}
