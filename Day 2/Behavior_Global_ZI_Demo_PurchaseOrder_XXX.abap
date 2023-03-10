unmanaged implementation in class zbp_i_demo_purchaseorder_000 unique;
//strict ( 1 );

define behavior for ZI_Demo_PurchaseOrder_000 //alias <alias_name>
//late numbering
lock master
authorization master ( instance )
//etag master <field_name>
{
  //  create;
  //  update;
  //  delete;
//  action ( features : instance ) GoodsReceipt parameter ZA_Goods_Receipt_Qty_000 result [1] $self;
//  field ( suppress ) PurchasingOrganization;
  association _PurchaseOrderItem { }
//  association _PurchaseOrderItem { }
}

define behavior for ZI_Demo_PurchaseOrder_Item_000 //alias <alias_name>
//late numbering
//lock dependent by _PurchaseOrder
authorization dependent by _PurchaseOrder
//etag master <field_name>
{
  //  update;
  //  delete;
  action GoodsReceipt parameter ZA_Goods_Receipt_Qty_000 result [1] $self;
  field ( readonly ) PurchaseOrder;
  association _PurchaseOrder;
}