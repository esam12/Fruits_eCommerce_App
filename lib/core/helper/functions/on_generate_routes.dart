import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/auth/presentation/views/signin_view.dart';
import 'package:fruits/features/auth/presentation/views/signup_view.dart';
import 'package:fruits/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruits/features/cart/data/repos/cart_repo_impl.dart';
import 'package:fruits/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fruits/features/cart/presentation/views/cart_view.dart';
import 'package:fruits/features/checkout/presentation/views/checkout_address_view.dart';
import 'package:fruits/features/checkout/presentation/views/checkout_review_view.dart';
import 'package:fruits/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits/features/checkout/presentation/views/checkout_payment_view.dart';
import 'package:fruits/features/checkout/presentation/views/success_payment_view.dart';

import 'package:fruits/features/home/presentation/views/main_view.dart';
import 'package:fruits/features/notification/presentation/views/notification_view.dart';
import 'package:fruits/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits/features/order_tracking/presentation/views/order_tracking_view.dart';
import 'package:fruits/features/our_products/presentation/views/products_view.dart';
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
    case ProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const ProductsView());

    /// Notification Screen
    case NotificationView.routeName:
      return MaterialPageRoute(builder: (context) => const NotificationView());

    /// Product details Screen
    // case ProductDetailView.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => const ProductDetailView(

    //           ));

    /// Cart Screen
    case CartView.routeName:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => CartCubit(
                  cartRepo: CartRepoImpl(),
                ),
                child: const CartView(),
              ));

    /// Checkout Screen
    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) => const CheckoutView());

    /// Checkout Address Screen
    case CheckoutAddressView.routeName:
      return MaterialPageRoute(
          builder: (context) => const CheckoutAddressView());

    /// Checkout Payment Screen
    case CheckoutPaymentView.routeName:
      return MaterialPageRoute(
          builder: (context) => const CheckoutPaymentView());

    /// Checkout Review Screen
    case CheckoutReviewView.routeName:
      return MaterialPageRoute(
          builder: (context) => const CheckoutReviewView());

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