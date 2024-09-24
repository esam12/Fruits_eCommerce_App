import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fruits/core/services/cloud_storage/firebase_storage_service.dart';
import 'package:fruits/core/utils/exceptions/firebase_exceptions.dart';
import 'package:fruits/core/utils/exceptions/platform_exceptions.dart';
import 'package:fruits/features/home/data/models/product_model.dart';

import 'data_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.data() as Map<String, dynamic>;
  }

  Future<List<ProductModel>> fetchLimitedProducts(int limit) async {
    try {
      final snapshot =
          await firestore.collection('products').limit(limit).get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again. $e';
    }
  }

  /// Fetch all the products from the Cloud Firestore
  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final snapshot = await firestore.collection('products').get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again. $e';
    }
  }

  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Upload all the products along with their images
      final storage = TFirebaseStorageService();

      // Loop througn each product
      for (var product in products) {
        // Get imageData link from the local assets
        final productImage =
            await storage.getImageDataFromAssets(product.productImage);

        // Upload image and get its url
        final url = await storage.uploadImageData(
            'products/images', productImage, product.productImage.toString());

        // Assign url to product.productImage attribute
        product.image = url;

        // Store product in Firestore
        await firestore
            .collection('products')
            .doc(product.id)
            .set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }
}
