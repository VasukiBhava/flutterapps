import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:isssApps/presentation/security_policy_screen/models/security_policy_model.dart';
part 'security_policy_event.dart';
part 'security_policy_state.dart';

class SecurityPolicyBloc
    extends Bloc<SecurityPolicyEvent, SecurityPolicyState> {
  SecurityPolicyBloc(SecurityPolicyState initialState) : super(initialState) {
    on<SecurityPolicyInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<SecurityPolicyState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _onInitialize(
    SecurityPolicyInitialEvent event,
    Emitter<SecurityPolicyState> emit,
  ) async {
    emit(state.copyWith(
        emailController: TextEditingController(),
        group10198Controller: TextEditingController(),
        group10198OneController: TextEditingController(),
        isShowPassword: true));
  }
}
