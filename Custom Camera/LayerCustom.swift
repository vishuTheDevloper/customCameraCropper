//  Created by Vishal on 09/08/22.
import UIKit

class LayerCustom: UIView {
  
    var circleDiameter: CGFloat = 340 {
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isOpaque = false
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()

        UIColor(red: 0.0,
                green: 0.0,
                blue: 0.0,
                alpha: 0.7)
            .setFill()

        UIRectFill(rect)

     
        let circle = UIBezierPath(ovalIn: CGRect(x: rect.size.width/1.7 - circleDiameter/2,
                                                 y: rect.size.height/2 - circleDiameter/2,
                                                 width: circleDiameter - 100,
                                                 height: circleDiameter))
        
      
        context?.setBlendMode(.clear)
        UIColor.clear.setFill()
        circle.fill()

    }

    // Allow touches through the circle crop cutter view
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if !subview.isHidden &&
                subview.alpha > 0 &&
                subview.isUserInteractionEnabled &&
                subview.point(inside: convert(point,
                                              to: subview),
                              with: event) {
                return true
            }
        }

        return false
    }
}
