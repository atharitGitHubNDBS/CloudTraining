@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View : PO Item'
define view entity ZI_Demo_PurchaseOrder_Item_000
  as select from I_PurchaseOrderItemAPI01
  association to parent ZI_Demo_PurchaseOrder_000 as _PurchaseOrder
    on _PurchaseOrder.PurchaseOrder = $projection.PurchaseOrder 
  association [0..1] to ZI_Demo_PurchaseOrder_SUM_000 as _SumGR
  on    _SumGR.PurchaseOrder        = $projection.PurchaseOrder
  and   _SumGR.PurchaseOrderItem    = $projection.PurchaseOrderItem
{
  key PurchaseOrder,
  key PurchaseOrderItem,
  
      Material,
      MaterialType,
      Plant,
      PurchaseOrderQuantityUnit,
      OrderQuantity,
      
      _PurchaseOrder,
      _SumGR // Make association public
}
