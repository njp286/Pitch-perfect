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

   
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var endRecordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endRecordButton.hidden = true;
        statusLabel.text = "Record";
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordPressed(sender: UIButton) {
        recordButton.hidden = true;
        endRecordButton.hidden = false;
        statusLabel.text = "Recording...";
    }

    @IBAction func endRecordPressed(sender: UIButton) {
        
        
    }



}
