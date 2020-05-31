// import 'package:localbasket/models/LatlongResponse.dart';
import 'package:notekeeper/Screens/customDD.dart';

import 'package:flutter/material.dart';

import 'customCB.dart';
import 'customTF.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  // final _subFormKey = GlobalKey<FormState>();
  // final _subFormKey2 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isVendor = false;
  bool checkBoxValue = false, checkBoxValue1 = false;
  // List<LatlongResponse> _temp;
  int _selectedType = 0, _selectedDelivery = 0;
  var selectedAddress;
  var _signUpModel = null();
  var _customerSignupModel = null();
  TabController _tabController;
  TextEditingController _usernameController,
      _mobController,
      _passwordController,
      _passwordController2,
      _usernameController2,
      _nameController,
      _onameController,
      _compnameController,
      _emailController,
      _addressController,
      _countryController,
      _stateController,
      _cityController,
      _pincodeController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0)
      ..addListener(tabChange);
    _usernameController = TextEditingController();
    _mobController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordController2 = TextEditingController();
    _usernameController2 = TextEditingController();
    _nameController = TextEditingController();
    _onameController = TextEditingController();
    _compnameController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _countryController = TextEditingController();
    _stateController = TextEditingController();
    _cityController = TextEditingController();
    _pincodeController = TextEditingController();
    super.initState();
  }

  void tabChange() {
    setState(() {
      _isVendor = _tabController.index == 0 ? false : true;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _mobController.dispose();
    _passwordController2.dispose();
    _usernameController2.dispose();
    _nameController.dispose();
    _onameController.dispose();
    _compnameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final appLoc = null;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(appLoc.translate('signup_title')),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: DefaultTabController(
        length: 2,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10, right: 20.0, left: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  constraints: const BoxConstraints.expand(height: 50),
                  child: TabBar(controller: _tabController, tabs: [
                    Tab(
                      child: Text(
                        appLoc.translate("customer"),
                        style: TextStyle(
                            color: _isVendor ? Colors.grey : Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        appLoc.translate("vendor"),
                        style: TextStyle(
                            color: _isVendor ? Colors.white : Colors.grey),
                      ),
                    )
                  ]),
                ),
                tabView(appLoc),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.grey[300]),
                    ),
                    child: const Text(
                      "Signup",
                    ),
                    onPressed: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (_isVendor ? checkBoxValue : checkBoxValue1) {
                        if (_isVendor) {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();

                            try {
                              final _temp1 = null;

                              _signUpModel.lat = _temp1
                                  .results[0].geometry.location.lat
                                  .toString();
                              _signUpModel.long = _temp1
                                  .results[0].geometry.location.lng
                                  .toString();
                            } catch (e) {}
                          }
                        } else {
                          if (_formKey2.currentState.validate()) {
                            _formKey2.currentState.save();

                            try {
                              final _temp1 = null;

                              _customerSignupModel.lat = _temp1
                                  .results[0].geometry.location.lat
                                  .toString();
                              _customerSignupModel.long = _temp1
                                  .results[0].geometry.location.lng
                                  .toString();
                            } catch (e) {}
                          }
                        }
                      } else {}
                    }),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabView(appLoc) {
    return Expanded(
      child: Container(
        child: TabBarView(
          controller: _tabController,
          children: [
            customerForm(appLoc),
            vendorForm(appLoc),
          ],
        ),
      ),
    );
  }

  Widget customerForm(appLoc) {
    return Form(
      key: _formKey2,
      child: ListView(children: <Widget>[
        CustomTextField(
          controller: _usernameController2,
          title: appLoc.translate("username"),
          prefixIcon: Icons.perm_identity,
          onSaved: (value) => _customerSignupModel.username = value,
          initialValue: null,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter Username';
            }
            return null;
          },
        ),
        CustomTextField(
            controller: _passwordController2,
            obscure: true,
            prefixIcon: Icons.lock,
            maxLines: 1,
            initialValue: null,
            title: appLoc.translate("password"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) => _customerSignupModel.password = value),
        CustomTextField(
          controller: _nameController,
          initialValue: null,
          prefixIcon: Icons.person,
          title: appLoc.translate("name"),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter your Full Name';
            }
            return null;
          },
          onSaved: (value) => _customerSignupModel.name = value,
        ),
        Column(
          children: <Widget>[
            CustomTextField(
              prefixIcon: Icons.location_on,
              initialValue: null,
              title: appLoc.translate("address"),
              minLines: 1,
              maxLines: 3,
              inputType: TextInputType.multiline,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Address';
                }
                return null;
              },
              onSaved: (value) => _customerSignupModel.address = value,
            ),
            const Text(
              "Note: Please Enter Address in English only.",
              style: TextStyle(color: Colors.green),
            ),
            CustomTextField(
              prefixIcon: Icons.my_location,
              initialValue: null,
              title: appLoc.translate("country"),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Country';
                }
                return null;
              },
              onSaved: (value) => _customerSignupModel.country = value,
            ),
            CustomTextField(
              initialValue: null,
              prefixIcon: Icons.map,
              title: appLoc.translate("state"),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter State';
                }
                return null;
              },
              onSaved: (value) => _customerSignupModel.state = value,
            ),
            CustomTextField(
              prefixIcon: Icons.location_city,
              initialValue: null,
              title: appLoc.translate("city"),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter City';
                }
                return null;
              },
              onSaved: (value) => _customerSignupModel.city = value,
            ),
          ],
        ),
        CustomTextField(
          initialValue: null,
          prefixIcon: Icons.call,
          title: appLoc.translate("mobileNo"),
          inputType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter Mobile No.';
            }
            if (value.length > 10 || value.length < 10) {
              return 'Invalid Mobile No.';
            }
            return null;
          },
          onSaved: (value) => _customerSignupModel.mobile = value,
        ),
        Row(
          children: <Widget>[
            CustomCheckbox(
                value: checkBoxValue1,
                activeColor: Colors.green,
                onChanged: (newValue) {
                  checkBoxValue1 = newValue;
                }),
            GestureDetector(
                child: const Text(
                  "Terms And Conditions",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                onTap: () {}),
          ],
        ),
        const SizedBox(height: 20),
      ]),
    );
  }

  Widget vendorForm(appLoc) {
    return Form(
      key: _formKey,
      child: ListView(children: <Widget>[
        CustomDropDownField(
          prefixIcon: const Icon(Icons.store),
          title: appLoc.translate("businessType"),
          items: [
            DropdownMenuItem<int>(
              child: Text(appLoc.translate("type1")),
              value: 0,
            ),
            DropdownMenuItem<int>(
              child: Text(appLoc.translate("type2")),
              value: 1,
            ),
            DropdownMenuItem<int>(
              child: Text(appLoc.translate("type4")),
              value: 2,
            ),
            const DropdownMenuItem<int>(
              child: Text('Liquor'),
              value: 3,
            ),
          ],
          selectedValue: _selectedType,
          valueChanged: (value) {
            _selectedType = value;
          },
          onSaved: (value) => _signUpModel.businesstype = value == 0
              ? "Retail"
              : value == 1
                  ? "Wholesale"
                  : value == 2 ? "Cart Vendor" : 'Liquor',
        ),
        CustomDropDownField(
          prefixIcon: const Icon(Icons.departure_board),
          title: "Select Delivery Type",
          items: [
            const DropdownMenuItem<int>(
              child: Text("Delivery"),
              value: 0,
            ),
            const DropdownMenuItem<int>(
              child: Text("Pickup"),
              value: 1,
            ),
            const DropdownMenuItem<int>(
              child: Text("Delivery or Pickup"),
              value: 2,
            ),
          ],
          valueChanged: (value) {
            _selectedDelivery = value;
          },
          selectedValue: _selectedDelivery,
          onSaved: (value) {
            _signUpModel.deliveryType = value == 0
                ? "Delivery"
                : value == 1 ? "Pickup" : "Delivery or Pickup";
          },
        ),
        CustomTextField(
          controller: _usernameController,
          prefixIcon: Icons.perm_identity,
          title: appLoc.translate("username"),
          onSaved: (value) => _signUpModel.username = value,
          initialValue: null,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter Vendor Name';
            }
            return null;
          },
        ),
        CustomTextField(
            controller: _passwordController,
            prefixIcon: Icons.lock,
            obscure: true,
            maxLines: 1,
            initialValue: null,
            title: appLoc.translate("password"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) => _signUpModel.password = value),
        CustomTextField(
          controller: _onameController,
          prefixIcon: Icons.person,
          initialValue: null,
          title: appLoc.translate("boname"),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter your Full Name';
            }
            return null;
          },
          onSaved: (value) => _signUpModel.businessowner = value,
        ),
        CustomTextField(
          controller: _compnameController,
          prefixIcon: Icons.store,
          initialValue: null,
          title: appLoc.translate("companyName"),
          onSaved: (value) => _signUpModel.companyname = value,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter Company Name';
            }
            return null;
          },
        ),
        CustomTextField(
          controller: _emailController,
          prefixIcon: Icons.email,
          initialValue: null,
          title: appLoc.translate("email"),
          inputType: TextInputType.emailAddress,
          onSaved: (value) => _signUpModel.email = value,
        ),
        CustomTextField(
          controller: _addressController,
          prefixIcon: Icons.location_on,
          initialValue: null,
          title: appLoc.translate("address"),
          minLines: 1,
          maxLines: 3,
          inputType: TextInputType.multiline,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter Address';
            }
            return null;
          },
          onSaved: (value) => _signUpModel.address = value,
        ),
        const Text(
          "Note: Please Enter Address in English only.",
          style: TextStyle(color: Colors.green),
        ),
        CustomTextField(
          controller: _countryController,
          prefixIcon: Icons.my_location,
          initialValue: null,
          title: appLoc.translate("country"),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter Country';
            }
            return null;
          },
          onSaved: (value) => _signUpModel.country = value,
        ),
        CustomTextField(
          controller: _stateController,
          prefixIcon: Icons.map,
          initialValue: null,
          title: appLoc.translate("state"),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter State';
            }
            return null;
          },
          onSaved: (value) => _signUpModel.state = value,
        ),
        CustomTextField(
          controller: _cityController,
          prefixIcon: Icons.location_city,
          initialValue: null,
          title: appLoc.translate("city"),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter City';
            }
            return null;
          },
          onSaved: (value) => _signUpModel.city = value,
        ),
        CustomTextField(
          controller: _pincodeController,
          prefixIcon: Icons.code,
          initialValue: null,
          title: appLoc.translate("pinCode"),
          inputType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter Pincode';
            }
            return null;
          },
          onSaved: (value) => _signUpModel.pincode = value,
        ),
        CustomTextField(
          controller: _mobController,
          initialValue: null,
          prefixIcon: Icons.call,
          title: appLoc.translate("mobileNo"),
          inputType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter Mobile No.';
            }
            if (value.length > 10 || value.length < 10) {
              return 'Invalid Mobile No.';
            }
            return null;
          },
          onSaved: (value) => _signUpModel.mobileno = value,
        ),
        Row(
          children: <Widget>[
            CustomCheckbox(
                value: checkBoxValue,
                activeColor: Colors.green,
                onChanged: (newValue) {
                  checkBoxValue = newValue;
                }),
            GestureDetector(
              child: const Text(
                "Terms And Conditions",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
              onTap: () {},
            )
          ],
        ),
        const SizedBox(height: 20),
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
