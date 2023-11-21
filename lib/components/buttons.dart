import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class PrimaryBtn extends StatelessWidget {
  final String title;
  final double? btnwidth, btnheight;
  final dynamic onpressed;

  const PrimaryBtn(
      {super.key,
      required this.title,
      double? btnwidth,
      double? btnheight,
      dynamic onpressed})
      : btnwidth = btnwidth ?? 285.0,
        btnheight = btnheight ?? 50.0,
        onpressed = onpressed ?? ();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnwidth,
      height: btnheight,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.98, -0.18),
          end: Alignment(-0.98, 0.18),
          colors: [Color(0xFF0400D6), Color(0xFFFF00E5)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(41),
        ),
      ),
      child: TextButton(
        onPressed: onpressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class Likebtn extends StatefulWidget {
  const Likebtn({Key? key}) : super(key: key);

  @override
  _LikebtnState createState() => _LikebtnState();
}

class _LikebtnState extends State<Likebtn> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            liked = !liked;
          });
        },
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: liked
                ? Image.asset('assets/icons/Liked.png', width: 26)
                : Image.asset(
                    'assets/icons/Like.png',
                    width: 26,
                  )));
  }
}

class PopUpBtn extends StatelessWidget {
  final bool wide;
  final String label;
  final Widget icon;
  final dynamic labelcolor;

  PopUpBtn({
    Key? key,
    Widget? icon,
    bool? wide,
    String? label,
    dynamic labelcolor,
  })  : icon = icon ?? const Icon(Icons.abc_outlined, size: 26),
        wide = wide ?? false,
        label = label ?? 'Label',
        labelcolor = labelcolor ?? Colors.grey[800],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (wide == true) {
      child = Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon,
              const SizedBox(width: 20),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  color: labelcolor,
                ),
              ),
            ],
          ));
    } else {
      child = Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: icon);
    }

    return child;
  }
}

class FollowBtn extends StatefulWidget {
  const FollowBtn({Key? key}) : super(key: key);

  @override
  _FollowBtnState createState() => _FollowBtnState();
}

class _FollowBtnState extends State<FollowBtn> {
  bool followed = false;

  gradient() {
    if (followed == false) {
      return const LinearGradient(
        begin: Alignment(0.98, -0.18),
        end: Alignment(-0.98, 0.18),
        colors: [Color(0xFF0400D6), Color(0xFFFF00E5)],
      );
    } else {
      return const LinearGradient(
        begin: Alignment(0.95, -0.31),
        end: Alignment(-0.95, 0.31),
        colors: [
          Color.fromARGB(119, 255, 113, 241),
          Color.fromARGB(214, 131, 129, 236),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(41)),
          border: followed
              ? Border.fromBorderSide(
                  BorderSide(width: 1.0, color: Colors.grey[800]!))
              : const Border.fromBorderSide(
                  BorderSide(width: 1.0, color: Colors.transparent)),
          gradient: gradient(),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              followed = !followed;
            });
          },
          child: followed
              ? Text(
                  'Seguindo',
                  style: TextStyle(color: Colors.grey[800]),
                )
              : const Text(
                  'Seguir',
                  style: TextStyle(color: Colors.white),
                ),
        ));
  }
}
