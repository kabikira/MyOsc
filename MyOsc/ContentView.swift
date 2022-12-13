//
//  ContentView.swift
//  MyOsc
//
//  Created by koala panda on 2022/12/13.
//

import SwiftUI
import AudioKit

class OscGenerator {
    let engine = AudioEngine()
    let osc = PlaygroundOscillator()
    var intialised: Bool = false
    
    func initalise() {
        if !intialised {
            intialised = true
            osc.amplitude = 0.25
            osc.frequency = 440
            
            engine.output = osc
            
            try! engine.start()
        }
    }
    func togglesound() {
        initalise()
        osc.isStarted ? osc.stop() : osc.start()
    }
}

struct ContentView: View {
    let oscillator = OscGenerator()
    
    var body: some View {
        Button("PlaySound") {
            oscillator.togglesound()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
