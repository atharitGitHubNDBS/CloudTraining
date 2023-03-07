CLASS zcl_demo_d01e02_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_d01e02_000 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

**********************************************************************
*   Data Objects with Built-in Types
**********************************************************************

    " comment/uncomment the following declarations and check the output
    DATA variable TYPE string.
*    DATA variable TYPE i.
*    DATA variable TYPE d.
*    DATA variable TYPE c LENGTH 10.
*    DATA variable TYPE n LENGTH 10.
*    DATA variable TYPE p LENGTH 8 DECIMALS 2.

**********************************************************************
*   Output
**********************************************************************

    out->write(  '********** Data Objects with Built-in Types **********' ).
    out->write(  'variable : Result with Initial Value)' ).
    out->write(   variable ).
    out->write(  '---------' ).

    variable = '19891109'.

    out->write(  'variable : Result with Value 19891109' ).
    out->write(   variable ).
    out->write(  '---------' ).

**********************************************************************
* Variable based on Local Types
**********************************************************************

* Comment/Uncomment the following lines to change the type of my_var
    TYPES my_type TYPE p LENGTH 3 DECIMALS 2.
*    TYPES my_type TYPE i .
*    TYPES my_type TYPE string.
*    TYPES my_type TYPE n length 10.

*   Variable based on local type
    DATA my_variable TYPE my_type.

    out->write(  '********** Variable based on Local Types **********' ).
    out->write(  'my_variable (TYPE MY_TYPE)' ).
    out->write(   my_variable ).

**********************************************************************
* Variable based on Global Types
**********************************************************************

* Variable based on global type .
    " Place cursor on variable and press F2 or F3
    DATA item_text TYPE sgtxt VALUE 'FRA'.

    out->write(  '********** Variable based on Global Types **********' ).
    out->write(  `item_text (TYPE SGTXT)` ).
    out->write(   item_text ).

**********************************************************************
* Constants
**********************************************************************

    CONSTANTS c_text   TYPE string VALUE `Hello World`.
    CONSTANTS c_number TYPE i      VALUE 12345.

    "Uncomment this line to see syntax error ( VALUE is mandatory)
*  constants c_text2   type string.

    out->write(  '********** Constants **********' ).
    out->write(  `c_text (TYPE STRING)` ).
    out->write(   c_text ).
    out->write(  '---------' ).

    out->write(  `c_number (TYPE I )` ).
    out->write(   c_number ).
    out->write(  `---------` ).

**********************************************************************
* Literals
**********************************************************************

    out->write(  '********** Literals **********' ).
    out->write(  '12345               ' ).    "Text Literal   (Type C)
    out->write(  `12345               ` ).    "String Literal (Type STRING)
    out->write(  12345                  ).    "Number Literal (Type I)

    "uncomment this line to see syntax error (no number literal with digits)
*    out->write(  12345.67                  ).

  ENDMETHOD.

ENDCLASS.