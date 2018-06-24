//
//  MoreVC.swift
//  Maps42
//
//  Created by Andriy BODNAR on 6/3/18.
//  Copyright © 2018 Andriy BODNAR. All rights reserved.
//

import UIKit
import AVFoundation

class MoreVC: UIViewController {

    var player: AVAudioPlayer?
    
    @IBOutlet weak var rhinoBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rhinoBtn.layer.cornerRadius = 5

    }

    @IBAction func screamBtnTapped(_ sender: Any) {
        playSound("rhino-scream")
    }
    
    func playSound(_ soundName : String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
