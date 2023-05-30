//
//  PlaySound.swift
//  Care&Love
//
//  Created by mohamdan on 30/05/2023.
//

import SwiftUI
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playSound (soundFile : String, soundType : String){
    if let path = Bundle.main.path(forResource: soundFile, ofType: soundType){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        }catch{
            print(error)
        }
    }
    
}
