CLASS zcl_demo_d01e07_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_d01e07_000 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lr_compute TYPE REF TO lcl_compute.
    DATA: lv_number  TYPE i VALUE 99,
          lv_result  TYPE i.

    out->write(  '********** Local Class **********' ).
    out->write(  `---------------------------` ).
    out->write(  `INSTANTIATE with NEW #()` ).
    out->write(  `---------------------------` ).
    lr_compute = NEW #( ).

    out->write(  `---------------------------` ).
    out->write(  `SET_SECRET` ).
    out->write(  `---------------------------` ).
    lr_compute->set_secret( pv_input = lv_number ).
    out->write( |Set secret to { lv_number }| ).
    out->write( |Current value of lv_result is { lv_result }| ).

    out->write(  `---------------------------` ).
    out->write(  `GET_SECRET` ).
    out->write(  `---------------------------` ).
    out->write( |lr_compute->get_secret| ).
    lr_compute->get_secret(
      IMPORTING
        pv_output = lv_result
    ).
    out->write( |Current value of lv_result is { lv_result }| ).

    out->write(  `---------------------------` ).
    out->write(  `SET_SECRET` ).
    out->write(  `---------------------------` ).
    lv_number = 97.
    lr_compute->set_secret( pv_input = lv_number ).
    out->write( |Set secret to { lv_number }| ).

    out->write(  `---------------------------` ).
    out->write(  `RETURN_SECRET` ).
    out->write(  `---------------------------` ).
    out->write( |lr_compute->return_secret| ).
    out->write( |Current value of secret number is { lr_compute->return_secret( ) }| ).

    out->write(  `---------------------------` ).
    out->write(  `Assign PUBLIC Value` ).
    out->write(  `---------------------------` ).
    lr_compute->lv_public_number = 11.
    out->write( |lr_compute->public_number = { lr_compute->lv_public_number }| ).


  ENDMETHOD.

ENDCLASS.