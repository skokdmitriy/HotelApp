//
//  HotelViewModel.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI
import Combine

final class HotelViewModel: ObservableObject {
    @Published var details: [DetailsSectionModel] = []


    init() {
        makeDetails()
    }

//    private func loadHotel() {
//    }

    private func makeDetails() {
        details.append(DetailsSectionModel(icon: Icons.happy,
                                           title: "Удобства",
                                           subtitle: "Самое необходимое")
        )
        details.append(DetailsSectionModel(icon: Icons.tick,
                                           title: "Что включено",
                                           subtitle: "Самое необходимое")
        )
        details.append(DetailsSectionModel(icon: Icons.close,
                                           title: "Что не включено",
                                           subtitle: "Самое необходимое"))
    }
}

