import 'package:flutter/material.dart';
import 'package:linkmark_app/ui/component/appbar/search_app_bar_painter.dart';
import 'package:linkmark_app/ui/component/appbar/tag_filter_widget.dart';

const double _kLeadingWidth = kMinInteractiveDimension;

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String> onTextChanged;

  const SearchAppBar({
    Key key,
    @required this.onTextChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2);
}

class _SearchAppBarState extends State<SearchAppBar>
    with SingleTickerProviderStateMixin<SearchAppBar> {
  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  final _keySearchIcon = GlobalKey();
  final _textEditingController = TextEditingController();

  bool _isInSearchMode = false;
  double _rippleStartX, _rippleStartY;
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    _animationController.addStatusListener((status) {
      setState(() {
        _isInSearchMode = status == AnimationStatus.completed;
      });
    });
    _textEditingController.addListener(() {
      widget.onTextChanged(_textEditingController.text);
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _startSearch() {
    final RenderBox renderBox =
        _keySearchIcon.currentContext.findRenderObject();

    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    _rippleStartX = position.dx + size.width / 2;
    _rippleStartY = position.dy + size.height / 2;

    _animationController.forward();
  }

  void _cancelSearch() {
    _animationController.reverse();
  }

  Future<bool> _onWillPop() async {
    if (_isInSearchMode) {
      _cancelSearch();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget appBar = SafeArea(
      bottom: true,
      top: true,
      child: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight * 2),
        child: Container(
          width: screenWidth,
          height: kToolbarHeight * 2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: _kLeadingWidth),
                    child: _buildLeading(context),
                  ),
                  Expanded(
                    child: _buildTitle(context),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: _kLeadingWidth),
                    child: _buildAction(context),
                  ),
                ],
              ),
              TagFilterWidget(),
            ],
          ),
        ),
      ),
    );

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(
        children: [
          _buildAnimation(screenWidth),
          Material(
            type: MaterialType.transparency,
            child: appBar,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {

    final textField = TextField(
      controller: _textEditingController,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '検索する文字',
      ),
      textCapitalization: TextCapitalization.none,
      style: Theme.of(context)
          .primaryTextTheme
          .subtitle1
          .copyWith(color: Colors.black),
    );

    final text = Center(
      child: Text(
       'Linkmark',
       textAlign: TextAlign.center,
       style: Theme.of(context).primaryTextTheme.headline6,
     ),
    );

    return AnimatedCrossFade(
      firstChild: textField,
      secondChild: text,
      duration: Duration(milliseconds: 300),
      crossFadeState: _isInSearchMode
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );

    return _isInSearchMode
        ? TextField(
            controller: _textEditingController,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '検索する文字',
            ),
            textCapitalization: TextCapitalization.none,
            style: Theme.of(context)
                .primaryTextTheme
                .subtitle1
                .copyWith(color: Colors.black),
          )
        : Text(
            'Linkmark',
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.headline6,
          );
  }

  Widget _buildLeading(BuildContext context) {
    final themeData = Theme.of(context);
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        color: _isInSearchMode
            ? themeData.primaryColor
            : themeData.primaryIconTheme.color,
        progress: _animationController,
      ),
      onPressed: _isInSearchMode ? _cancelSearch : _handleDrawerButton,
    );
  }

  Widget _buildAction(BuildContext context) {
    final themeData = Theme.of(context);
    return AnimatedCrossFade(
      firstChild: IconButton(
        onPressed: _textEditingController.clear,
        icon: Icon(
          Icons.clear,
          color: themeData.primaryColor,
        ),
      ),
      secondChild: IconButton(
        key: _keySearchIcon,
        onPressed: _startSearch,
        icon: Icon(
          Icons.search,
          color: themeData.primaryIconTheme.color,
        ),
      ),
      duration: Duration(milliseconds: 300),
      crossFadeState: _isInSearchMode
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }

  AnimatedBuilder _buildAnimation(double screenWidth) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          color: Theme.of(context).primaryColor,
          height: kToolbarHeight * 2 + statusBarHeight,
          width: screenWidth,
          child: CustomPaint(
            painter: SearchAppBarPainter(
              containerHeight: kToolbarHeight * 2,
              center: Offset(_rippleStartX ?? 0, _rippleStartY ?? 0),
              // increase radius in % from 0% to 100% of screenWidth
              radius: _animation.value * screenWidth,
              context: context,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
