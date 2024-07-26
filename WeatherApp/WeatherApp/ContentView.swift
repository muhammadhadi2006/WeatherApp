//
//  ContentView.swift
//  WeatherApp
//
//  Created by Hadi on 26/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, Weather App")
                    
                    NavigationLink {
                        WeatherView()
                    } label: {
                        Text("Open Weather Deatils")
                    }

                }
                .padding()
            }
            
        }
    }
}
