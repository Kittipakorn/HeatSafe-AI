import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    @StateObject private var locationManager = LocationManagerr()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        locationManager.requestLocation()
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        if let pin = locationManager.generatedPin {
            uiView.addAnnotation(pin)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation { return nil }
            
            let identifier = "CustomIcon"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                
                // ✅ กำหนดภาพพื้นหลังสำหรับ Apple Watch Icon
                let circleView = UIView()
                circleView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                circleView.backgroundColor = UIColor.cyan
                circleView.layer.cornerRadius = 25 // ทำให้เป็นวงกลม
                circleView.layer.masksToBounds = true
                
                let iconImageView = UIImageView(image: UIImage(systemName: "applewatch"))
                iconImageView.frame = CGRect(x: 9, y:9, width: 30, height: 30) // ✅ วาง icon ไว้ด้านบน
                iconImageView.contentMode = .scaleAspectFit
                
                circleView.addSubview(iconImageView) // ✅ เพิ่มไอคอนไว้ด้านบนของพื้นหลัง
                
                annotationView?.addSubview(circleView)
                annotationView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
    }
}

// ✅ จัดการตำแหน่งของผู้ใช้และสร้าง Pin แบบสุ่มในระยะ 100 เมตร
@MainActor
class LocationManagerr: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var lastLocation: CLLocationCoordinate2D?
    @Published var generatedPin: MKPointAnnotation?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.lastLocation = location.coordinate
            self.manager.stopUpdatingLocation()
            self.generateRandomPin(center: location.coordinate) // ✅ สุ่มตำแหน่ง Pin ในระยะ 100m
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("❌ Error updating location: \(error.localizedDescription)")
    }
    
    /// ✅ ฟังก์ชันสุ่มตำแหน่ง Pin ภายในรัศมี 100 เมตร
    func generateRandomPin(center: CLLocationCoordinate2D) {
        let radius: Double = 100 // รัศมี 100 เมตร
        let randomCoordinate = randomCoordinate(from: center, radius: radius)
        
        let pin = MKPointAnnotation()
        pin.coordinate = randomCoordinate
        pin.title = "📍 จุดสุ่มภายใน 100 ม."
        self.generatedPin = pin
    }
    
    /// ✅ ฟังก์ชันสุ่มพิกัดในระยะห่างจากศูนย์กลาง
    func randomCoordinate(from center: CLLocationCoordinate2D, radius: Double) -> CLLocationCoordinate2D {
        let radiusInDegrees = radius / 111000.0 // แปลงเมตรเป็นองศา
        let angle = Double.random(in: 0...(2 * .pi)) // สุ่มมุม
        
        let newLat = center.latitude + (radiusInDegrees * cos(angle))
        let newLon = center.longitude + (radiusInDegrees * sin(angle))
        
        return CLLocationCoordinate2D(latitude: newLat, longitude: newLon)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
