//
//  LabelView.swift
//  BarChart
//
//  Created by Samu András on 2020. 01. 08..
//  Copyright © 2020. Samu András. All rights reserved.
//

import SwiftUI

struct LabelView: View {
    @Binding var arrowOffset: CGFloat
    @Binding var title:String
    var body: some View {
        VStack{
            ArrowUp().fill(Color.gray).frame(width: 20, height: 12, alignment: .center).shadow(color: Color.gray, radius: 6, x: 0, y: 0).offset(x: getArrowOffset(offset:self.arrowOffset), y: 12)
            ZStack{
                Text(self.title).font(.footnote).foregroundColor(Color.white).bold().padding(8).frame(width: UIScreen.main.bounds.width - 36).background(Color.gray).cornerRadius(6)
            }
        }
    }
    
    func getArrowOffset(offset: CGFloat) -> CGFloat {
        return max(-(UIScreen.main.bounds.width/2) + 40, min((UIScreen.main.bounds.width/2) - 40, offset))
    }
}

struct ArrowUp: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width/2, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.closeSubpath()
        return path
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(arrowOffset: .constant(0), title: .constant("Tesla model 3"))
    }
}
