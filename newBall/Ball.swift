import Foundation
import UIKit


class Ball {
    public var ball = UIView()

    private var lead = NSLayoutConstraint()
    private var top = NSLayoutConstraint()
    private var width = NSLayoutConstraint()
    private var height = NSLayoutConstraint()

    func setBall() {
        ball.backgroundColor = .yellow
        
        ball.translatesAutoresizingMaskIntoConstraints = false
        
        ball.layer.cornerRadius = 50
        
        lead = ball.leadingAnchor.constraint(equalTo: ball.superview!.leadingAnchor)
        top = ball.topAnchor.constraint(equalTo: ball.superview!.topAnchor)
        
        height = ball.heightAnchor.constraint(equalToConstant: 100)
        width = ball.widthAnchor.constraint(equalToConstant: 100)
        
        randomPosition(X: lead, Y: top)
        tapGuestRecogn(for: ball)
        
        NSLayoutConstraint.activate([lead, top, width, height])
    }

    private func randomPosition(X: NSLayoutConstraint, Y: NSLayoutConstraint) {
        X.constant = .random(in: 16...217)
        Y.constant = .random(in: 26...642)
    }
    
    private func tapGuestRecogn(for view: UIView) {
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapped))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    }
    
    @objc
    public func tapped(sender: UITapGestureRecognizer) {
        randomPosition(X: lead, Y: top)
        animate()
    }
    
    private func animate() {
        ball.superview!.setNeedsLayout()
        UIView.animate(withDuration: 1.0) {
            self.ball.superview!.layoutIfNeeded()
        }
    }
}
