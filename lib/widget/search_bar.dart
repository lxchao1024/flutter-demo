import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum SearchBarType { home, normal, homeLight }

///搜索条
class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final SearchBarType searchBarType;
  final String hint;
  final String defaultText;
  final TextStyle rightTextStyle;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  const SearchBar(
      {Key key,
      this.enabled = true,
      this.hideLeft,
      this.searchBarType = SearchBarType.normal,
      this.hint,
      this.defaultText,
      this.rightTextStyle,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch();
  }

  Widget _genNormalSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _wrapTap(
              Container(
                padding: EdgeInsets.only(left: 5),
                child: widget?.hideLeft ?? false
                    ? null
                    : Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 22,
                      ),
              ),
              widget.leftButtonClick),
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  '搜索',
                  style: widget.rightTextStyle != null ? widget.rightTextStyle : TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              widget.rightButtonClick)
        ],
      ),
    );
  }

  Widget _genHomeSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _wrapTap(
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: <Widget>[
                    Text('北京', style: TextStyle(color: _homeFontColor(), fontSize: 13),),
                    Icon(Icons.keyboard_arrow_down, size: 14, color: _homeFontColor())
                  ],
                ),
              ),
              widget.leftButtonClick),
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Icon(Icons.comment, color: _homeFontColor(), size: 22),
              ),
              widget.rightButtonClick)
        ],
      ),
    );
  }

  Widget _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (null != callback) callback();
      },
      child: child,
    );
  }

  Widget _inputBox() {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse('0xffEDEDED'));
    }
    return Container(
      height: 32,
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: inputBoxColor,
          borderRadius: BorderRadius.circular(
              widget.searchBarType == SearchBarType.normal ? 5 : 15)),
      child: Row(
        children: <Widget>[
          Icon(Icons.search,
              size: 20,
              color: widget.searchBarType == SearchBarType.home
                  ? Color(0xffA9A9A9)
                  : Colors.blue),
          Expanded(
            flex: 1,
            child: widget.searchBarType == SearchBarType.normal
                ? TextField(
                    controller: _controller,
                    onChanged: _onChanged,
                    autofocus: true,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hint ?? '',
                        hintStyle: TextStyle(fontSize: 12)))
                : _wrapTap(
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.defaultText,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    widget.inputBoxClick),
          ),
          !showClear
              ? _wrapTap(
                  Icon(Icons.mic,
                      size: 22,
                      color: widget.searchBarType == SearchBarType.normal
                          ? Colors.blue
                          : Colors.grey),
                  widget.speakClick)
              : _wrapTap(
                  Icon(Icons.clear,
                      size: 22,
                      color: widget.searchBarType == SearchBarType.normal
                          ? Colors.blue
                          : Colors.grey), () {
                  setState(() {
                    _controller.clear();
                  });
                  _onChanged('');
                }),
        ],
      ),
    );
  }

  void _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  Color _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight ? Colors.black54 : Colors.white;
  }
}
