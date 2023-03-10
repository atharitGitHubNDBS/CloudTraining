@EndUserText.label: 'Parameter : Input Goods Receipt Qty'
@Metadata.allowExtensions: true
define abstract entity ZA_Goods_Receipt_Qty_000
{
  @Semantics.quantity.unitOfMeasure : 'Unit'
  QtyReceipt : zqty_count;
  Unit     : abap.unit(3);
}
