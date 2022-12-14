//
//  Test.swift
//  MyOsc
//
//  Created by koala panda on 2022/12/14.
//

import SwiftUI
import AudioKit
func testSound() {
    let osc = PlaygroundOscillator()

    let engine = AudioEngine()
    engine.output = osc
    try! engine.start()

    osc.play()

    while true {
        osc.frequency = Float.random(in: 200 ... 800)
        osc.amplitude = Float.random(in: 0.0 ... 0.3)
        usleep(100_000)
    }
}


struct TestView: View {
    var body: some View {
        Button("sound") {
            testSound()
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
