//
//  ContentView.swift
//  Heatsafe
//
//  Created by Kittiapakorn Seenak on 9/2/2568 BE.
//

import SwiftUI
import CoreLocation
import MessageUI

struct ContentView: View {
    @State private var isSheetPresented = false
    private let locationManager = LocationManager()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            HealthView()
                .tabItem {
                    Label("Health", systemImage: "heart.fill")
                }
            
            DeviceView()
                .tabItem {
                    Label("Device", systemImage: "applewatch")
                }
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .accentColor(.cyan)
        .sheet(isPresented: $isSheetPresented) {
            SheetView(locationManager: locationManager)
        }
        .onShake {
            isSheetPresented = true
        }
    }
}

#Preview(body: {
    SheetView(locationManager: LocationManager())
})

// ✅ Sheet ที่จะแสดงขึ้น
struct SheetView: View {
    @ObservedObject var locationManager: LocationManager
    @Environment(\.dismiss) var dismiss
    @State private var isShowingMessage = false
    
    var body: some View {
        VStack {
            Text("🚨 SOS Emergency 🚨")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.red)
                .padding()
            
            Text("Share your location or call for help")
                .font(.headline)
                .padding(.bottom, 10)
            
            // 🔴 ปุ่มโทรฉุกเฉิน
            Button(action: {
                callEmergencyNumber()
            }) {
                Text("Call Emergency")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)  // ทำให้ปุ่มเต็มความกว้าง
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.horizontal)  // ให้เว้นขอบด้านข้างเท่า ๆ กัน
            
            Button(action: {
                isShowingMessage = true
            }) {
                Text("Send SOS via iMessage")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)  // ทำให้ปุ่มเต็มความกว้าง
                    .background(Color.cyan)
                    .cornerRadius(10)
            }
            .padding(.horizontal)  // ให้เว้นขอบด้านข้างเท่า ๆ กัน
            
            Spacer()
                .sheet(isPresented: $isShowingMessage) {
                    MessageComposeView(location: locationManager.lastLocation)
                }
        }
        .onAppear {
            locationManager.requestLocation()
        }
        .presentationDetents([.medium, .large])
        .padding(.top,30)
    }
    
    // ฟังก์ชันโทรฉุกเฉิน
    func callEmergencyNumber() {
        if let url = URL(string: "tel://0956542656"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

// ✅ ส่ง iMessage (MessageUI)
struct MessageComposeView: UIViewControllerRepresentable {
    var location: CLLocationCoordinate2D?
    
    func makeUIViewController(context: Context) -> MFMessageComposeViewController {
        let controller = MFMessageComposeViewController()
        controller.recipients = ["0956542656"]  // เปลี่ยนเป็นเบอร์โทรของผู้ช่วยฉุกเฉิน
        controller.body = createSOSMessage()
        controller.messageComposeDelegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    private func createSOSMessage() -> String {
        if let loc = location {
            let mapLink = "https://maps.apple.com/?q=\(loc.latitude),\(loc.longitude)"
            return "🚨 SOS Emergency! My location: \(mapLink)"
        } else {
            return "🚨 SOS Emergency! Unable to fetch location."
        }
    }
    
}

// ✅ ตัวจัดการตำแหน่ง (CoreLocation)
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var lastLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.lastLocation = location.coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("⚠️ Location Error: \(error.localizedDescription)")
    }
}
