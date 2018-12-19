import UIKit
import SpriteKit




class ViewController: UIViewController {

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func btnPressed(_ sender: UIButton) {
   
        wheelclass().wheel.physicsBody?.angularVelocity = 100
     
  
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
