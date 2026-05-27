<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\TransferLockedDate.txt">
  <!ENTITY Calc "exec pr_Codatinhlk @nam">
  <!ENTITY FiscalYearClosing SYSTEM "..\Include\Command\FiscalYearClosing.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Tính số phát sinh lũy kế dự án" e="Calculate Project/Job Accumulation"></title>&FiscalYearClosing;
</dir>
