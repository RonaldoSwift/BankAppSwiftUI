//
//  AgenciaSercanaView.swift
//  BankAppSwiftUI
//
//  Created by Ronaldo Andre on 25/01/24.
//

import SwiftUI
import MapKit
import Combine

struct AgenciaSercanaView: View {
    
    @StateObject var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 29.9792,
                                       longitude: 31.1342),
        latitudinalMeters: 1000,
        longitudinalMeters: 1000)
    
    @State private var cancelable : AnyCancellable?
    
    func showLocation() {
        cancelable = locationManager.$locations.sink { (location) in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 2000, longitudinalMeters: 2000)
        }
    }
    
    var body: some View {
        VStack {
            Map(
                coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: nil
            )
        }
        .navigationBarTitle("Ubicanos")
        .onAppear {
            showLocation()
        }
    }
}

#Preview {
    AgenciaSercanaView()
}
