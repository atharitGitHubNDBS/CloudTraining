projection;
//strict ( 1 ); //Uncomment this line in order to enable strict mode 2. The strict mode has two variants (strict(1), strict(2)) and is prerequisite to be future proof regarding syntax and to be able to release your BO.

define behavior for ZC_Demo_PurchaseOrder_000 //alias <alias_name>
{

//  use action GoodsReceipt;
  use association _PurchaseOrderItem { }
//  use association _PurchaseOrderItem { }
}

define behavior for ZC_Demo_PurchaseOrder_Item_000 //alias <alias_name>
{
  use action GoodsReceipt;
  use association _PurchaseOrder;
}