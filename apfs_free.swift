// https://developer.apple.com/documentation/foundation/urlresourcekey/checking_volume_storage_capacity

import Foundation

func getAvailableCapacityAsJSON() {
    let bootVolumeURL = URL(fileURLWithPath: "/")
    do {
        let resourceValues = try bootVolumeURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey, .volumeTotalCapacityKey])
        if let availableCapacity = resourceValues.volumeAvailableCapacityForImportantUsage,
           let totalCapacity = resourceValues.volumeTotalCapacity {
            let availablePercentage = Int((Double(availableCapacity) / Double(totalCapacity)) * 100)
            let jsonString = """
            {
                "availableBytes": \(availableCapacity),
                "availablePercent": \(availablePercentage)
            }
            """
            print(jsonString)
        } else {
            print("Unable to retrieve volumeAvailableCapacityForImportantUsage.")
        }
    } catch {
        print("Error retrieving volume resource values: \(error)")
    }
}

getAvailableCapacityAsJSON()
