//
//  CustomeValueFormatter.swift
//  FleetGuard_Retailer
//
//  Created by admin on 02/08/23.
//

import Foundation
import Charts

/// The default value formatter used for all chart components that needs a default
@objc(CustomeValueFormatter)
open class CustomeValueFormatter: NSObject, ValueFormatter
{
    public typealias Block = (
        _ value: Double,
        _ entry: ChartDataEntry,
        _ dataSetIndex: Int,
        _ viewPortHandler: ViewPortHandler?) -> String
    
    @objc open var block: Block?
    
    @objc open var hasAutoDecimals: Bool
    
    @objc open var formatter: NumberFormatter?
    {
        willSet
        {
            hasAutoDecimals = false
        }
    }
    
    open var decimals: Int?
    {
        didSet
        {
            setupDecimals(decimals: decimals)
        }
    }

    private func setupDecimals(decimals: Int?)
    {
        if let digits = decimals
        {
            formatter?.minimumFractionDigits = digits
            formatter?.maximumFractionDigits = digits
            formatter?.usesGroupingSeparator = true
        }
    }
    
    public override init()
    {
        formatter = NumberFormatter()
        formatter?.usesGroupingSeparator = true
        decimals = 0
        hasAutoDecimals = false

        super.init()
        setupDecimals(decimals: decimals)
    }
    
    @objc public init(formatter: NumberFormatter)
    {
        self.formatter = formatter
        hasAutoDecimals = false

        super.init()
    }
    
    @objc public init(decimals: Int)
    {
        formatter = NumberFormatter()
        formatter?.usesGroupingSeparator = true
        self.decimals = decimals
        hasAutoDecimals = false

        super.init()
        setupDecimals(decimals: decimals)
    }
    
    @objc public init(block: @escaping Block)
    {
        self.block = block
        hasAutoDecimals = false

        super.init()
    }

    /// This function is deprecated - Use `init(block:)` instead.
    // DEC 11, 2017
    @available(*, deprecated, message: "Use `init(block:)` instead.")
    @objc public static func with(block: @escaping Block) -> CustomeValueFormatter
    {
        return CustomeValueFormatter(block: block)
    }
    
    open func stringForValue(_ value: Double,
                             entry: ChartDataEntry,
                             dataSetIndex: Int,
                             viewPortHandler: ViewPortHandler?) -> String
    {
        if let block = block {
            return block(value, entry, dataSetIndex, viewPortHandler)
        } else {
            return formatter?.string(from: NSNumber(integerLiteral: Int(value))) ?? ""
        }
    }
}
