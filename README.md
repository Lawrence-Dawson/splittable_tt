Goal
----
To produce a simple iOS application demonstrating an understanding of the Swift language, network communication, JSON parsing and use of core UIKit frameworks. This coding test is based off an actual feature in the Splittable iOS application.

Task
----
 - Poll an API endpoint: https://sheetsu.com/apis/v1.0/aaf79d4763af
 - Parse the JSON response.
 - Display the `name` and image defined by `image_url` in a list.
 - Display each item returned from the API in the order defined by `sort_order`.
 - Open the URL defined by `url` in the most appropriate way inside the app.

Requirements
------------
 - The app must be written in Swift 3.0.
 - You can use whatever external code dependencies you like, ideally managed by CocoaPods.
 - The final submission should be uploaded to GitHub. Invite [edowling](https://github.com/edowling) to the repository when complete.

Stretch Goal
------------
 - Offline persistence and local storage of remote data, using whatever technology or technique you like.

Notes
-----
 - One entry in the API response does not have a URL. That entry should just display the image.
