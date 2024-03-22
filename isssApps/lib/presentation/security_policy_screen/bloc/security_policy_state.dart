// ignore_for_file: must_be_immutable

part of 'security_policy_bloc.dart';

class SecurityPolicyState extends Equatable {
  SecurityPolicyState({
    this.emailController,
    this.group10198Controller,
    this.group10198OneController,
    this.isShowPassword = true,
    this.securityPolicyModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? group10198Controller;

  TextEditingController? group10198OneController;

  SecurityPolicyModel? securityPolicyModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        emailController,
        group10198Controller,
        group10198OneController,
        isShowPassword,
        securityPolicyModelObj,
      ];
  SecurityPolicyState copyWith({
    TextEditingController? emailController,
    TextEditingController? group10198Controller,
    TextEditingController? group10198OneController,
    bool? isShowPassword,
    SecurityPolicyModel? securityPolicyModelObj,
  }) {
    return SecurityPolicyState(
      emailController: emailController ?? this.emailController,
      group10198Controller: group10198Controller ?? this.group10198Controller,
      group10198OneController:
          group10198OneController ?? this.group10198OneController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      securityPolicyModelObj:
          securityPolicyModelObj ?? this.securityPolicyModelObj,
    );
  }
}
