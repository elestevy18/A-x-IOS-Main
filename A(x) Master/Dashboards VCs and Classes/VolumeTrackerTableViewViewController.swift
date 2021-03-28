////
////  VolumeTrackerTableViewViewController.swift
////  AofX
////
////  Created by Kevin Jimenez on 7/1/20.
////  Copyright © 2020 Aesthet(X). All rights reserved.
////
//
//import UIKit
//
//class VolumeTrackerTableViewViewController: UIViewController {
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    var cells: [VolumeTrackerCellObject] = []
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        cells = createArray()
//        
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//    
//    
//    func createArray() -> [VolumeTrackerCellObject] {
//        
//        let cell0 = VolumeTrackerCellObject(muscleImage: (UIImage(named: "Dumbell Icon"))!, muscleGroupTitle: "Chest", mavText: "MAV: 12-20 FREQ: 2-3", progressText: "0012")
//        let cell1 = VolumeTrackerCellObject(muscleImage: (UIImage(named: "Dumbell Icon"))!, muscleGroupTitle: "Bicep", mavText: "MAV: 14-20 FREQ: 2-6", progressText: "0012")
//            //VolumeTrackerCellObject(#imageLiteral(resourceName: “Dumbell Icon”), title: "Bicep", "MAV: 14-20 FREQ: 2-6", "00/12")
//        let cell2 = VolumeTrackerCellObject(muscleImage: (UIImage(named: "Dumbell Icon"))!, muscleGroupTitle: "Lats", mavText: "MAV: 12-22 FREQ: 2-4", progressText: "0012")
//            //VolumeTrackerCellObject(image: "Dumbell Icon", title: "Lats", "MAV: 12-22 FREQ: 2-4", "00/12")
//        let cell3 = VolumeTrackerCellObject(muscleImage: (UIImage(named: "Dumbell Icon"))!, muscleGroupTitle: "Front Shoulder", mavText: "MAV: 16-22 FREQ: 1-2", progressText: "0012")
//            //VolumeTrackerCellObject(image: "Dumbell Icon", title: "Front Shoulder", "MAV: 16-22 FREQ: 1-2", "00/12")
//        let cell4 = VolumeTrackerCellObject(muscleImage: (UIImage(named: "Dumbell Icon"))!, muscleGroupTitle: "Lateral Shoulder", mavText: "MAV: 16-22 FREQ: 2-6", progressText: "0012")
//            //VolumeTrackerCellObject(image: "Dumbell Icon", title: "Lateral Shoulder", "MAV: 16-22 FREQ: 2-6", "00/12")
//        let cell5 = VolumeTrackerCellObject(muscleImage: (UIImage(named: "Dumbell Icon"))!, muscleGroupTitle: "Back Shoulder", mavText: "MAV: 16-22 FREQ: 2-6", progressText: "0012")
//            //VolumeTrackerCellObject(image: "Dumbell Icon", title: "Back Shoulder", "MAV: 16-22 FREQ: 2-6", "00/12")
//    
//        return [cell0, cell1, cell2, cell3, cell4, cell5]
//    }
//}
//
//
//extension VolumeTrackerTableViewViewController: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cells.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//      
//        let VolumeTrackerCellObject = cells[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MuscleGroupCell") as! VolumeTrackerTableViewCell
//        cell.setCell(cell: VolumeTrackerCellObject)
//        
// 
//           
//           return cell
//}
//}
