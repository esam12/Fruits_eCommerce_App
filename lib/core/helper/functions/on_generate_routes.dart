import 'package:flutter/material.dart';
import 'package:fruits/features/auth/presentation/views/signin_view.dart';
import 'package:fruits/features/auth/presentation/views/signup_view.dart';
import 'package:fruits/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruits/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits/features/checkout/presentation/views/success_payment_view.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';
import 'package:fruits/features/home/presentation/views/main_view.dart';
import 'package:fruits/features/notification/presentation/views/notification_view.dart';
import 'package:fruits/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits/features/order_tracking/presentation/views/order_tracking_view.dart';
import 'package:fruits/features/orders/presentation/views/orders_view.dart';
import 'package:fruits/features/our_products/presentation/views/products_view.dart';
import 'package:fruits/features/profile/presentation/views/about_us_view.dart';
import 'package:fruits/features/searching/presentation/views/searching_view.dart';
import 'package:fruits/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    /// Splash Screen
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    /// OnBoarding Screen
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    /// Auth Screens
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    /// Home Screen

    case MainView.routeName:
      return MaterialPageRoute(
        builder: (context) => const MainView(),
      );

    /// Best Seller Screen
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());

    /// Searching Screen
    case SearchingView.routeName:
      return MaterialPageRoute(builder: (context) => const SearchingView());

    /// Products Screen
    case OurProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const OurProductsView());

    /// Notification Screen
    case NotificationView.routeName:
      return MaterialPageRoute(builder: (context) => const NotificationView());
    
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());

    case AboutUsView.routeName:
      return MaterialPageRoute(builder: (context) => const AboutUsView());

    /// Product details Screen
    // case ProductDetailView.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => const ProductDetailView(

    //           ));

    /// Cart Screen

    /// Checkout Screen
    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => CheckoutView(
          cartEntity: settings.arguments as CartEntity,
        ),
      );

    /// Checkout Address Screen

    /// Checkout Payment Screen

    /// Checkout Review Screen

    /// Success Payment Screen
    case SuccessPaymentView.routeName:
      return MaterialPageRoute(
          builder: (context) => const SuccessPaymentView());

    /// Order Tracking Screen
    case OrderTrackingView.routeName:
      return MaterialPageRoute(builder: (context) => const OrderTrackingView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
