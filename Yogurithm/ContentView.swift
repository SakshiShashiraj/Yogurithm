import SwiftUI
import SwiftData


struct ContentView: View {
    @Query var yogurts: [Yogurt]
    
    var brands: [String] {
        Set(yogurts.map { $0.brand }).sorted()
    }
    
    let columns = [GridItem(.flexible(), spacing: 15), GridItem(.flexible(), spacing: 15)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(brands, id: \ .self) { brand in
                        NavigationLink(destination: BrandDetailView(brand: brand, yogurts: yogurts)) {
                            HStack {
                                Image(systemName: "snowflake") // Yogurt carton icon
                                    .font(.title)
                                    .foregroundColor(.blue)
                                
                                Text(brand)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .padding(.leading, 10)
                                Spacer()
                            }
                            .padding()
                            .frame(height: 80)
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                            .shadow(radius: 3)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Yogurt Brands")
        }
    }
}
