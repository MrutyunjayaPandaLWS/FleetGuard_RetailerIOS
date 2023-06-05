//
//  FG_PointsTrendGraphVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 06/03/23.
//


import UIKit
import Charts
import CoreData
import LanguageManager_iOS

class FG_PointsTrendGraphVC: BaseViewController, ChartViewDelegate {
    
    @IBOutlet var pointsTrendHeadingLbl: UILabel!
    @IBOutlet var countLbl: UILabel!
    @IBOutlet var pointsTrendGraphView: LineChartView!
    
    
    var dataEntries: [ChartDataEntry] = []
    var valuesData: [ChartDataEntry] = []
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var VM = PointsTrendsVM()
    var pointsArray = [LstRetailerBonding3]()
    var myPointsArrayOfD = [pointsTradegraph]()
    
    var firstGraphData = [Int]()
    var secondGraphData = [Int]()
    var tempfirstGraphData = [Int]()
    var monthsData = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        pointsTrendGraphView.delegate = self
        pointsTrendGraphView.chartDescription.enabled = true
        pointsTrendGraphView.dragEnabled = true
        pointsTrendGraphView.setScaleEnabled(true)
        pointsTrendGraphView.pinchZoomEnabled = true
        pointsTrendGraphView.xAxis.drawAxisLineEnabled = false
        pointsTrendGraphView.xAxis.labelHeight = 30
        localization()
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pointsTrendAPI()
        print(myPointsArrayOfD,"skdjlsdj")
        print(firstGraphData)
        print(secondGraphData)
    }
    
    private func localization(){
        pointsTrendHeadingLbl.text = "points_trends".localiz()
    }
    
    func pointsTrendAPI(){
        let parameters = [
            "ActionType": 5,
            "ActorId":"\(userId)"
        ] as [String: Any]
        print(parameters)
        self.VM.pointsTrendsAPI(parameters: parameters){ response in
            DispatchQueue.main.async {
                self.VM.myPointsTrendGraphArray = response?.lstRetailerBonding ?? []
                print(self.VM.myPointsTrendGraphArray.count, "myBillingsListingArrayCount")
                self.myPointsArrayOfD.removeAll()
                self.firstGraphData.removeAll()
                if self.VM.myPointsTrendGraphArray.count != 0 {
                    for data in self.VM.myPointsTrendGraphArray{
                        let previousYearPoint = data.previousYearPoint
                        let currentYear = data.currentYearPoint
                        
                        self.myPointsArrayOfD.append(pointsTradegraph(monthName: data.monthName, previousYearPoint: "\(Int(data.previousYearPoint ?? 0))", currentYearPoint: "\(data.currentYearPoint ?? 0)"))
                        
//                        self.firstGraphData.append(data.currentYearPoint!)
//                        self.secondGraphData.append(data.previousYearPoint!)
//                        self.monthsData.append(data.monthName!)
//                    
                        if self.secondGraphData.count < 12{
                            self.secondGraphData.append(data.previousYearPoint!)
                        }else{
                            self.firstGraphData.append(data.currentYearPoint!)
                        }
                        if self.monthsData.count < 12{
                            self.monthsData.append(data.monthName!)
                        }
                        print(self.firstGraphData,"sljd")

                        let stringArray = self.secondGraphData.map {Double($0)}
                        let stringArray1 = self.firstGraphData.map {Double($0)}

                        print(stringArray,"dskh")
                        print(self.firstGraphData,"sdljd")
                        print(self.monthsData,"kchkd")
                        self.setChart(dataPoints: stringArray1, values: stringArray)
                        
                        print(stringArray1,"dskjds")
                        print(stringArray,"Sdsljsdlo")


                    }
                }
            }
        }
        
    }
    

    func setChart(dataPoints: [Double], values: [Double]) {
        print(self.firstGraphData,"lsjkl")
        print(self.secondGraphData,"sdkjnd")
        print(self.monthsData,"kjdshd")
    
        
        let yVals2 = (0..<dataPoints.count).map { (i) -> ChartDataEntry in
                let val = values[i]
                return ChartDataEntry(x: Double(i), y: val)
            }
        let yVals3 = (0..<dataPoints.count).map { (i) -> ChartDataEntry in
                let val = dataPoints[i]
                return ChartDataEntry(x: Double(i), y: val)
            }
        
    
        let chartDataSet = LineChartDataSet(entries: yVals2,  label: "Previous financial year")
        chartDataSet.axisDependency = .left
        chartDataSet.setColor(.red)
        chartDataSet.lineWidth = 2
        chartDataSet.fillAlpha = 65/255
        chartDataSet.fillColor = .red
        chartDataSet.highlightColor = UIColor(red: 100/255, green: 110/255, blue: 220/255, alpha: 1)
        chartDataSet.circleHoleRadius = 1
        chartDataSet.circleRadius = 6
        chartDataSet.drawValuesEnabled = true
        chartDataSet.circleColors = [.systemYellow]
        
        let chartDataSet1 = LineChartDataSet(entries: yVals3, label: "Current financial year")
        chartDataSet1.axisDependency = .left
        chartDataSet1.setColor(.green)
        chartDataSet1.lineWidth = 2
        chartDataSet1.fillAlpha = 65/255
        chartDataSet1.fillColor = UIColor.yellow.withAlphaComponent(200/255)
        chartDataSet1.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        chartDataSet1.circleHoleRadius = 1
        chartDataSet1.circleRadius = 6
        chartDataSet1.circleColors = [.blue]
        chartDataSet1.drawValuesEnabled = true

        let chartData = LineChartData(dataSets: [chartDataSet, chartDataSet1])

        pointsTrendGraphView.chartDescription.text = " "
        pointsTrendGraphView.data = chartData

        pointsTrendGraphView.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.monthsData)
        pointsTrendGraphView.xAxis.labelPosition = .bottom
        pointsTrendGraphView.xAxis.setLabelCount(monthsData.count, force: true)
        pointsTrendGraphView.xAxis.drawGridLinesEnabled = false
        pointsTrendGraphView.xAxis.avoidFirstLastClippingEnabled = true
        

        pointsTrendGraphView.rightAxis.drawAxisLineEnabled = false
        pointsTrendGraphView.rightAxis.drawLabelsEnabled = false

        pointsTrendGraphView.leftAxis.drawAxisLineEnabled = true
        pointsTrendGraphView.pinchZoomEnabled = true
        pointsTrendGraphView.doubleTapToZoomEnabled = false
        pointsTrendGraphView.legend.enabled = true
    }
    
    @IBAction func notificationActBtn(_ sender: Any) {
    }
    @IBAction func backActBTN(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func getGradientFilling() -> CGGradient {
        // Setting fill gradient color
        let coloTop = UIColor(red: 141/255, green: 133/255, blue: 220/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 230/255, green: 155/255, blue: 210/255, alpha: 1).cgColor
        // Colors of the gradient
        let gradientColors = [coloTop, colorBottom] as CFArray
        // Positioning of the gradient
        let colorLocations: [CGFloat] = [0.7, 0.0]
        // Gradient Object
        return CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)!
    }

}
struct pointsTradegraph{
var monthName: String?
var previousYearPoint: String?
var currentYearPoint: String?
}
