import 'package:get/get.dart';

class AppValidator{
   static String? emailValidator(
       String? value,{
         String? errorMessage = "required!",
       }){
     if(value?.trim().isEmpty ?? true) return  errorMessage;

     if(value!=null && !GetUtils.isEmail(value.trim())){
       return 'Invalid email address';
     }
     return null;
   }

   static String? numberValidator(
       String? value, {
         String? errorMessage = "Please enter valid number!",
       }) {
     if (value?.trim().isEmpty ?? true) {
       return errorMessage;
     }
     else if (double.tryParse(value!) == null || double.parse(value) <= 0) {
       return errorMessage;
     }
     return null;
   }

   static String? emptyNullValidator(
       String? value, {
         String? errorMessage = "required!",
       }) {
     if (value?.trim().isEmpty ?? true) return errorMessage;

     return null;
   }

   static String? phoneValidator(
       String? value,{
         String? errorMessage = "required!",
       }) {
     if (value?.trim().isEmpty ?? true) return errorMessage;
     if (value != null && value.length != 10) {
       return "Phone number must be of exact 10 digits!";
     }
     if (value != null && !GetUtils.isPhoneNumber(value.trim())) {
       return "Invalid phone number!";
     }
     return null;
   }

   static String? passwordValidator(String? value,{
     String? errorMessage = "required!",
   }){
     if(value?.trim().isEmpty??true) return errorMessage;
     if (value!.length < 8) return "Password must be at least 8 characters long.";
     if (!RegExp(r'[A-Z]').hasMatch(value)) return "Password must contain at least one uppercase letter.";
     if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) return "Password must contain at least one special character.";
     if (!RegExp(r'[0-9]').hasMatch(value)) return "Password must contain at least one digit.";
     return null;
   }


}

