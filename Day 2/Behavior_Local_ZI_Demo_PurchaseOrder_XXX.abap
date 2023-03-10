CLASS lhc_zi_demo_purchaseorder_000 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS get_instance_features FOR INSTANCE FEATURES
*      IMPORTING keys REQUEST requested_features FOR zi_demo_purchaseorder_000 RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_demo_purchaseorder_000 RESULT result.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_demo_purchaseorder_000 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zi_demo_purchaseorder_000.

    METHODS rba_purchaseorderitem FOR READ
      IMPORTING keys_rba FOR READ zi_demo_purchaseorder_000\_purchaseorderitem FULL result_requested RESULT result LINK association_links.

*    METHODS cba_purchaseorderitem FOR MODIFY
*      IMPORTING entities_cba FOR CREATE zi_demo_purchaseorder_000\_purchaseorderitem.

ENDCLASS.

CLASS lhc_zi_demo_purchaseorder_000 IMPLEMENTATION.

*  METHOD get_instance_features.
*  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_purchaseorderitem.
  ENDMETHOD.

*  METHOD goodsreceipt.
*  ENDMETHOD.

*  METHOD cba_purchaseorderitem.
*  ENDMETHOD.

ENDCLASS.

CLASS lhc_zi_demo_purchaseorder_item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_demo_purchaseorder_item_000 RESULT result.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_demo_purchaseorder_item_000 RESULT result.

    METHODS rba_purchaseorder FOR READ
      IMPORTING keys_rba FOR READ zi_demo_purchaseorder_item_000\_purchaseorder FULL result_requested RESULT result LINK association_links.

    METHODS goodsreceipt FOR MODIFY
      IMPORTING keys FOR ACTION zi_demo_purchaseorder_item_000~goodsreceipt RESULT result.

ENDCLASS.

CLASS lhc_zi_demo_purchaseorder_item IMPLEMENTATION.

  METHOD read.
  ENDMETHOD.

  METHOD rba_purchaseorder.
  ENDMETHOD.

  METHOD goodsreceipt.

    DATA(lw_key) = keys[ 1 ].

    TRY.

        SELECT SINGLE * FROM I_PurchaseOrderItemAPI01
        WHERE PurchaseOrder = @lw_key-PurchaseOrder
          AND PurchaseOrderItem = @lw_key-PurchaseOrderItem
        INTO @DATA(lw_po_item).

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
          plant = lw_po_item-Plant
          material = lw_po_item-Material
          goodsmovementtype = '101'
          GoodsMovementRefDocType = 'B'
          purchaseorder = lw_po_item-PurchaseOrder
          purchaseorderitem = lw_po_item-PurchaseOrderItem
          storagelocation = lw_po_item-StorageLocation
          batch = cl_abap_context_info=>get_system_date( )

          quantityinentryunit = lw_key-%param-QtyReceipt

          entryunit = lw_po_item-PurchaseOrderQuantityUnit
          %control-plant = cl_abap_behv=>flag_changed
          %control-material = cl_abap_behv=>flag_changed
          %control-goodsmovementtype = cl_abap_behv=>flag_changed
          %control-PurchaseOrder = cl_abap_behv=>flag_changed
          %control-PurchaseOrderItem = cl_abap_behv=>flag_changed
          %control-GoodsMovementRefDocType = cl_abap_behv=>flag_changed
          %control-storagelocation = cl_abap_behv=>flag_changed
          %control-quantityinentryunit = cl_abap_behv=>flag_changed
          %control-entryunit = cl_abap_behv=>flag_changed
          %control-batch = cl_abap_behv=>flag_changed
          ) )
          ) )
          MAPPED DATA(ls_create_mapped)
          FAILED DATA(ls_create_failed)
          REPORTED DATA(ls_create_reported).

      CATCH cx_root INTO DATA(lo_exception).
    ENDTRY.

  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_demo_purchaseorder_000 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zi_demo_purchaseorder_000 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.