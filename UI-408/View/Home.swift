//
//  Home.swift
//  UI-408
//
//  Created by nyannyan0328 on 2021/12/30.
//

import SwiftUI

struct Home: View {
    @State var currentIndex : Int = 0
    @State var textColor : Color = .white
    
    @State var bgOffset : CGFloat = 0
    
    @State var textAnimation : Bool = false
    @State var imageAnimation : Bool = false
    var body: some View {
        VStack{
            
            let small = getRect().height < 750
            
            
            
            Text(foods[currentIndex].itemTitle)
                .font(.largeTitle.bold())
                .frame(maxWidth:.infinity,alignment: .leading)
                .frame(height:100)
                .offset(y: textAnimation ? 200 : 0)
                .clipped()
                .animation(.easeInOut, value: textAnimation)
            
            
            
            HStack(spacing:18){
                
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    
                    Label {
                        Text("1hour")
                        
                    } icon: {
                        
                        Image(systemName: "flame")
                            .frame(height: 30)
                    }
                    
                    Label {
                        
                        Text("40")
                        
                    } icon: {
                        
                        Image(systemName: "bookmark")
                            .frame(width:30)

                    }

                    
                    
                    Label {
                        
                        Text("Safety")
                        
                    } icon: {
                        
                        Image(systemName: "safari")
                            .frame(width:30)

                    }

                    
                    
                    Label {
                        
                        Text("Easy")
                        
                    } icon: {
                        
                        Image(systemName: "bolt")
                            .frame(width:30)

                    }
                    
                    Label {
                        
                        Text("Health")
                        
                    } icon: {
                        
                        Image(systemName: "drop")
                            .frame(width:30)

                    }

                    
                    
                    
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                
                
                GeometryReader{proxy in
                    
                    
                    let size = proxy.size
                    
                    
                    Image(foods[currentIndex].itemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .background(
                        
                        
                        
                            Circle()
                                .trim(from: 0.3, to: 1)
                                .stroke(
                                
                                
                                
                                
                                LinearGradient(colors: [
                                    
                                    textColor,
                                    textColor.opacity(0.3),
                                    textColor.opacity(0.1)
                                    
                                
                                
                                ], startPoint: .top, endPoint: .bottom),lineWidth: 2.3
                                )
                                .padding(-15)
                                .rotationEffect(.init(degrees: -90))
                                .opacity(imageAnimation ? 0 : 1)
                        
                        
                        
                        )
                        .frame(width: size.width, height: size.width * (small ? 1.5 : 1.8))
                        .frame(maxHeight: .infinity)
                        .rotationEffect(.init(degrees: imageAnimation ? 360 : 0))
                        .offset(x: 60)
                    
                    
                }
                .frame(height: (getRect().width / 2) * (small ? 1.5 : 2))
                
              
                
                
                
            }
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.")
                .font(.callout)
                .foregroundStyle(.gray)
                .lineSpacing(8)
                .lineLimit(3)
                .offset(y: textAnimation ? 200 : 0)
                .clipped()
                .animation(.easeInOut, value: textAnimation)
                .padding(.vertical)
            
            
            
            
            
            
        }
        .padding()
        .foregroundColor(textColor)
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(
        
        
        
        
            GeometryReader{proxy in
                
                let heigth = proxy.size.height
                
                
                LazyVStack(spacing:0){
                    
                    
                    
                    ForEach(foods.indices,id:\.self){index in
                        
                        
                        if index % 2 == 0{
                            
                           LinearGradient(colors: [
                           
                           
                           
                            Color.red,
                            Color.green,
                            Color.orange,
                            .purple
                           
                           ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                .frame(height:heigth)
                        }
                        else{
                            
                            
                            Color.white
                                .frame(height:heigth)
                        }
                        
                        
                    }
                    
                   
                    
                    
                }
                .offset(y: bgOffset)
            }
            
                .ignoresSafeArea()
               
        
        
        
        )
        .gesture(
        
        
        DragGesture()
            .onEnded({ value in
            
                
                let translation = value.translation.height
                
                
                if translation < 0 && -translation >  50 && (currentIndex < (foods.count - 1)){
                    
                    AnimatedSlider(moveUp: true)
                    
                    
                }
                
                if translation > 0 && translation > 50 && currentIndex > 0{
                    
                    AnimatedSlider(moveUp: false)
                    
                }
                
              
                
            })
        
        
        )
        
    }
    
    func AnimatedSlider(moveUp : Bool = true){
        
    
        textAnimation = true
        
        
        withAnimation(.easeInOut(duration: 1.3)){
            
            
            bgOffset += (moveUp ? -getRect().height : getRect().height)
            
        }
        
        withAnimation(.interactiveSpring(response: 1.6, dampingFraction: 0.8, blendDuration: 0.8)){
            
            
            imageAnimation = true
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            textAnimation = false
            
            
            
            currentIndex = (moveUp ? (currentIndex + 1) : (currentIndex - 1))
            
            
            withAnimation(.easeInOut){
                
                textColor = (textColor == .black ? .white : .black)
                
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                
                
                imageAnimation = false
                
                
            }
            
            
        }
        
        
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
           
    }
}
