//
//  ContentView.swift
//  gameproject
//
//  Created by Lou on 2023/2/15.
//

import SwiftUI

struct ContentView: View {
    let numbers = [[["3","R"],["6","B"],["9","R"],["12","R"],["15","B"],["18","R"],["21","R"],["24","B"],["27","R"],["30","R"],["33","B"],["36","R"],["2to1","Y"]],[["2","B"],["5","R"],["8","B"],["11","B"],["14","R"],["17","B"],["20","B"],["23","R"],["26","B"],["29","B"],["32","R"],["35","B"],["2to1","Y"]],[["1","R"],["4","B"],["7","R"],["10","B"],["13","B"],["16","R"],["19","R"],["22","B"],["25","R"],["28","B"],["31","B"],["34","R"],["2to1","Y"]]]
    let bet = [["35","35","35","35","35","35","35","35","35","35","35","35","2"],["35","35","35","35","35","35","35","35","35","35","35","35","2"],["35","35","35","35","35","35","35","35","35","35","35","35","2"]]
    let bet2 = [["35","35","35","35","35","35","35","35","35","35","35"],["35","35","35","35","35","35","35","35","35","35","35"]]
    @State var onbet = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @State var images = ["empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","empty"]
    @State var chip = 1000
    @State var totalbet = 0
    @State var money = 3000000
    @State private var showSecondView = false
    @State private var winarray :Array<Int> = []
    var body: some View {
        ZStack{
            Image("desk")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,
                       maxWidth: .infinity, minHeight: 0,
                       maxHeight: .infinity)
                .ignoresSafeArea()
            VStack(spacing: 0){
                HStack{
                    Text("籌碼總數為\(money)")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .frame(maxWidth:300, maxHeight: 56.4)
                    Text("本次下注共\(totalbet)")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .frame(maxWidth:300, maxHeight: 56.4)
                }
                ZStack{
                    VStack(spacing:0) {
                        ForEach(0..<3,id: \.self) { row in
                            HStack(spacing:0){
                                ForEach(0..<13, id: \.self) { index in
                                    ZStack{
                                        Text("\(numbers[row][index][0])")
                                            .fontWeight(.heavy)
                                            .foregroundColor(Color.white)
                                            .frame(maxWidth: 56.4, maxHeight: 56.4)
                                            .background(numbers[row][index][1] == "R" ? Color.red : numbers[row][index][1] == "B" ? Color.black : Color(white:0,opacity: 0))
                                            .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                        Image(images[(index+1)*3-row])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxWidth: 25, maxHeight: 25)
                                            .onTapGesture {
                                                addbet(number:(index+1)*3-row)
                                                
                                            }
                                    }
                                }
                            }
                        }
                    }
                    VStack(spacing:27) {
                        ForEach(0..<3,id: \.self) { row in
                            HStack(spacing:27){
                                ForEach(0..<11, id: \.self) { index in
                                    ZStack{
                                        Text(/*"\((index+1)*3-row+39)"*/"")
                                            .frame(maxWidth: 29, maxHeight: 25)
                                            .background(Color.green.opacity(0))
                                            .onTapGesture {
                                                addbet(number:(index+1)*3-row+39)
                                            }
                                        Image(images[(index+1)*3-row+39])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxWidth: 25, maxHeight: 25)
                                            .onTapGesture {
                                                addbet(number:(index+1)*3-row+39)
                                                
                                            }
                                    }
                                }
                            }.offset(x:-28.5)
                        }
                    }
                    VStack(spacing:27) {
                        ForEach(0..<3,id: \.self) { row in
                            HStack(spacing:27){
                                ForEach(0..<12, id: \.self) { index in
                                    ZStack{
                                        Text(/*"\((index+1)*3-row+72)"*/"")
                                            .frame(maxWidth: 29, maxHeight: 25)
                                            .background(Color.green.opacity(0))
                                            .onTapGesture {
                                                addbet(number:(index+1)*3-row+72)
                                            }
                                        Image(images[(index+1)*3-row+72])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxWidth: 25, maxHeight: 25)
                                            .onTapGesture {
                                                addbet(number:(index+1)*3-row+72)
                                                
                                            }
                                    }
                                }
                            }.offset(x:-28.5,y:26)
                        }
                    }
                    VStack(spacing:27) {
                        ForEach(0..<2,id: \.self) { row in
                            HStack(spacing:27){
                                ForEach(0..<11, id: \.self) { index in
                                    ZStack{
                                        Text(/*"\((index+1)*2-row+108)"*/"")
                                            .frame(maxWidth: 29, maxHeight: 25)
                                            .background(Color.green.opacity(0))
                                            .onTapGesture {
                                                addbet(number:(index+1)*2-row+108)
                                            }
                                        Image(images[(index+1)*2-row+108])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxWidth: 25, maxHeight: 25)
                                            .onTapGesture {
                                                addbet(number:(index+1)*2-row+108)
                                                
                                            }
                                    }
                                }
                            }.offset(x:-28.5)
                        }
                    }
                    
                }
                HStack(spacing:0){
                    ZStack{
                        Text("1st 12")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 225.6, maxHeight: 56.4)
                            .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                addbet(number:131)
                            }
                        Image(images[131])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                addbet(number:131)
                                
                            }
                    }
                    ZStack{
                        Text("2nd 12")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 225.6, maxHeight: 56.4)
                            .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                addbet(number:132)
                            }
                        Image(images[132])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                addbet(number:132)
                                
                            }
                    }
                    ZStack{
                        
                        Text("3rd 12")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 225.6, maxHeight: 56.4)
                            .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                addbet(number:133)
                                
                            }
                        Image(images[133])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                addbet(number:133)
                                
                            }
                    }
                }.offset(x:-28.5)
                HStack(spacing:0){
                    ZStack{
                        Text("1 - 18")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 112.8, maxHeight: 56.4)
                            .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                addbet(number:134)
                            }
                        Image(images[134])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                addbet(number:134)
                                
                            }
                    }
                    ZStack{
                        Text("Even")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 112.8, maxHeight: 56.4)
                            .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                addbet(number:135)
                            }
                        Image(images[135])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                addbet(number:135)
                            }
                    }
                    ZStack{
                        Color.red
                            .clipShape(Diamond())
                            .scaleEffect(0.8)
                            .frame(maxWidth: 112.8, maxHeight: 56.4)
                            .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                addbet(number:136)
                            }
                        Image(images[136])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                addbet(number:136)
                            }
                    }
                    ZStack{
                        Color.black
                            .clipShape(Diamond())
                            .scaleEffect(0.8)
                            .frame(maxWidth: 112.8, maxHeight: 56.4)
                            .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                addbet(number:137)
                            }
                        Image(images[137])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                addbet(number:137)
                            }
                    }
                    ZStack{
                        Text("Odd")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 112.8, maxHeight: 56.4)
                            .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                addbet(number:138)
                            }
                        Image(images[138])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                addbet(number:138)
                            }
                    }
                    ZStack{
                        Text("19 - 36")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 112.8, maxHeight: 56.4)
                            .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                addbet(number:139)
                            }
                        Image(images[139])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                addbet(number:139)
                            }
                    }
                }.offset(x:-28.5)
                HStack(spacing:0){
                    Group{
                        Image("chip1")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .onTapGesture{
                                chip=1000
                            }
                        Text("1K")
                            .offset(x:-36)
                            .fontWeight(.heavy)
                        Image("chip2")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .onTapGesture{
                                chip=5000
                            }
                        Text("5K")
                            .offset(x:-37)
                            .fontWeight(.heavy)
                        Image("chip3")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .onTapGesture{
                                chip=10000
                            }
                        Text("10K")
                            .offset(x:-42)
                            .fontWeight(.heavy)
                        Image("chip4")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .offset(y:2)
                            .onTapGesture{
                                chip=50000
                            }
                        Text("50K")
                            .offset(x:-42)
                            .fontWeight(.heavy)
                        Image("chip5")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .onTapGesture{
                                chip=100000
                            }
                        Text("100K")
                            .offset(x:-47)
                            .fontWeight(.heavy)
                    }.offset(x:-110)
                    Image("clearbets")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .offset(x:-70)
                        .onTapGesture{
                            clearbet()
                        }
                    Image("spin")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .onTapGesture{
                            showSecondView=true
                            money-=totalbet
                        }.fullScreenCover(isPresented: $showSecondView){
                            RollerView(showSecondView: $showSecondView, money: $money,onbet:$onbet)
                        }
                }.offset(x:30,y:10)
            }
            VStack(spacing:0){
                ZStack{
                    Text("0")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 56.4, maxHeight: 56.4)
                        .background(Color(white:0,opacity: 0))
                        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            addbet(number:0)
                        }
                    Image(images[0])
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 25, maxHeight: 25)
                        .onTapGesture {
                            addbet(number:0)
                            
                        }
                }
                ZStack{
                    Text("00")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 56.4, maxHeight: 56.4)
                        .background(Color(white:0,opacity: 0))
                        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            addbet(number:140)
                        }
                    Image(images[140])
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 25, maxHeight: 25)
                        .onTapGesture {
                            addbet(number:140)
                            
                        }
                }
            }.offset(x:-392,y:-50)
        }
    }
    func addbet(number:Int){
        if money >= totalbet+chip{
            onbet[number]+=chip
            totalbet+=chip
            switch(onbet[number]){
            case 1000..<5000:
                images[number]="chip1"
            case 5000..<10000:
                images[number]="chip2"
            case 10000..<50000:
                images[number]="chip3"
            case 50000..<100000:
                images[number]="chip4"
            case 100000...:
                images[number]="chip5"
            default:
                images[number]="empty"
            }
            
        }
    }
    func clearbet(){
        for index in 0..<onbet.count{
            onbet[index]=0
        }
        for index in 0..<images.count{
            images[index]="empty"
        }
        totalbet=0
    }
}
struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            path.addLines([
                CGPoint(x: rect.midX, y: 0),
                CGPoint(x: rect.maxX, y: rect.midY),
                CGPoint(x: rect.midX, y: rect.maxY),
                CGPoint(x: 0, y: rect.midY)
            ])
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
/*
 var prize = [[0],[1,37,40,73,74,109,131,134,138,136],[2,38,41,73,74,75,109,110,131,134,135,137],[3,39,42,73,75,110,131,134,138,136],[4,37,40,43,76,77,109,111,131,134,135,137],[5,38,41,44,76,77,78,109,110,111,112,131,134,138,136],[6,39,42,45,76,78,110,112,131,134,135,137],[7,37,43,46,79,80,111,113,131,134,138,136],[8,38,44,47,79,80,81,111,112,113,114,131,134,135,137],[9,39,45,48,79,81,112,114,131,134,138,136],[10,37,46,49,82,83,113,115,131,134,135,137],[11,38,47,50,82,83,84,113,114,115,116,131,134,138,137],[12,39,48,51,82,84,114,116,131,134,135,136],[13,37,49,52,85,86,115,117,132,134,138,137],[14,38,50,53,85,86,87,115,116,117,118,132,134,135,136],[15,39,51,54,85,87,116,118,132,134,138,137],[16,37,52,55,88,89,117,119,132,134,135,136],[17,38,53,56,88,89,90,117,118,119,120,132,134,138,137],[18,39,54,57,88,90,118,120,132,134,135,136],[19,37,55,58,91,92,119,121,132,139,138,136],[20,38,56,59,91,92,93,119,120,121,122,132,139,135,137],[21,39,57,60,91,93,120,122,132,139,138,136],[22,37,58,61,94,95,121,123,132,139,135,137],[23,38,59,62,94,95,96,121,122,123,124,132,139,138,136],[24,39,60,63,94,96,122,124,132,139,135,137],[25,37,61,64,97,98,123,125,133,139,138,136],[26,38,62,65,97,98,99,123,124,125,126,133,139,135,137],[27,39,63,66,97,99,124,126,133,139,138,136],[28,37,64,67,100,101,125,127,133,139,135,137],[29,38,65,68,100,101,102,125,126,127,128,133,139,138,137],[30,39,66,69,100,102,126,128,133,139,135,136],[31,37,67,70,103,104,127,129,133,139,138,137],[32,38,68,71,103,104,105,127,128,129,130,133,139,135,136],[33,39,69,72,103,105,128,130,133,139,138,137],[34,37,70,106,107,129,133,139,135,136],[35,38,71,106,107,108,129,130,133,139,138,137],[36,39,72,106,108,130,133,139,135,136],[140]]
 
 
 
 
 */
