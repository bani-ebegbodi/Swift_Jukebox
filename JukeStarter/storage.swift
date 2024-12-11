//
//  storage.swift
//  JukeStarter
//
//  Created by Emuel Aldridge on 10/28/20.
//

import SwiftUI
import AVFoundation
struct SongSetup: View {
    var artist = "Rolling Stones"
    var songTitle = "Paint it Black"
    var artistImage = "stones"
    var soundFile = "stones.m4a"
    @Binding var playBegin: Bool
    @Binding var playing: Bool
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.default) {
                    playBegin = true
                    playing.toggle()
                }
                
                if playing {
                    playsound(thesong: soundFile)
                } else {
                    paws()
                }
            }) {
                VStack {
                    Image(artistImage)
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    Text(songTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                    Text(artist)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                 
                }
             
            }

           
        }
    }
}

func playsound (thesong: String){
    let thepath = Bundle.main.path(forAuxiliaryExecutable: thesong)!
let url = URL(fileURLWithPath: thepath)
do {
    twist = try AVAudioPlayer(contentsOf: url)
    twist?.play()
} catch {
    // couldn't load file :(
}
}


func paws(){
    twist?.pause()
}
func player(){
    twist?.play()
}
