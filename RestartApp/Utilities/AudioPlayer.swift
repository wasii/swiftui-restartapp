//
//  AudioPlayer.swift
//  RestartApp
//
//  Created by NaheedPK on 30/03/2022.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch let err {
            print("not play!")
        }
    }
}
