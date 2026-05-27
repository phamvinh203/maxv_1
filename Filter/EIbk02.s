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
        <item value="0">	
          <text v="Tổng cục thuế đã nhận" e="TCT receipted"/>
        </item>
        <item value="1">	
          <text v="Đang tiến hành ktra điều kiện cấp mã" e="Checking"/>
        </item>
        <item value="2">	
          <text v="CQT từ chối hóa đơn theo từng lần phát sinh" e="Refuse to issue code"/>
        </item>
        <item value="3">	
          <text v="Hóa đơn đủ điều kiện cấp mã" e="Invoices are eligible for code issuance"/>
        </item>
        <item value="4">	
          <text v="Hóa đơn không đủ điều kiện cấp mã" e="Invoices are not eligible for code issuance"/>
        </item>
        <item value="5">	
          <text v="Đã cấp mã hóa đơn" e="Invoice code has been issued"/>
        </item>
        <item value="6">
          <text v="Tổng cục thuế đã nhận không mã" e="Received Invoice no code"/>
        </item>
        <item value="7">
          <text v="Đã kiểm tra định kỳ HĐĐT không mã" e="Periodically checked e-invoices without codes"/>
        </item>
        <item value="8">
          <text v="Tổng cục thuế đã nhân hóa đơn có khởi tạo từ máy tính tiền" e="Received Invoice from Cash Register"/>
        </item>			
      </items>
    </field>	  
   
	<field name="mst_ngmua">
      <header v="MST người mua" e="Tax Code"></header>
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
      <items style="AutoComplete" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
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
	  
	  <item value="110100: [mst_ngmua].Label, [mst_ngmua], [ten_kh%l]"/>
	  <item value="110---: [mau_hd].Label,[mau_hd]"/>
	  <item value="110---: [so_seri].Label,[so_seri]"/>
	  <item value="110---: [so_ct].Label,[so_ct]"/>
	  
	  <item value="11000-: [ma_dvcs].Label,[ma_dvcs]"/>
	  <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>/LvSo8vB9zt7uJMuf/8Zlo6nZWQeKw94EC0opGGLTG3uWK83slibGHfmA0sHpHQ5CCK8BQYGtyTUZwWIRJz9uT58/wfpvHjz1ujH+yH/RTYswF8WvTI8bJs2sBhXI5uZz0ok31xny9UWiXlRhOFRjrlHxb+fx/ggRVOiCGankeA3fH1PNHjbUhWOL7sHMVzbu31Bg2Rm9fDSv/vPCNIiUXyvc/UjdVTgznxGFetHeWc=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>gcJ+6zEMjWuzEObnymya/nF7ed0ahjbJGvtv1lqh7o/KT6M32a3ob2li1+SapHY4BaMhmJOU9rd6FZI7vKRLhnjVTAaVmrNJEaOAkNcsu4UXYtSwOwmL5XomlQvpRku0wNyMLJzbt5Z0dbVA93+vAvuwVVjIYFOBydx3MvqXLC4pR8yuMpykTiWG9PCLyX8pToaLh/hSjA3qzw6mjwDT4flz04DMjoI0yKDsVEAKNYuwYs7PjEG3EfnaV3V4eX8NPBKjSBd7eRpDYGcrzXTRNyemu78tUkWgoAj8igmVwn+8mrqSTnodn1iSQQs53Ku4U6TcIM8E+Y3cBHcZ32qcuYaU8ohwn9TG/Eq2eM35D+DccaXkFHkYmDIXFUc0SpIdFuA2ewxLntEDL4BZEPwULd48zqrcJo2PDYJBnOPMYjhl+dpJccv2I1EsaX1eXD0rn2XG9SFeM4k/XvTo8gJclvMGwnJgmuMW0K+I22S+GWt3n6ea/9Sb8axPfz0uhqOveaVXOogOsgAdUyhmPyOgjzw0cxiQxTm1zq+ZUulqJFQMEMc4I9oaMgZjrvn5ZZTJ+n4t1mzub9zSSxA0o+FxylHiyeyrRTKzSefrmkDypoQ=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
