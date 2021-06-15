library dropdown_formfield;

import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';

class DropDownFormField extends FormField<dynamic> {
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final bool filled;
  final EdgeInsets contentPadding;

  DropDownFormField(
      {FormFieldSetter<dynamic> onSaved,
        FormFieldValidator<dynamic> validator,
        bool autovalidate = false,
        this.hintText = 'Select one option',
        this.required = false,
        this.errorText = 'Please select one option',
        this.value,
        this.dataSource,
        this.textField,
        this.valueField,
        this.onChanged,
        this.filled = true,
        this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0)})
      : super(
    onSaved: onSaved,
    validator: validator,
    autovalidate: autovalidate,
    initialValue: value == '' ? null : value,
    builder: (FormFieldState<dynamic> state) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputDecorator(
              decoration: InputDecoration(
                hintText: 'Enter a value',
                contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:kPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:kPrimaryColor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<dynamic>(
                  isExpanded: true,
                  hint: Text(
                    hintText,
                  ),
                  value: value == '' ? null : value,
                  onChanged: (dynamic newValue) {
                    state.didChange(newValue);
                    onChanged(newValue);
                  },
                  items: dataSource.map((item) {
                    return DropdownMenuItem<dynamic>(
                      value: item[valueField],
                      child: Text(item[textField],
                          overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: state.hasError ? 5.0 : 0.0),
            Text(
              state.hasError ? state.errorText : '',
              style: TextStyle(
                  color: Colors.redAccent.shade700,
                  fontSize: state.hasError ? 12.0 : 0.0),
            ),
          ],
        ),
      );
    },
  );
}