@EndUserText.label: 'Consumption View : PO Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_Demo_PurchaseOrder_000
  as projection on ZI_Demo_PurchaseOrder_000
{
  key PurchaseOrder,
      PurchaseOrderType,
      Supplier,
      CreatedByUser,
      PurchaseOrderDate,
      PurchasingOrganization,
      /* Associations */
      _PurchaseOrderItem : redirected to composition child ZC_Demo_PurchaseOrder_Item_000
}
