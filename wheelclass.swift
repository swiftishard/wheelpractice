func centerFrame(_ frame: CGRect) -> CGPoint {
    return CGPoint(x: (frame.maxX - frame.minX) / 2,
                   y: (frame.maxY - frame.minY) / 2)
}
let wheelSize: CGFloat = 400

class wheelclass: UIViewController {
    @IBOutlet weak var btn: UIButton!
    
    @IBAction func currentlyAuselessButton(_ sender: UIButton) {
      wheel.physicsBody?.angularVelocity = 100
       wheel.physicsBody?.angularDamping = 0
    }
    
    let wheel = Wheel(size: wheelSize,
                      colors: [.red, .blue, .green, .white, .purple, .brown])
 
    class Wedge: SKShapeNode {
        let size: CGFloat
        let angle: CGFloat
        let label: SKLabelNode
        
        init(size: CGFloat, angle: CGFloat, label: SKLabelNode) {
            self.size = size
            self.angle = angle
            self.label = label
            super.init()
            
            self.label.position = CGPoint(x: 0, y: size * 3 / 4)
            addChild(self.label)
            let halfAngle = angle / 2
            let centerAngle = CGFloat.pi / 2
            let path = UIBezierPath(arcCenter: CGPoint.zero,
                                    radius: size,
                                    startAngle: centerAngle - halfAngle,
                                    endAngle: centerAngle + halfAngle,
                                    clockwise: true)
            path.addLine(to: CGPoint.zero)
            path.close()
            self.path = path.cgPath
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class Wheel: SKShapeNode {
        let size: CGFloat
        let colors: [UIColor]
        
        
        init(size: CGFloat, colors: [UIColor]) {
            self.size = size
            self.colors = colors
            super.init()
            
            let wedges = colors.count
            let angle = 2 * CGFloat.pi / CGFloat(wedges)
            
            for start in 0..<wedges {
                let label = SKLabelNode()
                switch start {
                case 1, 3, 5: label.text = "Yes"
                default     : label.text = "No"
                }
                let wedge = Wedge(size: size, angle: angle, label: label)
                wedge.zRotation = CGFloat(start) * angle
                wedge.fillColor = colors[start]
                addChild(wedge)
            }
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    
    
    override func loadView() {
        
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 1024))
        view.backgroundColor = .white
        self.view = view
        
        let scene = SKScene(size: view.frame.size)
        scene.scaleMode = .aspectFill
      scene.physicsWorld.gravity = CGVector.zero
        
    
        wheel.position = centerFrame(scene.frame)
       let body = SKPhysicsBody(circleOfRadius: wheelSize,
                                 center: centerFrame(wheel.frame))
        body.angularVelocity = 0
         body.angularDamping = 0
        wheel.physicsBody = body

       
        scene.addChild(wheel)
        
        view.presentScene(scene)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadView()
       
        
       
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
