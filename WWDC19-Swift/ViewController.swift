import UIKit
import GoogleMaps

class ViewController: UITableViewController {
    
    let list:[String] = ["Avatar","MapView","LandmarkDetail"]
    var dataList: [Landmark] = Array()
    var model:Landmark = Landmark()
    
    override func viewDidLoad() {
        do {
            let path = Bundle.main.path(forResource: "landmarkData", ofType: "json")
            
            let data = try Data(contentsOf: URL(fileURLWithPath: path!))
            
            let jsonDecoder = JSONDecoder()
            self.dataList = try jsonDecoder.decode([Landmark].self, from: data)
            self.model = dataList[0]
        } catch let error  {
            print("Error:\(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath)
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = list[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "avatarShow", sender: self)
        case 1:
            self.performSegue(withIdentifier: "mapViewShow", sender: self)
        case 2:
            self.performSegue(withIdentifier: "landmarkDetail", sender: self)
        default:
            self.performSegue(withIdentifier: "landmarkDetail", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "landmarkDetail":
                if let vc = segue.destination as? LandmarkDetailController {
                    vc.dataList = self.dataList
                    vc.model = self.model
                }
            default: break
            }
        }
    }
    
}

struct Landmark: Codable {
    var id: Int?
    var name: String?
    var category: String?
    var city: String?
    var state: String?
    var isFeatured: Bool?
    var isFavorite: Bool?
    var park: String?
    var imageName: String?
    var coordinates: Coordinate?
}

struct Coordinate: Codable {
    var longitude: Double?
    var latitude: Double?
}

