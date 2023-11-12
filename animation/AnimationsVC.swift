//
//  AnimationsVC.swift
//  animation
//
//  Created by Lika Nozadze on 11/12/23.
//


import UIKit

class AnimationsVC: UIViewController {
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        button.setTitle("TBC It Academy", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        animateButton()
    }
    
    @objc func buttonTapped() {
        print("Button Tapped")
    }
    
    func animateBounce(for button: UIButton) {
        let originalY = button.frame.origin.y
        UIView.animate(withDuration: 1.5, animations: {
            button.frame.origin.y -= 80
            
        }) { _ in
            UIView.animate(withDuration: 1.5, animations: {
                button.frame.origin.y = originalY
                button.alpha = 0
                
            }) { _ in
                UIView.animate(withDuration: 2, animations: {
                    button.frame.origin.y -= 80
                    button.alpha = 1
                }) { _ in
                    UIView.animate(withDuration: 1.5) {
                        button.frame.origin.y = originalY
                        button.alpha = 0
                    }
                }
            }
        }
    }
    
    func animateButton() {
        button.alpha = 0
        UIView.animate(withDuration: 2, animations: {
            self.button.alpha = 1
            self.button.transform = CGAffineTransform.identity
        }) { (_) in
            self.animateBounce(for: self.button)
        }
    }
}
