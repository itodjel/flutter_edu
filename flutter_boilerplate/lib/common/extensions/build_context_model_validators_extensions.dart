import 'package:flutter_boilerplate/_all.dart';

extension BuildContextModelValidatorsExtensions on BuildContext {
  LoginModelValidator get loginModelValidator => read<LoginModelValidator>();
  RegisterModelValidator get registerModelValidator => read<RegisterModelValidator>();
  UpdateProfileModelValidator get updateProfileModelValidator => read<UpdateProfileModelValidator>();
  ShoppingCartAddModelValidator get shoppingCartAddModelValidator => read<ShoppingCartAddModelValidator>();
  ShoppingCartUpdateModelValidator get shoppingCartUpdateModelValidator => read<ShoppingCartUpdateModelValidator>();
  ChangePasswordModelValidator get changePasswordModelValidator => read<ChangePasswordModelValidator>();
  ResetPasswordModelValidator get resetPasswordModelValidator => read<ResetPasswordModelValidator>();
  ShareTicketModelValidator get shareTicketModelValidator => read<ShareTicketModelValidator>();
}
