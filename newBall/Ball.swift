import Foundation
import UIKit


class Ball {

    var ball = UIView()

    private var lead = NSLayoutConstraint()
    private var top = NSLayoutConstraint()
    private var width = NSLayoutConstraint()
    private var height = NSLayoutConstraint()
    
    func setBall() {
        ball.backgroundColor = .yellow
        
        ball.translatesAutoresizingMaskIntoConstraints = false
        
        ball.layer.cornerRadius = 50
        
        lead = ball.leadingAnchor.constraint(equalTo: ball.superview?.leadingAnchor ?? ball.rightAnchor)
        top = ball.topAnchor.constraint(equalTo: ball.superview?.topAnchor ?? ball.bottomAnchor)
        
        height = ball.heightAnchor.constraint(equalToConstant: 100.0)
        width = ball.widthAnchor.constraint(equalToConstant: 100.0)
        
        randomBallPosition(X: lead, Y: top)
        touchWithGestureRecognizer(for: ball)
        
        NSLayoutConstraint.activate([lead, top, width, height])
    }
    //    iPhone 14 Pro    393x852 pt (1179x2556 px @3x)
    private func randomBallPosition(X: NSLayoutConstraint, Y: NSLayoutConstraint) {
        X.constant = .random(in: 16...277)
        Y.constant = .random(in: 26...726)

    }
    
    private func touchWithGestureRecognizer(for view: UIView) {
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(ballTouch))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    }
    
    @objc func ballTouch(_ : UITapGestureRecognizer) {
        randomBallPosition(X: lead, Y: top)
        animation()

        func animation() {
            guard ball.superview != nil else {
                fatalError("Oops")
            }
            ball.superview?.setNeedsLayout()
            UIView.animate(withDuration: 1.0) {
                self.ball.superview?.layoutIfNeeded()
            }
        }
    }
}

