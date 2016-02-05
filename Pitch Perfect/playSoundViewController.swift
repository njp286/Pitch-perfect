//
//  playSoundViewController.swift
//  Pitch Perfect
//
//  Created by Nathaniel PiSierra on 2/5/16.
//  Copyright © 2016 Nathaniel PiSierra. All rights reserved.
//

import AVFoundation
import UIKit

class playSoundViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        let fileUrl = NSURL(fileURLWithPath: path!)
        audioPlayer = try!
        AVAudioPlayer(contentsOfURL: fileUrl)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func snailButtonPressed(sender: UIButton) {
        audioPlayer.play()
        
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
