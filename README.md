### Link
Here is the [link for the apk](https://github.com/gktirkha/ecom-interview/releases/download/Interview/app-release.apk)

> You may also find it in releases

### Form Questions

1. How did you approach the task?  
2. What packages did you choose and why?  
3. What architectural decisions did you make?  
4. What tradeoffs did you face?  

---

### 1. Approach to the Task

I aimed to complete the task in **3 hours**, though it eventually took around **4 hours**. I began by mapping out the app flow. Since the requirement was an e-commerce prototype, I identified three essential screens:

* **Product Listing Page** – displays all available products.
* **Product Details Page** – shows product description, ratings, and reviews.
* **Cart Page** – contains selected items, tax breakdown, and total price.

Additionally, I added a **cart indicator** to the app bar so users can see the current number of items in their cart from any screen.

This structure keeps the app simple but functional, covering the minimum features expected in an e-commerce prototype.

---

### 2. Packages Chosen and Why

* **`freezed` + `json_annotation`**
  * For data modeling.  
  * Provides immutability, copyWith, null safety, defaults, and easy JSON serialization/deserialization.  
  * Ensures maintainability and type safety.  

* **`get` (GetX)**
  * Chosen for state management, dependency injection, and routing.  
  * Lightweight, reactive, and ideal for small projects under time constraints.  
  * Avoids boilerplate compared to Provider/Bloc.  

* **`get_storage`**
  * For local persistence.  
  * Enables reading and writing data without async/await, making it simple and efficient for saving cart state.  

* **`magic_image` (self-developed package)**
  * Utility to render images from different sources (network, SVG, or file) with a single widget.  
  * Reduces repetitive image-handling code.  

* **`magic_extension` (self-developed package)**
  * Provides reusable Dart extensions for cleaner and more expressive code.  

---

### 3. Architectural Decisions

* **Pattern**: Adopted the **GetX MVC pattern (Model-View-Controller)**.
  * **Models** handle data and serialization.  
  * **Controllers** manage business logic and state (e.g., cart operations).  
  * **Views** contain only UI code, making them clean and reactive.  

* This separation improved maintainability and made state sharing (like cart state across multiple screens) straightforward.  

---

### 4. Trade-Offs

* **GetX vs. Other State Management Solutions**  
  * GetX provided a fast and lightweight solution, which was ideal under time constraints.  
  * However, for larger apps with more complex state, stricter patterns (e.g., Bloc or Riverpod) could provide better structure and scalability.  

* **Local Storage with GetStorage**  
  * Simple key-value persistence was sufficient for this prototype.  
  * Since this was a frontend-focused task, a heavier local database wasn’t necessary — in a real production app, persistence and sync would typically be handled by a backend service.  

* **Custom Packages (magic_image, magic_extension)**  
  * These improved development speed and code reusability.  
  * The trade-off is less community adoption and external support compared to widely used Flutter packages.  


---

### 5. Code Quality & Linting

To maintain consistency and enforce good practices, I used a customized **`analysis_options.yaml`**:

```yaml
include: package:flutter_lints/flutter.yaml

analyzer:
  errors:
    constant_identifier_names: ignore
    invalid_annotation_target: ignore
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"

linter:
  rules:
    - avoid_redundant_argument_values
    - exhaustive_cases
    - sort_constructors_first
    - prefer_single_quotes
    - prefer_relative_imports
    - require_trailing_commas
    - sort_pub_dependencies
    - library_private_types_in_public_api
    - dangling_library_doc_comments
````

This ensured consistent formatting, better readability, and fewer common mistakes.
