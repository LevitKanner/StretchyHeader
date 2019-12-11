//
//  ContentView.swift
//  StretchyHeader
//
//  Created by Levit Kanner on 11/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let content =
    """
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
At vero eos et accusam et justo duo dolores et ea rebum.
Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
"""
    
    
    var body: some View {
        ScrollView{
            
            //Header Section
            GeometryReader{ geometry in
                Group{
                    if geometry.frame(in: .global).minY <= 0{
                        Image("header")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width , height: geometry.size.height)
                            .offset(y: geometry.frame(in: .global).minY/9)
                            .clipped()
                    }else {
                        Image("header")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width , height: geometry.size.height + geometry.frame(in: .global).minY)
                            .clipped()
                            .offset(y: -geometry.frame(in: .global).minY)
                    }
                }
            }
            .frame(height: 400)
            
            
            //Content Section
            VStack(alignment: .leading){
                HStack{
                    Image("author")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60 , height: 60)
                        .cornerRadius(10)
                        .clipped()
                    
                    VStack(alignment: .leading){
                        Text("Article by")
                            .font(.custom("AvenirNext-Regular", size: 15))
                            .foregroundColor(.gray)
                        
                        Text("Levit Kanner")
                            .font(.custom("AvenirNext-Demibold", size: 15))
                    }
                }
                .padding(.top , 20)
                
                Text("Levit got bored and did this🤪")
                    .font(.custom("AvenirNext-Bold" , size: 30))
                    .lineLimit(nil)
                    .padding(.top , 10)
                
                Text("3 min read • 11. December 2019")
                    .font(.custom("AvenirNext-Regular" , size: 15))
                    .foregroundColor(.gray)
                    .padding(.top , 10)
                
                Text(self.content)
                    .font(.custom("AvenirNext-Regular" , size: 20))
                    .lineLimit(nil)
                    .padding(.top , 30)
                
            }
            .frame(width: 350)
            
            //Acknowledgement
            VStack(alignment: .center){
                Text("Powered by")
                    .font(.custom("AvenirNext-Regular", size: 12))
                    .foregroundColor(.gray)
                    .padding(.top , 10)
                
                Text("https://www.blckbirds.com")
                    .font(.custom("AvenirNext-Demibold", size: 12))
            }
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
