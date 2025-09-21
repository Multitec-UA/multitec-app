// ignore_for_file: one_member_abstracts
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Result<User?, Failure> getUser();
}
