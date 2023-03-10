CLASS zcl_demo_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_eml IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA: lw_key_mat  TYPE TABLE FOR READ IMPORT i_materialdocumenttp,
              lw_key_item TYPE TABLE FOR READ IMPORT i_materialdocumentitemtp.
        DATA: lv_po      TYPE c LENGTH 10 VALUE '2100000001',
              lv_po_item TYPE n LENGTH 5  VALUE '00010'.

        SELECT SINGLE *
          FROM i_materialdocumentitem_2
          WHERE purchaseorder = @lv_po
          INTO @DATA(lw_matdoc_item).

        lw_key_mat = VALUE #(
          ( materialdocumentyear = lw_matdoc_item-materialdocumentyear
            materialdocument = lw_matdoc_item-material )
          ).
        lw_key_item = VALUE #(
        ( materialdocumentyear = lw_matdoc_item-materialdocumentyear
          materialdocument = lw_matdoc_item-materialdocument
          materialdocumentitem = lw_matdoc_item-materialdocumentitem )
          ).

        READ ENTITIES OF i_materialdocumenttp
            ENTITY materialdocument
            ALL FIELDS WITH lw_key_mat
            RESULT DATA(result_head).

        READ ENTITIES OF i_materialdocumenttp
            ENTITY materialdocumentitem
            ALL FIELDS WITH lw_key_item
            RESULT DATA(result_item).

        SELECT SINGLE *
            FROM i_purchaseorderitemapi01
            WHERE purchaseorder = @lv_po
              AND purchaseorderitem = @lv_po_item
            INTO @DATA(lw_db_po_item).

        MODIFY ENTITIES OF i_materialdocumenttp

          ENTITY materialdocument
          CREATE FROM VALUE #( ( %cid = 'CID_001'
          goodsmovementcode = '01'
          postingdate = cl_abap_context_info=>get_system_date( )
          documentdate = cl_abap_context_info=>get_system_date( )
          %control-goodsmovementcode = cl_abap_behv=>flag_changed
          %control-postingdate = cl_abap_behv=>flag_changed
          %control-documentdate = cl_abap_behv=>flag_changed
          ) )
          ENTITY materialdocument
          CREATE BY \_materialdocumentitem
          FROM VALUE #( (
          %cid_ref = 'CID_001'
          %target = VALUE #( ( %cid = 'CID_ITM_001'
          plant = lw_db_po_item-plant
          purchaseorder = lv_po
          purchaseorderitem = lv_po_item
          material = lw_db_po_item-material
          goodsmovementtype = '101'
          storagelocation = lw_db_po_item-storagelocation
          quantityinentryunit = '1'
          entryunit = lw_db_po_item-purchaseorderquantityunit
          goodsmovementrefdoctype = 'B'
*          batch = ''
          %control-plant = cl_abap_behv=>flag_changed
          %control-purchaseorder = cl_abap_behv=>flag_changed
          %control-purchaseorderitem = cl_abap_behv=>flag_changed
          %control-material = cl_abap_behv=>flag_changed
          %control-goodsmovementtype = cl_abap_behv=>flag_changed
          %control-storagelocation = cl_abap_behv=>flag_changed
          %control-quantityinentryunit = cl_abap_behv=>flag_changed
          %control-entryunit = cl_abap_behv=>flag_changed
          %control-goodsmovementrefdoctype = cl_abap_behv=>flag_changed
*          %control-batch = cl_abap_behv=>flag_changed
          ) )
          ) )
          MAPPED DATA(ls_create_mapped)
          FAILED DATA(ls_create_failed)
          REPORTED DATA(ls_create_reported).
*

        COMMIT ENTITIES BEGIN
            RESPONSE OF i_materialdocumenttp
            FAILED DATA(commit_failed)
            REPORTED DATA(commit_reported).

*        LOOP AT mapped-materialdocument ASSIGNING FIELD-SYMBOL(<keys_header>).
*
*          CONVERT KEY OF i_materialdocumenttp
*          FROM <keys_header>-%pid
*          TO <keys_header>-%key.
*        ENDLOOP.
*
*        LOOP AT mapped-materialdocumentitem ASSIGNING FIELD-SYMBOL(<keys_item>).
*
*          CONVERT KEY OF i_materialdocumentitemtp
*          FROM <keys_item>-%pid
*          TO <keys_item>-%key.
*        ENDLOOP.

        COMMIT ENTITIES END.

      CATCH cx_root INTO DATA(lo_exception).
        DATA(result) = lo_exception->get_text(  ).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.