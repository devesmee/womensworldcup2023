# Womens World Cup 2023
iOS app that allows users to explore all sorts of things related to the Womens World Cup 2023.

## Schemes
This app contains two different schemes, one retrieves the data from Firebase, the other retrieves it from the JSON files bundled with the app.

If you wish to use the Firebase option, you will need to setup a Realtime Database yourself and include the `GoogleService-info.plist` file in the project. ⚠️ The app will crash if you use the Firebase scheme and do not supply a `GoogleService-info.plist`.
Make sure that the data inside the Database corresponds to the models defined in the app, feel free to copy the database data from the bundled JSON files.

The scheme that uses the JSON files to retrieve the data can be used from the get-go without any configuration.

## Features
### Matches overview
Overview of all matches played at the Womens World Cup 2023. They are organized by date and you can automatically scroll to the desired date by selecting it from the horizontal scroll bar.

### Groups overview
Overview of all groups at the Womens World Cup 2023. It displays the ranking of each country in its group, as well as matches played, goal difference and points.

### Teams
Overview of all teams that competed at the Womens World Cup 2023.

### Stadium explorer
Users can navigate the map and view all stadiums which were used during the Womens World Cup 2023.

#### Stadium details
When clicking on a stadium, users will see details of the specific stadium, as well as the matches which were played there. You can always automatically direct a route to the stadium via Apple Maps by clicking on the car icon.

### Favourites
Users can favourite a stadium or team to easily view its detailed info.

## ⚠️ Disclaimer ⚠️
I am in no way affliated with FIFA or any of the teams included in this app. This app was built purely for personal purposes and to gain more experience building apps with SwiftUI. I do not own any of the images and all credit goes to their respective owners.
