<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\TransferLockedDate.txt">
  <!ENTITY Calc "exec pr_Whsdkc @nam">
  <!ENTITY FiscalYearClosing SYSTEM "..\Include\Command\FiscalYearClosing.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chuyển tồn kho sang năm sau" e="Transfer Stock to Next Year"></title>&FiscalYearClosing;
</dir>
