import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english/services/local/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial()) {
//     on<AuthEvent>(auth);
//   }

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   //xử lý sự kiện đăng nhập, đăng ký, đăng xuất
//   Future<void> auth(AuthEvent event, Emitter<AuthState> emit) async {
//     try {
//       //phát ra trạng thái khởi tạo xác thực
//       emit(AuthInitial());
//       //xử lý sự kiện đăng nhập, đăng ký, đăng xuất
//       if (event is AuthSignInEvent) {
//         await signIn(event, emit);
//       } else if (event is AuthSignUpEvent) {
//         await signUp(event, emit);
//       } else if (event is AuthSignOutEvent) {
//         await signOut(emit);
//       }
//     } catch (e) {
//       print("Error in auth flow: $e");
//       //phát ra trạng thái lỗi
//       emit(AuthFailure(error: 'Error in auth flow: $e'));
//     }
//   }

//   //xử lý đăng nhập
//   Future<void> signIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
//     //phát ra trạng thái khởi tạo xác thực
//     emit(AuthInitial());

//     try {
//       //đăng nhập vào firebase
//       UserCredential userCredential =
//           await _firebaseAuth.signInWithEmailAndPassword(
//         email: event.email,
//         password: event.password,
//       );
//       SharedPrefs.token = userCredential.user!.uid;
//       //kiểm tra xem người dùng có tồn tại hay không
//       if (userCredential.user != null) {
//         //lấy dữ liệu người dùng từ firestore
//         DocumentSnapshot userSnapshot = await _firestore
//             .collection('users')
//             .doc(userCredential.user!.uid)
//             .get();

//         //kiểm tra xem dữ liệu người dùng có tồn tại hay không
//         if (userSnapshot.exists) {
//           //lấy dữ liệu người dùng
//           String fullName = userSnapshot['fullName'];
//           String email = userSnapshot['email'];

//           //xử lý dữ liệu người dùng và đưa vào trạng thái AuthSuccessWithName
//           emit(AuthSuccessWithName(
//               user: userCredential.user!, fullName: fullName, email: email));
//           print('User $fullName signed in.');
//         } else {
//           print('User data not found in Firestore.');
//           //phát ra trạng thái lỗi
//           emit(AuthFailure(error: 'User data not found in Firestore.'));
//         }
//       } else {
//         print('User is null after sign in.');
//         //phát ra trạng thái lỗi
//         emit(AuthFailure(error: 'User is null after sign in.'));
//       }
//     } catch (e) {
//       print("Sign-in failed: $e");
//       //phát ra trạng thái lỗi
//       emit(AuthFailure(error: 'Sign-in failed: $e'));
//     }
//   }

//   //xử lý đăng ký
//   Future<void> signUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
//     //phát ra trạng thái khởi tạo xác thực
//     emit(AuthInitial());

//     //xử lý đăng ký
//     try {
//       //đăng ký vào firebase
//       UserCredential userCredential =
//           await _firebaseAuth.createUserWithEmailAndPassword(
//         email: event.email,
//         password: event.password,
//       );

//       //kiểm tra xem người dùng có tồn tại hay không
//       if (userCredential.user != null) {
//         //lưu dữ liệu người dùng vào firestore
//         await _firestore.collection('users').doc(userCredential.user!.uid).set({
//           'fullName': event.fullName,
//           'phoneNumber': event.phoneNumber,
//           'email': event.email,
//         });

//         //xử lý dữ liệu người dùng và đưa vào trạng thái AuthSuccess
//         emit(AuthSuccess(user: userCredential.user!));
//       } else {
//         print('User is null after sign up.');
//         //phát ra trạng thái lỗi
//         emit(AuthFailure(error: 'User is null after sign up.'));
//       }
//     } catch (e) {
//       print('Sign-up failed: $e');
//       //phát ra trạng thái lỗi
//       emit(AuthFailure(error: 'Sign-up failed: $e'));
//     }
//   }

//   // Future<void> signOut(Emitter<AuthState> emit) async {
//   //   try {
//   //     await _firebaseAuth.signOut();
//   //     emit(AuthInitial());
//   //   } catch (e) {
//   //     print('Sign-out failed: $e');
//   //     emit(AuthFailure(error: 'Sign-out failed: $e'));
//   //   }
//   // }
//   Future<void> signOut(Emitter<AuthState> emit) async {
//     try {
//       await _firebaseAuth.signOut();

//       // Clear user-related data
//       SharedPrefs.removeSeason();
//       SharedPrefs.clearUserData(); // You need to implement this method

//       emit(AuthInitial());
//     } catch (e) {
//       print('Sign-out failed: $e');
//       emit(AuthFailure(error: 'Sign-out failed: $e'));
//     }
//   }
// }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(auth);
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Xử lý sự kiện đăng nhập, đăng ký, đăng xuất
  Future<void> auth(AuthEvent event, Emitter<AuthState> emit) async {
    try {
      // Phát ra trạng thái khởi tạo xác thực
      emit(AuthInitial());

      if (event is AuthSignInEvent) {
        // Xử lý sự kiện đăng nhập
        await signIn(event, emit);
        // Xử lý sự kiện đăng ký
      } else if (event is AuthSignUpEvent) {
        await signUp(event, emit);
        // Xử lý sự kiện đăng xuất
      } else if (event is AuthSignOutEvent) {
        await signOut(emit);
      }
    } catch (e) {
      print("Error in auth flow: $e");
      // Phát ra trạng thái lỗi
      emit(AuthFailure(error: 'Error in auth flow: $e'));
    }
  }

// Xử lý đăng nhập
  Future<void> signIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    try {
      // Phát ra trạng thái khởi tạo xác thực
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      // Lưu token vào SharedPrefs
      SharedPrefs.token = userCredential.user!.uid;

      // Lấy dữ liệu người dùng từ Firestore
      if (userCredential.user != null) {
        DocumentSnapshot userSnapshot = await _firestore
            .collection('english')
            .doc(userCredential.user!.uid)
            .get();

        // Kiểm tra xem dữ liệu người dùng có tồn tại hay không
        if (userSnapshot.exists) {
          // Lấy dữ liệu người dùng từ DocumentSnapshot
          String fullName = userSnapshot['fullName'];
          String email = userSnapshot['email'];

          // Đưa dữ liệu vào trạng thái AuthSuccessWithName
          emit(AuthSuccessWithName(
              user: userCredential.user!, fullName: fullName, email: email));
          print('User $fullName signed in.');
        } else {
          print('User data not found in Firestore.');
          emit(AuthFailure(error: 'User data not found in Firestore.'));
        }
      } else {
        print('User is null after sign in.');
        // Phát ra trạng thái lỗi
        emit(AuthFailure(error: 'User is null after sign in.'));
      }
    } catch (e) {
      print("Sign-in failed: $e");
      emit(AuthFailure(error: 'Sign-in failed: $e'));
    }
  }

  Future<void> signUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    try {
      // Phát ra trạng thái khởi tạo xác thực
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      // Lưu dữ liệu người dùng vào Firestore
      if (userCredential.user != null) {
        print('User ${userCredential.user!.uid} signed up.');

        // Lưu dữ liệu người dùng vào Firestore
        if (_firebaseAuth.currentUser != null) {
          // Lấy DocumentReference của người dùng
          DocumentReference userDocReference = _firestore
              .collection('english') // Replace with your collection path
              .doc(userCredential.user!.uid);

          // Lưu dữ liệu người dùng vào Firestore
          await userDocReference.set({
            'fullName': event.fullName,
            'phoneNumber': event.phoneNumber,
            'email': event.email,
          });
          // Đưa dữ liệu vào trạng thái AuthSuccess
          emit(AuthSuccess(user: userCredential.user!));
        } else {
          print('User is not signed in.');
          // Phát ra trạng thái lỗi
          emit(AuthFailure(error: 'User is not signed in.'));
        }
      } else {
        print('User is null after sign up.');
        // Phát ra trạng thái lỗi
        emit(AuthFailure(error: 'User is null after sign up.'));
      }
      // Xử lý lỗi
    } catch (e) {
      // Phát ra trạng thái lỗi
      if (e is FirebaseAuthException) {
        // Xử lý lỗi đăng ký
        if (e.code == 'email-already-in-use') {
          // Phát ra trạng thái lỗi
          emit(AuthFailure(
            error: 'Email is already in use. Please use a different email.',
          ));
          // Xử lý lỗi đăng nhập
        } else {
          print('Sign-up failed: $e');
          emit(AuthFailure(error: 'Sign-up failed. Please try again.'));
        }
      } else {
        print('An unexpected error occurred: $e');
        // Phát ra trạng thái lỗi
        emit(AuthFailure(
          error: 'An unexpected error occurred. Please try again.',
        ));
      }
    }
  }

  // Xử lý đăng xuất
  Future<void> signOut(Emitter<AuthState> emit) async {
    try {
      // Đăng xuất khỏi Firebase
      await _firebaseAuth.signOut();

      // Clear user-related data
      SharedPrefs.removeSeason();

      SharedPrefs.clearUserData();

      emit(AuthInitial());
    } catch (e) {
      print('Sign-out failed: $e');
      emit(AuthFailure(error: 'Sign-out failed: $e'));
    }
  }
}
