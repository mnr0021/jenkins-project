1. Initial Code (Provided by you)
The starting point was a NexusShop demo with:

A header, hero, categories, products grid, flash deal, testimonials, newsletter, footer

Basic pastel-ish styling with earthy tones (#fafaf8, #1a1a2e, #e07a5f)

A critical bug: localStorage access at the top of the script threw a SecurityError in sandboxed previews, aborting the whole script — so nothing rendered

2. UI Restyle → Pastel Theme
Rebranded from "NexusShop" → "Petal & Stem" with a full pastel palette:

Token	New Value	Purpose
--bg	#fdf6f0	Soft cream background
--accent	#f4a2b2	Pastel pink
--accent-light	#fce4e8	Light blush
--surface	#f5eef7	Lavender mist
--success	#a8d8c8	Pastel mint
--warning	#fde2b8	Pastel apricot
Larger radii (16px → 20px), softer shadows with lavender tint

Brand icon changed to a leaf (fa-leaf)

Hero background turned into a pastel gradient (lavender → blush → sky blue) with a faded photo overlay

Timer boxes, buttons, and category icons all restyled to pastel

Footer, newsletter, and testimonial cards recolored

3. Fixed the "Missing Items" Bug
Root cause: localStorage.getItem(...) at the top of the script threw a SecurityError in sandboxed iframes → entire script aborted → empty grids.

Fix: Added a safe storage wrapper:

js
const storage = (function () {
  let available = true;
  try { localStorage.setItem('__t__', '__t__'); localStorage.removeItem('__t__'); }
  catch (e) { available = false; }
  const memory = {};
  return {
    get(k, fb) { /* tries localStorage, falls back to memory */ },
    set(k, v)  { /* tries localStorage, falls back to memory */ }
  };
})();
All 8 products, 6 categories, and 4 testimonials now render on every load, even in restricted environments. console.log at init confirms: products rendered: 8.

4. Working Wishlist Button
Each product card gets a heart button with .active state and a pop animation

Clicking toggles add/remove, saves via storage.set('petalWishlist', ...)

Header heart fills and shows a count badge when items are saved

Mobile menu shows a wishlist count pill

Toast notifications ("iPhone 14 Pro Max added to wishlist") slide up from the bottom

Header wishlist icon click shows a summary toast of saved items

5. Checkout Page (Triggered by Cart Icon)
Clicking the cart icon now redirects to a full checkout view.

SPA-style views (hidden <section>s toggled by .active):

#shopView — the storefront

#checkoutView — cart + form + summary

#successView — order confirmation

Cart state is an array [{ id, qty }] persisted to storage.

Cart panel
Per-item rows with thumbnail, title, unit price

Quantity steppers (+ / −) that update totals live

Remove button per line

Empty state with "Browse Products" CTA

Checkout form
Contact info (email)

Shipping address (name, street, city, ZIP, country)

Payment method selector: Card / PayPal / Apple Pay (Card shows extra fields)

Required field validation with red borders + auto-scroll to first invalid field

Order summary (sticky sidebar)
Subtotal, Shipping (free), Tax (8%), Total

Promo codes: PETAL10 (10% off), STEM20 (20% off)

"Place Order" button (disabled when cart is empty)

Order success
Generates a PS-XXXXXXXX order ID

Displays a green checkmark with a pop animation

Clears the cart and returns to shop via CTA

6. Dedicated Wishlist Page (Latest Addition)
Clicking the header wishlist heart now opens a full wishlist page (#wishlistView).

Page structure
Header: "Your Wishlist" with heart icon + live X items saved counter

"Continue shopping" back link

Responsive grid (3 cols desktop / 2 tablet / 1 mobile)

Each wishlist card
Product image with badge (New/Sale) and "X" remove button

Category, title, star rating, price (with strikethrough old price)

"Add to Cart" button that uses the shared cart logic

Empty state
Large outlined heart icon

"Your wishlist is empty" message

"Browse Products" CTA that returns to shop

Sync behavior
Since all views read from the shared wishlist array, removing from the wishlist page un-fills the heart on the shop card too (via updateWishlistUI() re-querying all .wish-btn elements).

The mobile menu "Wishlist" link also opens this page.

Final Architecture
text
Body
├── #toast                        (global notification)
├── <header>                       (sticky, pastel glass)
│   ├── Brand → shop
│   ├── Nav (Home → shop, anchors → shop sections)
│   ├── Search
│   └── Actions: Account | Wishlist → wishlist page | Cart → checkout
│
├── #shopView.active
│   └── Hero · Categories · Products · Deal · Testimonials · Newsletter
├── #wishlistView
│   └── Header · Grid of saved items · Empty state
├── #checkoutView
│   └── Cart panel · Form · Order summary
├── #successView
│   └── Confirmation screen
└── <footer>
Shared State (all views stay in sync)
Variable	Persisted As	Used By
cart	petalCart → [{id, qty}]	Shop add-to-cart, checkout, badge count
wishlist	petalWishlist → [id]	Heart buttons, wishlist page, badge
Key Functions
Function	Purpose
showView(name)	Toggles .active on the 4 view sections
renderProducts()	Builds shop grid with heart + add buttons
renderWishlistPage()	Builds the wishlist grid + empty state
renderCartItems()	Builds checkout cart list + wires qty/remove
toggleWishlist(id, btn)	Add/remove + save + toast + pop animation
addToCart(id, btn)	Increment qty + save + toast + button feedback
updateSummary()	Recalculates subtotal/tax/total (respects promo)
updateWishlistUI() / updateCartBadge()	Sync badge counts + heart states across views

