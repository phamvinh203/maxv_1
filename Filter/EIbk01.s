<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
     <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="HĐĐT từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
	
<field name="trang_thai_hd" allowNulls="false" clientDefault="*">
      <header v="Trạng thái hóa đơn" e="Status EInvoice"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="*">
          <text v="Tất cả" e="All"/>
        </item>
        <item value="1">
          <text v="Hóa đơn mới" e="New EInvoice"/>
        </item>
        <item value="2">
          <text v="Hóa đơn thay thế" e="Replacement EInvoice"/>
        </item>
        <item value="3">
          <text v="Hóa đơn điều chỉnh" e="Adjust EInvoice"/>
        </item>		
        <item value="4">
          <text v="Hóa đơn bị thay thế" e="Replaced EInvoice"/>
        </item>		
        <item value="5">
          <text v="Hóa đơn đã bị điều chỉnh" e="Adjusted EInvoice"/>
        </item>	
        <item value="6">
          <text v="Hóa đơn đã bị hủy" e="Cancel EInvoice"/>
        </item>	
      </items>
    </field>	  
  <field name="ket_qua_hd" allowNulls="false" clientDefault="*">
      <header v="Kết quả kiểm tra hóa đơn" e="Check results EInvoice"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="*">	
          <text v="Tất cả" e="All"/>
        </item>	    
        <item value="5">	
          <text v="Đã cấp mã hóa đơn" e="Invoice code has been issued"/>
        </item>
        <item value="6">
          <text v="Tổng cục thuế đã nhận không mã" e="Received Invoice no code"/>
        </item>
        <item value="8">
          <text v="Tổng cục thuế đã nhân hóa đơn có khởi tạo từ máy tính tiền" e="Received Invoice from Cash Register"/>
        </item>			
      </items>
    </field>	  
   
	<field name="mst_ngban">
      <header v="MST người bán" e="Tax Code"></header>
	  <items style="AutoComplete"  controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field> 
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="mau_hd" >
      <header v="Mẫu số" e="EInvoice Form"></header>
    </field>
    <field name="so_seri" >
      <header v="Ký hiệu" e="Seri No."></header>
    </field>
    <field name="so_ct" >
      <header v="Số hóa đơn" e="Invoice No."></header>
    </field>	
	
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"/>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
	<field name="mau_bc" categoryIndex="1" allowNulls="false">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList" >
		<item value="10">
			<text v="Tiền hạch toán" e="GL Amount Invoice"/>
		</item>
		<item value="20">
			<text v="Tiền theo hóa đơn" e="Amount Invoice"/>
		</item>
      </items>
	<clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="150, 30, 70, 100, 100, 130,0"/>
	  <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
	  <item value="11000-: [trang_thai_hd].Label, [trang_thai_hd]"/>
	  <item value="11000-: [ket_qua_hd].Label, [ket_qua_hd]"/>
	  
	  <item value="110100: [mst_ngban].Label, [mst_ngban], [ten_kh%l]"/>
	  <item value="110---: [mau_hd].Label,[mau_hd]"/>
	  <item value="110---: [so_seri].Label,[so_seri]"/>
	  <item value="110---: [so_ct].Label,[so_ct]"/>
	  
	  <item value="110---: [ma_dvcs].Label,[ma_dvcs]"/>
	  <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>/LvSo8vB9zt7uJMuf/8Zlkkv3phdAPslwMPFOzRyK8yRlusZcKEn0mEWnXyXsRh4y9MX/qIB15KOZnUX7UGm3FoanKLDcIok+c8X+UEEdCaPrpEvBGrDrV0yUTKgCTrNPqmm/YJxwluQct22NdxIvYPO3BPthgI+bZgnZjyjS5dyVSr3Uzf6+zMRCnom33ndamBaeoeHRs2/Tmw94lMptGwDg5ETytA5AN4beD3qX44=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>VZm7idYgzoq0oBL+7RvhOHrLAVJlCVLMjbMo9PQ0SDicLX3AlpA7Zo1AnNiTjpXhGAXm9sP70Xbxh4p4QsPB+ZubWyti6LFl119GmX71dUDhfKIc4N35aU/LLbTncv64ywILSBtfegdgXKjHpZvgxmjYpZmOn00tUsjRZX/jfhM3X/bBs8xc6RZcazTmQt0ryoKwrTiNlQU2dvv7bWrCa5/F4uI8ovJLPEfiC1xHuCUEZDmBet1tHsUNFrHiMM1f+znQP5WiEWyN6Doyy4K1H2f4gdKQO+X38mMWAsJK8Yb+hv/C3ujimCB0ulSwpVcSEgNp2YCqBNoMHQaSZmj0lwuTX7ULXeywWLQ7fwbWsFlIelFc+hqFdX1rcPoznel7IKr5qD6LXQbUSIP8wCTJ3NudBFBoRqz0mwRRVCbtZyw6Ejv6hM6n0cZTwfY0wL+PzRrQHOWxwZi2epru43vvG3rAK2GuBqZlqF0YxDLNy+Xokn9/Iq03ZIjYHFFUwluwu0+Gy8S9PiQh6kUpXO1cHwkJPupgqTio1GJjrmWBjmDlGmJBJhJxgyV5UjAlMFn7H1vRhVBC8QXImBQWJkZm/tgrw27Po+jhcTe5r3MBFjE=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
