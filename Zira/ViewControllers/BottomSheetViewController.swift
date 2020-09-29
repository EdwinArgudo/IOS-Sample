//
//  BottomSheetViewController.swift
//  Zira
//
//  Created by Vienna Zhang on 9/28/20.
//

import UIKit

extension BottomSheetViewController {
    private enum State {
        case partial
        case full
    }
    
    private enum Constant {
        static let fullViewYPosition: CGFloat = -200
        static let partialViewYPosition: CGFloat = 0
    }
}

class BottomSheetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        let swipeUp = UISwipeGestureRecognizer.init(target: self, action: #selector(swipeGesture(_:)))
        let swipeDown = UISwipeGestureRecognizer.init(target: self, action: #selector(swipeGesture(_:)))
        swipeUp.direction = .up
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func moveView(state: State) {
        let yPosition = state == .partial ? Constant.partialViewYPosition : Constant.fullViewYPosition
        view.frame = CGRect(x: 0, y: yPosition, width: view.frame.width, height: view.frame.height)
    }
    
    @objc func swipeGesture (_ recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .up {
            UIView.animate(withDuration: 1, delay: 0.0, options: [.curveEaseOut], animations: {
                self.moveView(state: State.full)
            }, completion: nil)
        } else if recognizer.direction == .down {
            UIView.animate(withDuration: 1, delay: 0.0, options: [.curveEaseIn], animations: {
                self.moveView(state: State.partial)
            }, completion: nil)
        }
    }
    
    func setupView() {
        view.layer.cornerRadius = 10
        view.clipsToBounds = false
    }


}
