    //
    //  ViewController.swift
    //  Homework2_2
    //
    //  Created by Konstantin Fomenkov on 01.04.2023.
    //

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLabel: UIView!
    @IBOutlet var yellowLabel: UIView!
    @IBOutlet var greenLabel: UIView!
    @IBOutlet var startButton: UIButton!

    private var activeLabel: LabelColor = .red

    override func viewDidLoad() {
        super.viewDidLoad()
        redLabel.alpha = 0.3
        yellowLabel.alpha = 0.3
        greenLabel.alpha = 0.3

        startButton.layer.cornerRadius = 10
        startButton.setTitle("START", for: .normal)
    }

    override func viewDidLayoutSubviews() {
        redLabel.layer.cornerRadius = redLabel.frame.width / 2
        yellowLabel.layer.cornerRadius = yellowLabel.frame.width / 2
        greenLabel.layer.cornerRadius = greenLabel.frame.width / 2
    }

    @IBAction func startButtonTaped() {
        if startButton.titleLabel?.text == "START" {
            startButton.setTitle("NEXT", for: .normal)
            UIView.animate(withDuration: 1) {
                self.redLabel.alpha = 1
            }
            return
        }
        switch activeLabel {
        case .red:
            activeLabel = .yellow
            UIView.animate(withDuration: 1) {
                self.redLabel.alpha = 0.3
                self.yellowLabel.alpha = 1
            }
        case .yellow:
            activeLabel = .green
            UIView.animate(withDuration: 1) {
                self.yellowLabel.alpha = 0.3
                self.greenLabel.alpha = 1
            }
        case .green:
            activeLabel = .red
            UIView.animate(withDuration: 1) {
                self.greenLabel.alpha = 0.3
                self.redLabel.alpha = 1
            }
        }
    }
}

extension ViewController {

    enum LabelColor {
        case red, yellow, green
    }
}
