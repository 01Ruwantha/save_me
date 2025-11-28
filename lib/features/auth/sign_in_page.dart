import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:save_me/app/styles/app_color_style.dart';
import 'package:save_me/app/styles/app_text_styles.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: AppColorStyle.white,
              fontSize: AppTextStyles(context).subtitle,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: AppColorStyle.white,
                    fontSize: AppTextStyles(context).title,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Sign In now to begin an amazing journey",
                  style: TextStyle(
                    color: AppColorStyle.textDisabled,
                    fontSize: AppTextStyles(context).body,
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
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColorStyle.textDisabled,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.goNamed("navigation");
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
                          "Sign In",
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
                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: AppColorStyle.textDisabled),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed("sign_up");
                      },
                      child: Text(
                        "Register here",
                        style: TextStyle(color: AppColorStyle.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColorStyle.textDisabled,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: AppColorStyle.textDisabled),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColorStyle.textDisabled,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Google Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Google sign in
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
                          "Sign in with Google",
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
                // Facebook Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Facebook sign in
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
                          "Sign in with Facebook",
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
                // Apple Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Apple sign in
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
                          "Sign in with Apple",
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
    );
  }
}
