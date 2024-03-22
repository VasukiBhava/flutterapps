// ignore_for_file: must_be_immutable

part of 'security_policy_bloc.dart';

@immutable
abstract class SecurityPolicyEvent extends Equatable {}

class SecurityPolicyInitialEvent extends SecurityPolicyEvent {
  @override
  List<Object?> get props => [];
}

///event for change password visibility
class ChangePasswordVisibilityEvent extends SecurityPolicyEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
