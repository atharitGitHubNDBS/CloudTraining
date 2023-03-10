@Metadata.layer: #CORE
annotate entity ZC_Demo_PurchaseOrder_000 with
{

  @UI.facet: [{
        id: 'Header',
        purpose: #STANDARD,
        position: 10,
        label: 'Header Data',
        type: #IDENTIFICATION_REFERENCE
    },
    {
        id: 'Item',
        purpose: #STANDARD,
        type: #LINEITEM_REFERENCE,
        position: 20,
        label: 'Item',
        targetElement: '_PurchaseOrderItem'
    }]

//  @UI: { lineItem: [ { position: 10 },
//         { type: #FOR_ACTION, dataAction: 'GoodsReceipt', label: 'Goods Receipt' } ],
//         selectionField: [ { position: 10 } ] }

  @UI.selectionField: [ { position: 10 } ]
  @UI:{ lineItem: [{position: 10 }] }
  PurchaseOrder;
  @UI:{ lineItem: [{position: 20 }] }
  PurchaseOrderType;
  @UI:{ lineItem: [{position: 30 }] }
  Supplier;
  @UI:{ lineItem: [{position: 40 }] }  
  CreatedByUser;
  @UI:{ lineItem: [{position: 50 }] }  
  PurchaseOrderDate;
//  @UI:{ lineItem: [{position: 60 }] }
//  @UI.hidden: true
//  PurchasingOrganization;
}