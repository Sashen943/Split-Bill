//
//  LocationUtility.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2020/02/02.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

public class LocationUtility {

    var address = ""
    
    public func getAdressName(coords: CLLocation) {

      CLGeocoder().reverseGeocodeLocation(coords) { (placemark, error) in
              if error != nil {
                self.address = "Cannot find location"
              } else {

                  let place = placemark! as [CLPlacemark]
                  if place.count > 0 {
                      let place = placemark![0]
                      var address : String = ""
                      if place.thoroughfare != nil {
                          address = address + place.thoroughfare! + ", "
                      }
                      if place.subThoroughfare != nil {
                          address = address + place.subThoroughfare! + "\n"
                      }
                      if place.locality != nil {
                          address = address + place.locality! + " - "
                      }
                      if place.postalCode != nil {
                          address = address + place.postalCode! + "\n"
                      }
                      if place.subAdministrativeArea != nil {
                          address = address + place.subAdministrativeArea! + " - "
                      }
                      if place.country != nil {
                          address = address + place.country!
                      }

                    self.address = address
                  }
              }
          }
    }
}
