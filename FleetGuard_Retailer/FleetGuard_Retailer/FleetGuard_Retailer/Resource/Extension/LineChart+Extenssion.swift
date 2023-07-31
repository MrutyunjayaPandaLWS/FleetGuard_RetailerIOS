//
//  LineChart+Extenssion.swift
//  FleetGuard_Retailer
//
//  Created by admin on 06/07/23.
//

import Foundation
import Charts
import UIKit

//MARK: -
let Note = """
For dimonds Symbol in Line Chart :-
1. Copy all the extenssion Code and paste in LineChartRenderer file and call the drawDimond func
inside the drawExtra func. and hide the drawcircle func
"""
//extension LineChartRenderer{
//     func drawDimond(context: CGContext)
//    {
//        guard
//            let dataProvider = dataProvider,
//            let lineData = dataProvider.lineData
//        else { return }
//
//        let phaseY = animator.phaseY
//
//        var pt = CGPoint()
//        var rect = CGRect()
//
//        // If we redraw the data, remove and repopulate accessible elements to update label values and frames
//        accessibleChartElements.removeAll()
//        accessibilityOrderedElements = accessibilityCreateEmptyOrderedElements()
//
//        // Make the chart header the first element in the accessible elements array
//        if let chart = dataProvider as? LineChartView {
//            let element = createAccessibleHeader(usingChart: chart,
//                                                 andData: lineData,
//                                                 withDefaultDescription: "Line Chart")
//            accessibleChartElements.append(element)
//        }
//
//        context.saveGState()
//
//        for i in lineData.indices
//        {
//            guard let dataSet = lineData[i] as? LineChartDataSetProtocol else { continue }
//
//            // Skip Circles and Accessibility if not enabled,
//            // reduces CPU significantly if not needed
//            if !dataSet.isVisible || !dataSet.isDrawCirclesEnabled || dataSet.entryCount == 0
//            {
//                continue
//            }
//
//            let trans = dataProvider.getTransformer(forAxis: dataSet.axisDependency)
//            let valueToPixelMatrix = trans.valueToPixelMatrix
//
//            _xBounds.set(chart: dataProvider, dataSet: dataSet, animator: animator)
//
//            let circleRadius = dataSet.circleRadius
//            let circleDiameter = circleRadius * 2.0
//            let circleHoleRadius = dataSet.circleHoleRadius
//            let circleHoleDiameter = circleHoleRadius * 2.0
//
//            let drawCircleHole = dataSet.isDrawCircleHoleEnabled &&
//                circleHoleRadius < circleRadius &&
//                circleHoleRadius > 0.0
//            let drawTransparentCircleHole = drawCircleHole &&
//                (dataSet.circleHoleColor == nil ||
//                    dataSet.circleHoleColor == NSUIColor.clear)
//
//            for j in _xBounds
//            {
//                guard let e = dataSet.entryForIndex(j) else { break }
//
//                print("pt-x",pt.x,"pt-y",pt.y)
//                pt.x = CGFloat(e.x)
//                pt.y = CGFloat(e.y * phaseY)
//                pt = pt.applying(valueToPixelMatrix)
//
//                context.beginPath()
//                context.move(to: CGPoint(x: pt.x, y: pt.y - 5))
//                context.addLine(to: CGPoint(x: pt.x + 5, y: pt.y))
//                context.addLine(to: CGPoint(x: pt.x, y: pt.y + 5))
//                context.addLine(to: CGPoint(x: pt.x - 5, y: pt.y))
//
//                context.closePath()
//
//                // Customize the appearance of the diamond shape
////                dataSet.circleHoleColor!.cgColor
//                context.setFillColor(dataSet.getCircleColor(atIndex: j)!.cgColor)
//                context.setStrokeColor(dataSet.getCircleColor(atIndex: j)!.cgColor)
//                context.setLineWidth(circleRadius)
//                context.drawPath(using: .fillStroke)
//            }
//        }
//
//        context.restoreGState()
//
//        // Merge nested ordered arrays into the single accessibleChartElements.
//        accessibleChartElements.append(contentsOf: accessibilityOrderedElements.flatMap { $0 } )
//        accessibilityPostLayoutChangedNotification()
////
//    }
//}
