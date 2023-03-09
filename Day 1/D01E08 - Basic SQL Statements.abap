CLASS zcl_demo_d01e08_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_d01e08_000 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA company_code_name TYPE c LENGTH 40.
    DATA city_name         TYPE c LENGTH 25.
    DATA currency          TYPE waers_curc.
**********************************************************************
* Example 1: Single field from Single Record
**********************************************************************
    SELECT SINGLE
      FROM i_companycode
      FIELDS companycodename
      WHERE companycode = '1000'
        INTO @company_code_name.

    out->write(  '********** Basic SQL Statements **********' ).
    out->write( `----------`  ).
    out->write( `Example 1:`  ).

    out->write( |Company Code Name of Company 1000 is { company_code_name }.| ).

**********************************************************************
* Example 2: Multiple Fields from Single Record
**********************************************************************
    SELECT SINGLE
      FROM i_companycode
      FIELDS cityname, currency
      WHERE companycode = '2000'
        INTO (  @city_name, @currency ).

    out->write( `----------`  ).
    out->write( `Example 2:`  ).

    out->write( |Company Code 2000 located in { city_name } used currency as { currency }| ).

**********************************************************************
* Example 3: Empty Result and sy-subrc
**********************************************************************
    SELECT SINGLE
      FROM i_companycode
      FIELDS cityname
      WHERE companycode = '9999'
        INTO @city_name.
    IF sy-subrc = 0.

      out->write( `----------`  ).
      out->write( `Example 3:`  ).
      out->write( |City Name of Company 9999 is {  city_name }.| ).

    ELSE.

      out->write( `----------`  ).
      out->write( `Example 3:`  ).
      out->write( |There is no city name maintained for company 9999!| ).

    ENDIF.

**********************************************************************
* Example 4: CDS Association
**********************************************************************
    SELECT SINGLE
      FROM i_companycode
      FIELDS CompanyCode, \_Country-CountryThreeLetterISOCode
      WHERE companycode = '1000'
        INTO ( @DATA(lv_CompanyCode), @DATA(lv_iso) ).


    out->write( `----------`  ).
    out->write( `Example 4:`  ).
    out->write( |Country ISO Code of Company Code 1000 is { lv_iso }| ).


  ENDMETHOD.

ENDCLASS.