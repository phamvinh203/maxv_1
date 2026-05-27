<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\TransferLockedDate.txt">
  <!ENTITY Calc "exec pr_Sosdhdkc @nam">
  <!ENTITY FiscalYearClosing SYSTEM "..\Include\Command\FiscalYearClosing.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Kết chuyển số dư hợp đồng sang năm sau" e="Transfer Contract Balance to Next Year"></title>&FiscalYearClosing;
</dir>
