//
//  SliderOscView.swift
//  MyOsc
//
//  Created by koala panda on 2022/12/14.
//

import SwiftUI
import AudioKit

class Oslcillator: ObservableObject {
    @Published var xLocation:Float = 440
    let engine = AudioEngine()
    let osc = PlaygroundOscillator()
    
    func playSound() {
        osc.amplitude = 0.25
        osc.frequency = xLocation
        
        engine.output = osc
        
        try! engine.start()
        osc.start()
    }
    func stopSound()
    {
        osc.stop()
//        engine.stop()
    }
}

struct SliderOscView: View {
    @ObservedObject var oscillator = Oslcillator()
    @State private var currentValue: Float = 440
    
    var body: some View {
        VStack {
            Text("現在の値:\(currentValue)")
            
            Slider(value: $currentValue,
                   in: 0...2000,
                   step: 1.0,
                   onEditingChanged: { _ in
                oscillator.xLocation = currentValue
                oscillator.playSound()
            }
                   
            )
            
            Button("play") {
                oscillator.playSound()
                print("おしたよ")
            }
            Button("stop") {
                oscillator.stopSound()
                print("止めたよ")
            }
        }
        
    }
}

struct SliderOscView_Previews: PreviewProvider {
    static var previews: some View {
        SliderOscView()
    }
}
