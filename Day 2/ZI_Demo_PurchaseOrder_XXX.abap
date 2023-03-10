@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View : PO Header'
define root view entity ZI_Demo_PurchaseOrder_000
  as select from I_PurchaseOrderAPI01
  composition [1..*] of ZI_Demo_PurchaseOrder_Item_000 as _PurchaseOrderItem
{
  key PurchaseOrder,
      PurchaseOrderType,
      Supplier,
      CreatedByUser,
      PurchaseOrderDate,
      PurchasingOrganization,
      _PurchaseOrderItem // Make association public
}
