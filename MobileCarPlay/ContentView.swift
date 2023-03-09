//
//  ContentView.swift
//  MobileCarPlay
//
//  Created by Bronson Woods on 3/9/23.
import SwiftUI
import MapKit
import MediaPlayer
import CoreLocation

enum Emoji: String, CaseIterable{
    case 🧍🏽‍, 🙈, 🤌🏽, 😤
}


//main content view of all items within the UI
struct ContentView: View {
    var body: some View {
        VStack {
            // Map view
            MapView()
            
            // Music player controls
            MusicControlsView()
        }
    }
}


//struct to view the map and its visuals on the screen
struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Configure the map view
        uiView.showsUserLocation = true
        uiView.showsTraffic = true
        // Add any annotations or overlays
    }
}

// creating view for music playing on phone
struct MusicControlsView: View {
    @State var isPlaying: Bool = false
    @State var currentSong: String? = nil
    @State var currentArtist: String? = nil
    @State var currentArtwork: UIImage? = nil
    
    var body: some View {
        VStack {
            if let artwork = currentArtwork {
                Image(uiImage: artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Text("\(currentSong ?? "") - \(currentArtist ?? "")")
                .font(.headline)
            
            HStack {
                Button(action: {
                    // Skip to the previous song
                }, label: {
                    Image(systemName: "backward.end.fill")
                        .font(.title)
                })
                
                Button(action: {
                    // Toggle play/pause
                    isPlaying.toggle()
                }, label: {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .font(.title)
                })
                
                Button(action: {
                    // Skip to the next song
                }, label: {
                    Image(systemName: "forward.end.fill")
                        .font(.title)
                })
            }
        }
        .padding()
        .onAppear {
            // Load initial music data
            // Update the currentSong, currentArtist, and currentArtwork properties
        }
    }
}





//testing UI dev stuff
struct ContentView: View {
    @State var selection: Emoji = .🧍🏽‍
    
    var body: some View {
        NavigationView {
            VStack {
                Text(selection.rawValue)
                    .font(.system(size: 150))
                
                Picker("Select Emoji", selection: $selection) {
                    ForEach(Emoji.allCases, id: \.self) {emoji in
                        Text(emoji.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Emojis")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
