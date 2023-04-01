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
            redLabel.fadeIn()
            return
        }
        switch activeLabel {
        case .red:
            activeLabel = .yellow
            redLabel.fadeOut()
            yellowLabel.fadeIn()
        case .yellow:
            activeLabel = .green
            yellowLabel.fadeOut()
            greenLabel.fadeIn()
        case .green:
            activeLabel = .red
            greenLabel.fadeOut()
            redLabel.fadeIn()
        }
    }
}

extension ViewController {

    enum LabelColor {
        case red, yellow, green
    }
}

extension UIView {

    func fadeIn(duration: TimeInterval = 1.0, alpha: CGFloat = 1) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = alpha
        })
    }

    func fadeOut(duration: TimeInterval = 1.0, alpha: CGFloat = 0.3) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = alpha
        })
    }
}
