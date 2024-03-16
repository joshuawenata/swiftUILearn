import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(profile.username)
                .bold()
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Text("Notifications: \(profile.prefersNotification ? "On" : "Off")")
            Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")
            Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                
                ScrollView(.horizontal) {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                    .padding(.bottom)
                }
            }
            
            Divider()
            
            VStack(alignment: .leading){
                Text("Recent Hikes")
                    .font(.headline)
                
                HikeView(hike: modelData.hikes[0])
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
