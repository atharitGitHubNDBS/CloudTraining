*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_compute DEFINITION.

  PUBLIC SECTION.
*   Public Variable
    DATA: lv_public_number TYPE i.

    METHODS set_secret IMPORTING pv_input TYPE i.
    METHODS get_secret EXPORTING pv_output TYPE i.
    METHODS return_secret RETURNING VALUE(pv_return) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
*   Private Variable
    DATA: lv_secret_number TYPE i.

ENDCLASS.

CLASS lcl_compute IMPLEMENTATION.

  METHOD get_secret.
    pv_output = lv_secret_number.
  ENDMETHOD.

  METHOD return_secret.
    RETURN lv_secret_number.
  ENDMETHOD.

  METHOD set_secret.
    lv_secret_number = pv_input.
  ENDMETHOD.

ENDCLASS.