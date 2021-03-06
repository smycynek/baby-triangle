import Foundation
import UIKit

class Circle: Shape {
    init(center: Point, radius: Int, color: UIColor) {
        self.center = center
        self.radius = radius
        self.color = color
    }
    func getPath() -> CGMutablePath {
        let path = CGMutablePath()
        path.move(to: CGPoint(x: self.center.xParam + self.radius, y: self.center.yParam))
        path.addArc(center:
            CGPoint(x: self.center.xParam, y: self.center.yParam),
                    radius: CGFloat (self.radius),
                    startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: false)
        path.closeSubpath()
        return path
    }

    var description: String { return "circle: center: \(mapToModel(center).description), radius: \(mapToModel(radius))" }
    var center: Point
    var radius: Int
    var color: UIColor
}

func makeScreenSpaceCircle(center: Point, radius: Int, color: UIColor) -> Circle {
    return Circle(center: mapToScreen(center), radius: mapToScreen(radius), color: color)
}
