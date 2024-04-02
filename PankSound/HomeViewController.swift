//
//  ViewController.swift
//  PankSound
//
//  Created by Moon Dev on 02/04/2024.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var recordLb: UILabel!
    @IBOutlet weak var stopBtn: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        stopBtn.isEnabled = false
        recordLb.text = "Tap to record"
    }

    @IBAction func recordAction(_ sender: Any) {
        recordLb.text = "Recording in progress"
        
        stopBtn.isEnabled = true
        recordBtn.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = UUID().uuidString
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath)

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        recordBtn.isEnabled = true
        stopBtn.isEnabled = false
        recordLb.text = "Tap to Record"
        
        //       let audioSession = AVAudioSession.sharedInstance()
        //        try! audioSession.setActive(false)
        
        let pankSoundVc = PankSoundViewController(nibName: "PankSoundViewController", bundle: nil)
        let nav = UINavigationController(rootViewController: pankSoundVc)
        nav.setNavigationBarHidden(true, animated: false)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
}

