import Foundation
import UIKit

final class TriangleView: UIView {
    
    func initTriangle() {
        do {
            let points = getRandomSafeModelPoints(count : 3, margin: 1)            
            try self.triangle = makeTriangle(vals: points, color: ColorPicker.randomColor())
        }
        catch {
            self.triangle = Triangle.makeDefault()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initTriangle();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  UIGraphicsGetCurrentContext();
        context?.move(to: CGPoint(x: triangle.p1.x, y: triangle.p1.y))
        context?.addLine(to: CGPoint(x: triangle.p2.x, y: triangle.p2.y))
        context?.addLine(to: CGPoint(x: triangle.p3.x, y: triangle.p3.y))
        context?.addLine(to: CGPoint(x: triangle.p1.x, y: triangle.p1.y))
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(triangle.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        drawGridPoints()
    }
    var triangle = Triangle.makeDefault();
}
