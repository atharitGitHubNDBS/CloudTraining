@Metadata.layer: #CORE
annotate entity ZC_Demo_PurchaseOrder_Item_000 with
{
  @UI: { lineItem: [ { position: 10 },
         { type: #FOR_ACTION, dataAction: 'GoodsReceipt', label: 'Goods Receipt' } ],
         selectionField: [ { position: 10 } ] }
  PurchaseOrder;
  @UI:{ lineItem: [{position: 20 }] }
  PurchaseOrderItem;
  @UI:{ lineItem: [{position: 30 }] }
  Material;
  @UI:{ lineItem: [{position: 40 }] }
  MaterialType;
  @UI:{ lineItem: [{position: 50 }] }
  Plant;
  @UI:{ lineItem: [{position: 60 }] }
  PurchaseOrderQuantityUnit;
  @UI:{ lineItem: [{position: 70 }] }
  OrderQuantity;
  @UI:{ lineItem: [{position: 80 }] }
  SumGRQuantity;
}