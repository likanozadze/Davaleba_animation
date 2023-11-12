//
//  Animation2.swift
//  animation
//
//  Created by Lika Nozadze on 11/12/23.
//


import UIKit

class Animation2: UIViewController {

    let button = UIButton()
    
    let pinkColor = UIColor.systemPink.cgColor
    let purpleColor = UIColor.purple.cgColor
    let yellowColor = UIColor.systemYellow.cgColor
    let greenColor = UIColor.systemGreen.cgColor
    var isGradientLayer1 = true

    var gradientLayer1: CAGradientLayer!
    var gradientLayer2: CAGradientLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        gradientLayer1 = createGradientLayer(startColor: pinkColor, endColor: purpleColor)
        gradientLayer2 = createGradientLayer(startColor: yellowColor, endColor: greenColor)

        view.layer.insertSublayer(gradientLayer1, at: 0)

        button.setTitle("TBC It Academy", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true


        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(switchGradientLayers), userInfo: nil, repeats: true)

       
        startSpinningAnimation(iteration: 3)
    }

    func createGradientLayer(startColor: CGColor, endColor: CGColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [startColor, endColor]
        gradientLayer.locations = [0.0, 1.0]
        return gradientLayer
    }

    @objc func switchGradientLayers() {
        if isGradientLayer1 {
            gradientLayer2.removeFromSuperlayer()
            view.layer.insertSublayer(gradientLayer2, at: 0)
        } else {
            gradientLayer1.removeFromSuperlayer()
            view.layer.insertSublayer(gradientLayer1, at: 0)
        }
        isGradientLayer1.toggle()
    }

    func startSpinningAnimation(iteration: Int) {
        if iteration > 0 {
            UIView.animate(withDuration: 2.0, delay: 0, options: .curveLinear, animations: {
                self.button.transform = self.button.transform.rotated(by: .pi)
            }) { (finished) in
                if finished {
                    UIView.animate(withDuration: 2.0, delay: 0, options: .curveLinear, animations: {
                        self.button.transform = self.button.transform.rotated(by: -.pi)
                    }) { (finished) in
                        if finished {
                            self.startSpinningAnimation(iteration: iteration - 1)
                        }
                    }
                }
            }
        }
    }
}


