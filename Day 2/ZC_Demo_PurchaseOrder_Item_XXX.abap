@EndUserText.label: 'Consumption View : PO Item'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_Demo_PurchaseOrder_Item_000
  as projection on ZI_Demo_PurchaseOrder_Item_000
{
  key PurchaseOrder,
  key PurchaseOrderItem,
      Material,
      MaterialType,
      Plant,
      PurchaseOrderQuantityUnit,
      OrderQuantity,
      _SumGR.SumGRQuantity,
      /* Associations */
      _PurchaseOrder : redirected to parent ZC_Demo_PurchaseOrder_000
}
