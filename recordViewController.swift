//
//  recordViewController.swift
//  Pitch Perfect
//
//  Created by Nathaniel PiSierra on 2/4/16.
//  Copyright © 2016 Nathaniel PiSierra. All rights reserved.
//


import UIKit
import AVFoundation

class recordViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder:AVAudioRecorder!
    var recordedAudio: RecordedAudio!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var endRecordButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        endRecordButton.hidden = true;
        statusLabel.text = "Record";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endRecordButton.hidden = true;
        statusLabel.text = "Record";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func recordPressed(sender: UIButton) {
        endRecordButton.hidden = false;
        statusLabel.text = "Recording...";
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let recordingName = "my_audio.wav"
          let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()

        
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let playSoundsVC:playSoundViewController = segue.destinationViewController as! playSoundViewController
        
        let data = sender as! RecordedAudio
        playSoundsVC.receivedAudio = data
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        recordedAudio = RecordedAudio()
        recordedAudio.filePathUrl = recorder.url
        recordedAudio.title = recorder.url.lastPathComponent
        
        self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        
    }
    
    @IBAction func endRecordPressed(sender: UIButton) {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance();
        try! audioSession.setActive(false)
        
        
    }



}
