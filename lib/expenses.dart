import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
  final TextEditingController _notes = TextEditingController();
  final TextEditingController _value = TextEditingController();

  late FocusNode focusNode;
  final List<String> _inputValue = List.empty(growable: true);
  final List<String> _category = [
    "Category 1",
    "Category 2",
    "Category 3",
    "Category 4",
  ];

  String? selectedValue;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _notes.dispose();
    _value.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(189, 179, 149, 1)),
      backgroundColor: Color.fromRGBO(189, 179, 149, 1),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  onMenuStateChange: (isOpen) {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  isExpanded: true,
                  hint: Text(
                    'Select Category',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  items:
                      _category
                          .map(
                            (String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 2),
                      color: Color.fromRGBO(242, 226, 177, 1),
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      isExpanded
                          ? Icons.arrow_downward_outlined
                          : Icons.arrow_forward_outlined,
                    ),
                    iconSize: 14,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(8),
                      ),
                    ),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: WidgetStateProperty.all<double>(6),
                      thumbVisibility: WidgetStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              focusNode: FocusNode(),
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(242, 226, 177, 1),
                hintText: "Add notes",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.none,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(242, 226, 177, 1),
                hintText: _inputValue.isEmpty ? "0" : _inputValue.join(),
                hintStyle: TextStyle(fontSize: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: _customActionButton(
                    text: "1",
                    value: "1",
                    padding: EdgeInsets.fromLTRB(0, 4, 2, 2),
                  ),
                ),
                Expanded(
                  child: _customActionButton(
                    text: "2",
                    value: "2",
                    padding: EdgeInsets.fromLTRB(2, 4, 2, 2),
                  ),
                ),
                Expanded(
                  child: _customActionButton(
                    text: "3",
                    value: "3",
                    padding: EdgeInsets.fromLTRB(2, 4, 0, 2),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _customActionButton(
                    text: "4",
                    value: "4",
                    padding: EdgeInsets.fromLTRB(0, 2, 2, 2),
                  ),
                ),
                Expanded(
                  child: _customActionButton(
                    text: "5",
                    value: "5",
                    padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                  ),
                ),
                Expanded(
                  child: _customActionButton(
                    text: "6",
                    value: "6",
                    padding: EdgeInsets.fromLTRB(2, 2, 0, 2),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _customActionButton(
                    text: "7",
                    value: "7",
                    padding: EdgeInsets.fromLTRB(0, 2, 2, 2),
                  ),
                ),
                Expanded(
                  child: _customActionButton(
                    text: "8",
                    value: "8",
                    padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                  ),
                ),
                Expanded(
                  child: _customActionButton(
                    text: "9",
                    value: "9",
                    padding: EdgeInsets.fromLTRB(2, 2, 0, 2),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _customActionButton(
                    text: ".",
                    value: ".",
                    padding: EdgeInsets.fromLTRB(0, 2, 2, 4),
                  ),
                ),
                Expanded(
                  child: _customActionButton(
                    text: "0",
                    value: "0",
                    padding: EdgeInsets.fromLTRB(2, 2, 2, 4),
                  ),
                ),
                Expanded(
                  child: _customActionButton(
                    text: "Del",
                    value: "Del",
                    padding: EdgeInsets.fromLTRB(2, 2, 0, 4),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      _inputValue.clear();
                      setState(() {});
                    },
                    child: Text('Clear'),
                  ),
                ),
                Expanded(
                  child: TextButton(onPressed: () {}, child: Text('Save')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _customActionButton({
    String text = "",
    String value = "",
    EdgeInsets padding = const EdgeInsets.fromLTRB(0, 0, 0, 0),
  }) => Padding(
    padding: padding,
    child: TextButton(
      onPressed: () {
        if (value == ".") {
          if (!_inputValue.contains(value)) {
            if (_inputValue.isEmpty) {
              _inputValue.add("0");
            }
            _inputValue.add(value);
          }
        } else if (value == "Del") {
          _inputValue.removeLast();
        } else {
          _inputValue.add(value);
        }

        setState(() {});
      },
      style: TextButton.styleFrom(
        backgroundColor: Color.fromRGBO(242, 226, 177, 1),
        minimumSize: Size(double.infinity, 65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.white, width: 2),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade800,
        ),
      ),
    ),
  );
}
