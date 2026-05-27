<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
  
   <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Lsx từ ngày/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
	
	<field name="so_ct1" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Lsx từ số/đến số" e="Voucher No. from/to"/>
	  <footer v="Lsx từ số/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
	
  <field name="ma_kh" aliasName="defaultARCustomer">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = '1' or nv_yn = '1') and status = '1'" check="(kh_yn = '1' or nv_yn = '1')"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_sp" aliasName="defaultARCustomer">
      <header v="Sản phẩm" e="Customer"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l"/>
    </field>
    <field name="ten_sp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
	<field name="ma_gd" inactivate="true" clientDefault="*">
      <header v="Mã giao dịch" e="Transaction"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="1 - Sản xuất" e="1 - Manufacture"/>
        </item>
        <item value="2">
          <text v="2 - Làm lại" e="2 - Remake"/>
        </item>
	    <item value="*">
          <text v="* - Tất cả" e="* - All"/>
        </item>
      </items>
    </field>
    <field name="ma_md" inactivate="true" clientDefault="*">
      <header v="Mức độ" e="Transaction"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="1 - Khẩn cấp" e="1 - Manufacture"/>
        </item>
        <item value="2">
          <text v="2 - Càng nhanh càng tốt" e="2 - Remake"/>
        </item>
        <item value="3">
          <text v="3 - Bình thường" e="3 - Remake"/>
        </item>
	    <item value="*">
          <text v="* - Tất cả" e="* - All"/>
        </item>
      </items>
    </field>
	
    <field name="status" inactivate="true" clientDefault="*">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0 - Lập chứng từ" e="0 - No Action"/>
        </item>
        <item value="1">
          <text v="1 - Kế hoạch" e="1 - Plan"/>
        </item>
        <item value="2">
          <text v="2 - Sản xuất" e="2 - Manufacture"/>
        </item>
        <item value="3">
          <text v="3 - Hoàn thành" e="3 - Completed"/>
        </item>
        <item value="4">
          <text v="4 - Đóng" e="4 - Close"/>
        </item>
	    <item value="*">
          <text v="* - Tất cả" e="* - All"/>
        </item>
      </items>
    </field>	
   
  </fields>

  <views>
    <view id="Dir">
      <item value="130, 30, 70, 100, 100, 130"/>
	  <item value="1101--: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
	  <item value="1101--: [so_ct1].Description, [so_ct1], [so_ct2]"/>
	  
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
	  <item value="110100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
	  
	  <item value="1100: [ma_gd].Label, [ma_gd]"/>
      <item value="1100: [ma_md].Label, [ma_md]"/>
      <item value="1100: [status].Label, [status]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>aRehHYES4PWpYHRONx61h+M+jBrZQFzZDeAq2IQsXY3ZR5oV8GwrHnz/zYjStUPVWh8DVqYXNzdeu3pKdaXQdeKTUPM8+HvyNLivYqeugxym6Khg9aUm0QOW5NhdPzC3/c0k9Kys8diI/vfJBzc5mI5bEBXG/v5O8kDhuG7ghkINeT6ln2RhGcWjSwryMekrjR3cv3KlfSQY8RY5Ef+garNYoZECnSKcs5G96E0xNQzar7l+bPC6kOKkhWF9LECMZwovk1yhymMUc1QwggVB3HkkJyYI+Xz1iwzu8kGI2lNKkPw6sly9UotsGHavZKEbOzzieCtyjQ8/xtU/H8LQdIbQFD3bfvsOuld3DGBnecqv8Kh6awJYc0qTtOXFCNMyonl7iwtfLObg1bfBQdlN7jc9Z9npU8RpqC0WWiHjrpFQUzyfwZ9c0MM4f6CjxN+ggUjOr25cGXBEtBGcwp8u43UCNKmqqKWiRduAiobBosk=</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>fUuMZdwcfcygKFgKd/fRsUTuXSwsrWX/0aLNPQwbIpWROXxba+7WNbWIY9AO+sBTa/5ViTCI9o8Zew6A+Yi0Q5kM7mqEe7PTCdv+SMQlv9uHQUt6JEBlf7eIaX8ZGAeON4r3ExtfLNLVpeeQw2GuB+HyZ4W20DYKC5Uiq6KNp9f0YpndJGzS2DyaFTSy1JblHNoFIrFD3DP+i9puC1eDx4SCVLCBnYkgsKjHpDgOImE6aqUDT9mqDWiytIZ06/kwZc5HYiBogaXihGDC9cGDTgOeO2v2gtu18+yD4G7NMY7vBVSGmK/pqH7Ng7oiNxMnkX628Np5Zfbzh2JHx+bA6ZeQ3iAX4y4qxSaNBXOSR/4dFmhZ4Myh6ugVIPnpgAkDMe4xXP3BivCGk+gpqxaloAQ+sMH/60F6/hWDdAymBUAwKq2Z7yw6eWqaUUKJ3yVh</encrypted>]]>
    </text>
  </script>
  &OutlineCss;

</dir>
