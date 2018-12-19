import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var button: UIButton!

  var wheelView: WheelView { return view as! WheelView }

  @IBAction func btnPressed(_ sender: UIButton) {
    wheelView.wheel.physicsBody?.angularVelocity = 10
  }

  // Do any additional setup after loading the view, typically from a nib.
}
