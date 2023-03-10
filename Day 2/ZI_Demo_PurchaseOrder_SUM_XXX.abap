@AbapCatalog.sqlViewName: 'ZIPO_SUM_000'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View : PO Item History (SUM)'
define view ZI_DEMO_PURCHASEORDER_SUM_000
  as select from I_PurchaseOrderHistoryAPI01
{
  key PurchaseOrder,

  key PurchaseOrderItem,

      PurchaseOrderQuantityUnit,

      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      sum(       
      case DebitCreditCode
        when 'S' then Quantity
        when 'H' then -1 * Quantity
        else 0
      end 
      ) as SumGRQuantity
      
}
where PurchasingHistoryDocumentType = '1' // GR Related
group by
  PurchaseOrder,
  PurchaseOrderItem,
  PurchaseOrderQuantityUnit
