//
//  SwiftCharts3D.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 17/6/25.
//

import Charts
import SwiftUI

struct SwiftCharts3D: View {
    var body: some View {
        Chart3D {
            SurfacePlot(x: "X", y: "Y", z: "Z") { x, z in
                // (Double, Double) -> Double
                (sin(5 * x) + sin(5 * z)) / 2
            }
            .foregroundStyle(.heightBased)
        }
        .frame(height: 400)
    }
}

#Preview {
    SwiftCharts3D()
}
