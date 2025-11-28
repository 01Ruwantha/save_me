import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:save_me/app/styles/app_color_style.dart';
import 'package:save_me/app/styles/app_text_styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.darkNavy,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColorStyle.white),
          ),
        ),
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: AppColorStyle.white,
            fontSize: AppTextStyles(context).subtitle,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 64),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                      color: AppColorStyle.white,
                      fontSize: AppTextStyles(context).title,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Sign up now to begin an amazing journey",
                    style: TextStyle(
                      color: AppColorStyle.textDisabled,
                      fontSize: AppTextStyles(context).body,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Name Field
                  TextFormField(
                    style: TextStyle(color: AppColorStyle.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColorStyle.grey800,
                      hintText: 'Name',
                      hintStyle: TextStyle(color: AppColorStyle.textDisabled),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Email Field
                  TextFormField(
                    style: TextStyle(color: AppColorStyle.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColorStyle.grey800,
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: AppColorStyle.textDisabled),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Phone Number Field
                  TextFormField(
                    style: TextStyle(color: AppColorStyle.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColorStyle.grey800,
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: AppColorStyle.textDisabled),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Password Field
                  TextFormField(
                    obscureText: _obscureText,
                    style: TextStyle(color: AppColorStyle.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColorStyle.grey800,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: AppColorStyle.textDisabled),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColorStyle.textDisabled,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.goNamed('sign_in');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorStyle.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColorStyle.white,
                              fontSize: AppTextStyles(context).body,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColorStyle.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Sign In Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: AppColorStyle.textDisabled),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.goNamed("sign_in");
                        },
                        child: Text(
                          "Signin",
                          style: TextStyle(color: AppColorStyle.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Google Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Google sign up
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorStyle.grey800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          Image.asset("assets/auth/google icon.png"),
                          const SizedBox(width: 8),
                          Text(
                            "Sign up with Google",
                            style: TextStyle(
                              color: AppColorStyle.white,
                              fontSize: AppTextStyles(context).body,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Facebook Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Facebook sign up
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorStyle.grey800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          Image.asset("assets/auth/facebook icon.png"),
                          const SizedBox(width: 8),
                          Text(
                            "Sign up with Facebook",
                            style: TextStyle(
                              color: AppColorStyle.white,
                              fontSize: AppTextStyles(context).body,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Apple Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Apple sign up
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorStyle.grey800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          Image.asset("assets/auth/apple icon.png"),
                          const SizedBox(width: 8),
                          Text(
                            "Sign up with Apple",
                            style: TextStyle(
                              color: AppColorStyle.white,
                              fontSize: AppTextStyles(context).body,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
