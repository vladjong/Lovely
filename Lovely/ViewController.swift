//
//  ViewController.swift
//  Lovely
//
//  Created by Владислав Гайденко on 23.05.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
        
    var player: AVAudioPlayer?
    let urlString = Bundle.main.path(forResource: "nature", ofType: "mp3")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            guard let urlString = urlString else {
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            guard let player = player else {
                return
            }
            player.play()
        }
        catch {
            print("Error")
        }
    }
    
    var playerButton: AVAudioPlayer?
    let buttonSound = Bundle.main.path(forResource: "drop", ofType: "mp3")
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func setText(_ sender: UIButton) {
        do {
            guard let buttonSound = buttonSound else {
                return
            }
            playerButton = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonSound))
            guard let player = playerButton else {
                return
            }
            player.play()
        }
        catch {
            print("Error")
        }
        let randomInt = Int.random(in: 0..<16)
        textLabel.text = getString(value: randomInt)
    }
    
    func getString(value: Int) -> String {
        return phrases[value]
    }
}
