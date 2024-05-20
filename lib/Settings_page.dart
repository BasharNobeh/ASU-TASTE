import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginScreen.dart';
import 'package:flutter_application_1/main.dart';

class TasteSettingsPage extends StatefulWidget {
  const TasteSettingsPage({super.key});

  @override
  State<TasteSettingsPage> createState() => _TasteSettingsPageState();
}

class _TasteSettingsPageState extends State<TasteSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: [
        ExpansionTile(
          initiallyExpanded: true,
          trailing: const Icon(Icons.account_circle_outlined),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 5),
          title: Text(
            "Account",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          children: [
            SettingsListTile(
                "Edit Profile", Icons.edit, "Change Your profile Info"),
            SettingsListTile("Payment Method", Icons.credit_card,
                "Edit or delete a payment method"),
            SettingsListTile("Latest Orders", Icons.update,
                "Check out Your order and give us a feedBack"),
            SettingsListTile("Connected Accounts", Icons.handshake,
                "Instagram , faceBook and more .."),
            SettingsListTile(
                "Deactivate Account", Icons.face, "Delete Your Account"),
          ],
        ),
        ExpansionTile(
          initiallyExpanded: true,
          trailing: const Icon(Icons.phone),
          title: Text(
            "Contact Us",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          children: [
            SettingsListTile(
                "Support", Icons.support_agent, "Talk with our agents"),
            SettingsListTile(
                "Bussines inquirments", Icons.done_all, "Sponsors and Ad's"),
            SettingsListTile("Report", Icons.report, "Raise A report ticket"),
          ],
        ),
        ExpansionTile(
          initiallyExpanded: true,
          trailing: const Icon(Icons.more_horiz),
          title: Text(
            "More",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          children: [
            SettingsListTile("Work with us ! ", Icons.work,
                "Apply to start working with us"),
            SettingsListTile(
                "Employees support",
                Icons.contact_support_outlined,
                "Raise a ticket to get the support"),
            SettingsListTile("Balance", Icons.money, "Check how much you have"),
            InkWell(
                onTap: () async {
                  if (Auth().auth.currentUser != null) {
                    Auth().auth.signOut();
                    String msg = "Signed out";
                    Color color = Colors.pink;

                    final snackBar = SnackBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      content: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: color,
                            border: Border.all(color: color, width: 3),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x19000000),
                                spreadRadius: 2.0,
                                blurRadius: 8.0,
                                offset: Offset(2, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.error_outline, color: Colors.white),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(msg,
                                    style: TextStyle(color: Colors.white)),
                              ),
                              const Spacer(),
                              TextButton(
                                  onPressed: () => debugPrint("Undid"),
                                  child: Text(
                                    "Undo",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          )),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 800),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                          pageBuilder: (_, __, ___) =>
                              Material(child: LoginScreen())));
                },
                child: SettingsListTile("Logout", Icons.logout, "")),
          ],
        ),
      ],
    )));
  }

  ListTile SettingsListTile(String title, IconData icon, String subtitle) {
    return ListTile(
        title: Text(title, style: TextStyle()),
        leading: Icon(icon),
        subtitle: Text(subtitle));
  }
}
