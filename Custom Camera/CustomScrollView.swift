//  Created by Vishal on 09/08/22.
import UIKit

class CustomScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clipsToBounds = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }

    // Allow dragging outside of the scroll view bounds
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let excessWidth = (UIScreen.main.bounds.size.width - self.bounds.size.width)/2
        let excessHeight = (UIScreen.main.bounds.size.height - self.bounds.size.height)/2

        if self.bounds.insetBy(dx: -excessWidth,
                               dy: -excessHeight).contains(point) {
            return self
        }

        return nil
    }
}
