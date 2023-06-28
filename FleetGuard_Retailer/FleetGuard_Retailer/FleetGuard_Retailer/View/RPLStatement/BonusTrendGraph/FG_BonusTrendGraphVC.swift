//
//  FG_BonusTrendGraphVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 06/03/23.
//

import UIKit
import Charts
import CoreData
import LanguageManager_iOS

class FG_BonusTrendGraphVC: BaseViewController, ChartViewDelegate {

    @IBOutlet var bonusTrendHeadingLbl: UILabel!
    @IBOutlet var bonusTrendGraphView: LineChartView!
    @IBOutlet var notifyCountLbl: UILabel!
    
    var dataEntries: [ChartDataEntry] = []
    var valuesData: [ChartDataEntry] = []
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var VM = BonusTrendsVM()
    
    var pointsArray = [LstRetailerBonding4]()
    //var myPointsArrayOfD = [pointsTradegraph]()
    
    var firstGraphData = [Int]()
    var secondGraphData = [Int]()
    var monthsData = [String]()
    var currentYear = ""
    var previousYear = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        localization()
        bonusTrendGraphView.delegate = self
        bonusTrendGraphView.chartDescription.enabled = false
//        bonusTrendGraphView.xAxis.spaceMax = 1
        bonusTrendGraphView.dragEnabled = true
        bonusTrendGraphView.setScaleEnabled(true)
        bonusTrendGraphView.pinchZoomEnabled = true
        bonusTrendGraphView.xAxis.drawAxisLineEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.pointsTrendAPI()
            print(firstGraphData)
            print(secondGraphData)
        }
    }
    
    private func localization(){
        bonusTrendHeadingLbl.text = "bonus_trend".localiz()
    }
    func pointsTrendAPI(){
        let parameters = [
            "ActionType": 7,
            "ActorId":"\(userId)"
        ] as [String: Any]
        print(parameters)
        self.VM.bonusTrendsAPI(parameters: parameters){ response in
            DispatchQueue.main.async {
                self.VM.myBonusTrendGraphArray = response?.lstRetailerBonding ?? []
                print(self.VM.myBonusTrendGraphArray.count, "myBillingsListingArrayCount")
                //self.myPointsArrayOfD.removeAll()
                self.firstGraphData.removeAll()
                self.secondGraphData.removeAll()
                if self.VM.myBonusTrendGraphArray.count != 0 {
                    for data in self.VM.myBonusTrendGraphArray{
                        let previousYearPoint = data.previousYearPoint
                        let currentYear = data.currentYearPoint
                        
                        if self.secondGraphData.count < 12{
                            self.secondGraphData.append(data.previousYearPoint!)
                            let year1 = "\((data.year ?? 0) + 1)"
                            self.previousYear = "\(data.year ?? 0) - \(year1.suffix(2))"
                        }else{
                            self.firstGraphData.append(data.currentYearPoint!)
                            let year2 = "\((data.year ?? 0) + 1)"
                            self.currentYear = "\(data.year ?? 0) - \(year2.suffix(2))"
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


    @IBAction func notificationActBTN(_ sender: Any) {
    }
    @IBAction func backBTn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
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
        
    
        let chartDataSet = LineChartDataSet(entries: yVals2,  label: previousYear)
        chartDataSet.axisDependency = .left
        chartDataSet.setColor(.red)
        chartDataSet.lineWidth = 2
        chartDataSet.fillAlpha = 65/255
        chartDataSet.fillColor = .red
        chartDataSet.highlightColor = UIColor(red: 100/255, green: 110/255, blue: 220/255, alpha: 1)
        chartDataSet.circleHoleRadius = 1
        chartDataSet.drawValuesEnabled = true
        chartDataSet.circleRadius = 6
        chartDataSet.circleColors = [.systemYellow]
        
        let chartDataSet1 = LineChartDataSet(entries: yVals3, label: currentYear)
        chartDataSet1.axisDependency = .left
        chartDataSet1.setColor(.green)
        chartDataSet1.lineWidth = 2
        chartDataSet1.fillAlpha = 65/255
        chartDataSet1.fillColor = UIColor.yellow.withAlphaComponent(200/255)
        chartDataSet1.highlightColor =  UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        chartDataSet1.circleHoleRadius = 1
        chartDataSet1.drawValuesEnabled = true
        chartDataSet1.circleRadius = 6
        chartDataSet1.circleColors = [.blue]

        let chartData = LineChartData(dataSets: [chartDataSet, chartDataSet1])

        bonusTrendGraphView.chartDescription.text = " "
        bonusTrendGraphView.data = chartData

        bonusTrendGraphView.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.monthsData)
        bonusTrendGraphView.xAxis.setLabelCount(monthsData.count, force: true)
        print(monthsData)
        print(monthsData.count)
        bonusTrendGraphView.xAxis.labelPosition = .bottom
        bonusTrendGraphView.xAxis.drawGridLinesEnabled = false
        bonusTrendGraphView.xAxis.avoidFirstLastClippingEnabled = true

        bonusTrendGraphView.rightAxis.drawAxisLineEnabled = false
        bonusTrendGraphView.rightAxis.drawLabelsEnabled = false

        bonusTrendGraphView.leftAxis.drawAxisLineEnabled = true
        bonusTrendGraphView.pinchZoomEnabled = false
        bonusTrendGraphView.doubleTapToZoomEnabled = false
        bonusTrendGraphView.legend.enabled = true
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