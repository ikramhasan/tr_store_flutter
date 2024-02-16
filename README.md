# TR Store Lite

Business Requirements:

- [x] The app should have pages to display
  1. Products page
  2. Products details page
  3. Shopping cart
- [x] The app should allow users to access the shopping cart page from anywhere on
      the app by placing a Cart icon on the top right corner of all pages.
- [x] User should be able to click on items on the Product page and see their details
- [x] The product page should allow users to add items to the cart
- [x] The Product Details page should allow users to add items to the cart

Technical Requirements:

- [x] You must use a database, which should be a standard one, such as Sqflite or
      Drift. [Used Drift]
- [x] A standard state management library mentioned in the Flutter documentation
      should be used, such as Provider, flutter_bloc, GetX, riverpod, etc. [Used flutter_bloc]
- [x] At Least 1 use of the stream/Observable and shimmer loading effect. [Stream can be found in `cart_repository.dart` and `cart_cubit.dart` and shimmer effect can be seen on the products page]

Note:

- Used [https://fakestoreapi.com](https://fakestoreapi.com) instead of [https://jsonplaceholder.org](https://jsonplaceholder.org)
  since it aligns with the app better and there was no hard limits on which API to use
- In shopping cart, each items will be duplicated if added more than once. Did not implement quantity system since it was not specified.
