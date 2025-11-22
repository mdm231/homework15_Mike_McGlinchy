//
//  ContentView.swift
//  homework15_Mike_McGlinchy
//
//  Created by Mike McGlinchy on 11/18/25.
//

import SwiftUI

// Define the information view
struct DetailView: View {
    var body: some View {
       Text( "THAPAE GATE IS THE EASTERN AND MOST FAMOUS GATE OF " +
             "CHIANG MAI, THAILAND. IT STANDS AT THE EASTERN END " +
             "OF THE OLD WALLED CITY AND SERVES AS A MAJOR LANDMARK " +
             "AND GATHERING PLACE. IT WAS ORIGINALLY CONSTRUCTED " +
             "IN THE 13TH CENTURY.")
        .font(.title)
        .padding()
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, alignment: .leading) // Ensures the frame expands horizontally and aligns the content to the leading edge.
         //   .navigationTitle("Details")
    }
}
//Define the map view
struct MapView: View {
    var body: some View {
        Image("map")
            .resizable()
            .scaledToFit()
        Text("MAP VIEW FOR THAPAE GATE LOCATION")
            .font(.title)
            .padding()
            .multilineTextAlignment(.center)
    }
}
struct ContentView: View {
    
    @State private var showDetailView = false
    @State private var showMapView = false
    
    var body: some View {
        // Wrap the content in a NavigationStack
        NavigationStack {
            VStack {
                Image("Thapae Gate")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding()
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(10)
                    .contextMenu {
                    
                        Button(action: {
                             //Action for details
                            showDetailView = true
                        }) {
                            Label("Info", systemImage: "info.circle")
                        }
                        Button(action: {
                            // Action for Map
                            showMapView = true
                        }) {
                            Label("Map", systemImage: "map")
                        }
                        Divider()
              
                        
                    }
                
                Text("LONG PRESS PICTURE")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(.top, 10)
                
            }
            .navigationTitle("Main")
            .navigationBarTitleDisplayMode(.inline)
            //navigation link that activates when showDetailView is true
            .navigationDestination(isPresented: $showDetailView) {
                DetailView()
            }
            // Navigation link that activates when showMapView is true
                     .navigationDestination(isPresented: $showMapView) {
                         MapView()
                     }
        }
    }
}


#Preview {
    ContentView()
}
