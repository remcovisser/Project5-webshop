// Layout
Vue.component('navigation-component', require('./layout/Navigation.vue'));
Vue.component('navigation-admin-component', require('./layout/NavigationAdmin.vue'));
Vue.component('banner-component', require('./layout/Banner.vue'));
Vue.component('messages-component', require('./layout/Messages.vue'));
Vue.component('footer-component', require('./layout/Footer.vue'));

// Product
Vue.component('products-component', require('./product/Products.vue'));
Vue.component('product-component', require('./product/Product.vue'));

// User
Vue.component('login-component', require('./user/Login.vue'));
Vue.component('register-component', require('./user/Register.vue'));
Vue.component('profile-component', require('./user/Profile.vue'));
Vue.component('cart-component', require('./user/Cart.vue'));
Vue.component('wishlist-component', require('./user/Wishlist.vue'));
Vue.component('checkout-component', require('./user/Checkout.vue'));
Vue.component('user-orders-component', require('./user/Orders.vue'));
Vue.component('favourites-component', require('./user/Favourites.vue'));

// Wishlist
Vue.component('lists-component', require('./wishlist/Overview.vue'));
Vue.component('single-list-component', require('./wishlist/Detail.vue'));

// Admin
Vue.component('admin-plots-component', require('./admin/plots/Plots.vue'));
Vue.component('admin-users-overview-component', require('./admin/users/Overview.vue'));
Vue.component('admin-users-edit-component', require('./admin/users/Edit.vue'));
Vue.component('admin-products-overview-component', require('./admin/products/Overview.vue'));
Vue.component('admin-products-create-component', require('./admin/products/Create.vue'));
Vue.component('admin-products-edit-component', require('./admin/products/Edit.vue'));
Vue.component('admin-orders-component', require('./admin/users/Orders.vue'));
