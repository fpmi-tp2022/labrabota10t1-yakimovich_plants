import Foundation

extension URL {
    
    static func urlForWeatherFor(_ city: String) -> URL? {
        var real = String()
        if (city == "San Francisco"){
            real = "San%20Francisco"
        }
        else{
            real = city
        }
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(real)&appid=6b2d8f2c79f08a56ed4e110d0ae91e25") else {
            return nil
        }
        
        return url
        
    }
    
}
