import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiny_music/business/login/cubit/login_cubit.dart';
import 'package:tiny_music/utils/util.dart';
import 'package:tiny_music/widgets/my_button.dart';
import 'package:tiny_music/widgets/my_input.dart';

class Login extends StatelessWidget {
  static const routeName = '/login';

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: const LoginChild(),
    );
  }
}

class LoginChild extends StatelessWidget {
  const LoginChild({super.key});

  @override
  Widget build(BuildContext context) {
    final urlController = TextEditingController();
    final accountController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('服务配置'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 96.w,
                bottom: 144.w,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'images/navidrome_logo.svg',
                width: 224.w,
                height: 224.w,
              ),
            ),
            MyInput(
              controller: urlController,
              title: '服务',
              placeholder: 'http(s)://demo.navidrome.org',
            ),
            SizedBox(height: 48.w),
            MyInput(
              controller: accountController,
              autofillHints: const [AutofillHints.username],
              title: '账号',
              placeholder: '请输入账号',
            ),
            SizedBox(height: 48.w),
            MyInput(
              controller: passwordController,
              autofillHints: const [AutofillHints.password],
              title: '密码',
              placeholder: '请输入密码',
              password: true,
            ),
            BlocSelector<LoginCubit, LoginState, LoginStatus>(
              selector: (state) => state.loginStatus,
              builder: (context, status) => MyButton(
                name: '保存',
                disabled: status == LoginStatus.loading,
                onClick: () {
                  String url = urlController.text.trim();
                  final account = accountController.text.trim();
                  final password = passwordController.text;
                  if (url.isEmpty || account.isEmpty || password.isEmpty) {
                    return;
                  }
                  if (url.endsWith('/')) {
                    url = url.substring(0, url.length - 1);
                  }
                  context
                      .read<LoginCubit>()
                      .loginSubmit(url, account, password)
                      .then((res) {
                    if (res) {
                      Util.showSuccessMessage('连接成功~');
                      Navigator.pop(context);
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
