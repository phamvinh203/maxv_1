<![CDATA[
function onChange$GridVoucherTax$TaxCode(o) {o.grid.request(o, 'GetTaxRate', 'TaxCode', ['ma_thue'], ['loai_ct'], true);}
function onChange$GridVoucherTax$TaxAccount(o) {o.grid.request(o, 'GetAccountType', 'AccountType', ['tk_thue_no'], o);}
function onChange$GridVoucherTax$Supplier(o) {o.grid.request(o, 'Supplier', 'Supplier', ['ma_kh'], o);}
function on$GridVoucherTax$ExecuteCommand(sender, e) {
  var action = e.type.Action, z = sender, o = e.type.Object, f = z.get_element().parentForm;
  switch (action) {
    case 'AfterRemoveRow':
      on$GridVoucherTax$RowChange(z, f);
      break;
    case 'AfterCloneRow':
      z.setItemFieldValue('stt_rec0', e.type.Value, '');
      on$GridVoucherTax$RowChange(z, f);
      break;
    case 'AfterInsertRow':
      var z = f.getItem("r30")._controlBehavior; 
      setDefault$Voucher$Tax(f);
      break;
    case 'Check':
      z.validRowExpression('ma_kh2', '([ma_thue] == "") || (![tk_cn]) || ([ma_kh2] != "")');
      break;
    default:
      break;
  }
}
function onChange$GridVoucherTax$(sender, eventArgs) {
  var o = eventArgs.get_object(), z = o.grid, f = z.get_element().parentForm, name = o.field.Name;
  switch (name) {
    case 't_tien_nt':
      z.validExpression(o, [z.$a.z_t_tien, z.$a.z_t_thue_nt, z.$a.z_t_thue], [z.$a.t_thue_nt, z.$a.t_thue], [z.$a.t_tt_nt, z.$a.t_tt]);
      break;
    case 't_thue_nt':
      z.validExpression(o, [z.$a.z_t_thue, z.$a.z_t_thue_tg], [z.$a.t_thue_nt, z.$a.t_thue], [z.$a.t_tt_nt, z.$a.t_tt]);
      break;
    case 't_tien':
      z.validExpression(o, [z.$a.z_t_thue], [z.$a.t_thue], [z.$a.t_tt], 't_thue');
      break;
    case 't_thue':
      z.validExpression(o, null, [z.$a.t_thue], [z.$a.t_tt]);
      break;
    default:
      break;
  }
}
function on$GridVoucherTax$RowChange(z, f) {
  z.executeAggregate([z.$a.t_thue_nt, z.$a.t_thue]);
  f.executeExpression([z.$a.t_tt_nt, z.$a.t_tt]);
}
function on$GridVoucherTax$ResponseComplete(sender, e) {
  var z = e.object, context = e.type.Context, result = e.type.Result, o = e.type.Object, f = z.get_element().parentForm;
  switch (context) {
    case 'TaxCode':    
      var r = result[0].Value;
      if (z._getItemValue(o.row, z._getColumnOrder('thue_suat')) != r) {
        z.setItemGridBehavior(o, [['thue_suat', result[0].Value, '', false]]);
        z.validExpression(o, [z.$a.z_t_thue_nt, z.$a.z_t_thue], [z.$a.t_thue_nt, z.$a.t_thue], [z.$a.t_tt_nt, z.$a.t_tt]);
      }     
      z.setItemGridBehavior(o, [['tk_thue_no', result[1].Value, '', true], ['tk_cn', result[2].Value, '', false]]);
      break;
    case 'AccountType':
      z.setItemGridBehavior(o, [['tk_cn', result[0].Value, '', false]]);
      break;
    case 'Supplier':
      z.setItemGridBehavior(o, [['dia_chi', result[0].Value, '', true], ['ma_so_thue', result[1].Value, '', true]]);
      z.live(o, 'dia_chi');
      break;
    default:
      break;
  }
}
function dispose$GridVoucherTax$(z) {
  z.$a = null;
  try {z.remove_commandEvent(on$GridVoucherTax$ExecuteCommand);} catch (ex) {}
  try {z.remove_itemValueChanged(onChange$GridVoucherTax$);} catch (ex) {}
  try {z.remove_onResponseComplete(on$GridVoucherTax$ResponseComplete);} catch (ex) {}
}
function setDefaultTaxItems(z, row, columns, f, fields) {
  for (var i = 0; i < columns.length; i++) {
    if (fields) setDefaultTaxItem(z, row, columns[i], f, fields[i]);
      else setDefaultTaxItem(z, row, columns[i], f[i]);
  }
}
function setDefaultTaxItem(z, row, columnName, f, fieldName) {
  if (fieldName != null) z._setItemValue(row, z._getColumnOrder(columnName), f.getItemValue(fieldName));
    else z._setItemValue(row, z._getColumnOrder(columnName), f);
}
function load$GridVoucherTax$(z) {
  z.add_itemValueChanged(onChange$GridVoucherTax$);
  z.add_onResponseComplete(on$GridVoucherTax$ResponseComplete);
  z.add_commandEvent(on$GridVoucherTax$ExecuteCommand);
  z.$a = {  
    z_t_tien: '[t_tien]:=[t_tien_nt]*[$ty_gia]',    
    z_t_thue_nt: '[t_thue_nt]:=[t_tien_nt]*[thue_suat]/100',
    z_t_thue: '[t_thue]:=[t_tien]*[thue_suat]/100',
    z_t_thue_tg: 't_thue:=[t_thue_nt]*[$ty_gia]',

    t_tien_nt: ['t_tien_nt', 't_tien_nt'],
    t_tien: ['t_tien', 't_tien'],   
    t_thue: ['t_thue', 't_thue'],
    t_thue_nt: ['t_thue_nt', 't_thue_nt']
]]>