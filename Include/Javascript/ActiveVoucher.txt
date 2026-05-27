<![CDATA[
  objectBehavior$Voucher$Number.create(f, 'so_ct', 'ma_nk');
  objectBehavior$Voucher$Currency.create(f);
  f.add_onResponseComplete(on$Voucher$ResponseComplete);
  f.add_commandEvent(on$Voucher$ExecuteCommand);
]]>