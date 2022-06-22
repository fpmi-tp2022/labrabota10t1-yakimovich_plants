import UIKit

struct PlantModel{
    var mainImage : UIImage
    var plantName: String
    static func fetchPlants() -> [PlantModel]{
        let path = Bundle.main.path(forResource: "plantsData", ofType: ".plist")
        let dictionary = NSDictionary(contentsOfFile: path!)
        let data = dictionary?.object(forKey: "plants") as? [NSDictionary]
        let n : Int = data?.count ?? 0
        var arr = [PlantModel]()
        var i : Int = 0
        while(i < n){
            let imgName = data?[i].object(forKey: "image") as! String
            let name = data?[i].object(forKey: "name") as! String
            guard let img = UIImage(named: imgName as! String) else { return [] }
            let p1 = PlantModel(mainImage: img, plantName: name as! String)
            arr.append(p1)
            i += 1

        }
        return arr
        let image = UIImage(named: "f1")!
        let f1 = PlantModel(mainImage: image, plantName: "ebannyi kust")
        return [f1, f1, f1, f1, f1, f1, f1, f1, f1, f1]
    }
}

struct Constants{
    static let upDistance: CGFloat = 10
    
}
