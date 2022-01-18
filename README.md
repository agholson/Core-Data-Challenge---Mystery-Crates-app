#  Crates Challenge App
This challenges you to implement concepts around Core Data. You will build an app that
allows someone to buy mystery pallets of goods. When merchandise gets returned, they often
get re-sold as bulk packages/ truck pallets, or even mystery boxes. 

See here for an example: https://bstock.com/auctions/amazon/

The crate must contain:
- Number of items
- Price
- Items (not shown to user until purchased)
- Category
- Number of items

The buyer, will then purchase the items, and be able to see the contents. 

Once the person signs out of the app, we delete his/ her user object from the Core Data store. Then, 

 # Model-View-View-Model (MVVM) Problems
 In Core Data, Apple's documentation along with many StackOverflow posts pass around a `viewContext`
 into each of the Views. This does not follow the Model-View-View-Model (MVVM) design pattern
 normally followed for iOS apps, because the Views operate on the data even though that logic should be separated.
 Therefore, in order to follow MVVM, you can use techniques described
 by Mattia Righetti in this article: https://betterprogramming.pub/swiftui-and-coredata-the-mvvm-way-ab9847cbff0f.
 
 # Useful Resources
 See here for more details about the Combine framework used throughout the above article:
  https://www.vadimbulavin.com/swift-combine-framework-tutorial-getting-started/
  
  See here for performance tips from the maker of WeTransfer's Collect app: https://www.avanderlee.com/swift/core-data-performance/.
  
  How to debug Core Data?
  https://www.avanderlee.com/debugging/core-data-debugging-xcode/
