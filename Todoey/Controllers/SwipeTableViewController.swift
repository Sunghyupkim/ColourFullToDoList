
import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
        
    }
    
    //TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        if orientation == .right {
            // Do something
            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                
                self.updateModel(at: indexPath)
            }
            
            // 스와이프 삭제 액션 이미지 삽입
            deleteAction.image = UIImage(named: "delete-icon")
            
            return [deleteAction]
        } else {
            // Do something
            let readAction = SwipeAction(style: .destructive, title: "Read") { (action, indexPath) in
                print("아이템 읽기 완료.")
                
            }
            
            readAction.image = UIImage(named: "read-circle")
            
            return [readAction]
        }
    }
    

    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .selection
        options.expansionStyle = .destructive
        
        return options
    }
    
    func updateModel(at indexPath: IndexPath) {
        // 데이터 모델 업데이트
    }
    
    
}
