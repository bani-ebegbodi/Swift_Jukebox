//
//  ContentView.swift
//  JukeStarter
//
//  Created by Emuel Aldridge on 10/28/20.
//

import SwiftUI
import AVFoundation
var twist: AVAudioPlayer?
struct ContentView: View {
    @State private var playBegin = false
    @State private var playing = false
    var body: some View {
        ZStack {
            Image("rainy")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .ignoresSafeArea()
                )
            VStack {
                Text("Rainy Day")
                    .font(.custom("Lexend Zetta", size: 40))
                    .bold()
                    .padding(.top)
                    .foregroundColor(.white)
                Text("Music for a rainy day.")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom)
                
                
                ScrollView() {
                    VStack {
                        SongSetup(artist: "Billie Eilish", songTitle: "WILDFLOWER", artistImage: "wildflower", soundFile: "wildflower.m4a", playBegin: $playBegin, playing: $playing)
                            .padding()
                        
                        SongSetup(artist: "Priscilla Ahn", songTitle: "Fine On The Outside", artistImage: "fineontheoutside", soundFile: "fineontheoutside.m4a", playBegin: $playBegin, playing: $playing)
                            .padding()
                        
                        SongSetup(artist: "Bring Me The Horizon", songTitle: "i apologize if you feel something", artistImage: "iapologize", soundFile: "iapologize.m4a", playBegin: $playBegin, playing: $playing)
                            .padding()
                        
                        SongSetup(artist: "Absofacto", songTitle: "Lies", artistImage: "lies", soundFile: "lies.m4a", playBegin: $playBegin, playing: $playing)
                            .padding()
                        
                        SongSetup(artist: "M83", songTitle: "Wait", artistImage: "wait", soundFile: "wait.m4a", playBegin: $playBegin, playing: $playing)
                            .padding()
                        
                        SongSetup(artist: "Scott James", songTitle: "Cake", artistImage: "cake", soundFile: "cake.m4a", playBegin: $playBegin, playing: $playing)
                            .padding()
                        
                        SongSetup(artist: "Bahamas", songTitle: "All I've Ever Known", artistImage: "alliveeverknown", soundFile: "alliveeverknown.m4a", playBegin: $playBegin, playing: $playing)
                            .padding()
                        
                        SongSetup(artist: "Liana Flores", songTitle: "Nightvisions", artistImage: "nightvisions", soundFile: "nightvisions.m4a", playBegin: $playBegin, playing: $playing)
                            .padding()
                    }
                }
                Spacer()
                
                HStack(spacing: 11.0) {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: playBegin ? 30 : 5)
                            .frame(width: playBegin ? 60 : 250, height: 60)
                            .foregroundColor(playBegin ? .red : .blue)
                            .overlay(
                                Image(systemName: playBegin ? "pause.fill" : "play.fill")
                                    .font(.system(.title))
                                    .foregroundColor(.white)
                                    .scaleEffect(playing ? 0.7 : 1)
                            )
                        
                        RoundedRectangle(cornerRadius: playBegin ? 35 : 10)
                            .trim(from: 0, to: playBegin ? 0.0001 : 1)
                            .stroke(lineWidth: 5)
                            .frame(width: playBegin ? 70 : 260, height: 70)
                            .foregroundColor(.blue)
                    }
                    .onTapGesture {
                        withAnimation(.default) {
                            self.playBegin.toggle()
                        }
                        
                        if playing {
                            paws()
                        }
                        
                        if playBegin {
                            player()
                        }
                    }
                    
                }
                .padding(30)
            }
            
        }
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
