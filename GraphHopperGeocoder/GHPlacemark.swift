import CoreLocation

open class Placemark {
    public let coordinate: CLLocationCoordinate2D
    public let osmId: Int
    public let osmType: String
    public let osmKey: String
    public let osmValue: String
    public let name: String
    public let housenumber: String
    public let street: String
    public let postcode: String
    public let city: String
    public let state: String
    public let country: String

    internal init(_ coordinate: CLLocationCoordinate2D, osmId: Int, osmType: String, osmKey: String, osmValue: String, name: String, housenumber: String, street: String, postcode: String, city: String, state: String, country: String) {
        self.coordinate = coordinate
        self.osmId = osmId
        self.osmType = osmType
        self.osmKey = osmKey
        self.osmValue = osmValue
        self.name = name
        self.housenumber = housenumber
        self.street = street
        self.postcode = postcode
        self.city = city
        self.state = state
        self.country = country
    }

    public convenience init?(json: JSONDictionary) {
        var coordinate = CLLocationCoordinate2D()

        if let pointJson = json["point"] as? JSONDictionary {
            if let lat = pointJson["lat"] as? CLLocationDegrees, let lng = pointJson["lng"] as? CLLocationDegrees {
                coordinate.latitude = lat
                coordinate.longitude = lng
            }
        }

        let osmId = json["osmId"] as? Int ?? 0
        let osmType = json["osmType"] as? String ?? ""
        let osmKey = json["osmKey"] as? String ?? ""
        let osmValue = json["osmValue"] as? String ?? ""
        let name = json["name"] as? String ?? ""
        let housenumber = json["housenumber"] as? String ?? ""
        let street = json["street"] as? String ?? ""
        let postcode = json["postcode"] as? String ?? ""
        let city = json["city"] as? String ?? ""
        let state = json["state"] as? String ?? ""
        let country = json["country"] as? String ?? ""

        self.init(coordinate, osmId: osmId, osmType: osmType, osmKey: osmKey, osmValue: osmValue, name: name, housenumber: housenumber, street: street, postcode: postcode, city: city, state: state, country: country)
    }
}
