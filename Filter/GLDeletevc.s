<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
	
    <field name="tk" categoryIndex="1">
      <header v="Danh sách tài khoản" e="Account List"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ghi_no_co" dataFormatString="1, 2, *" clientDefault="*" align="right" categoryIndex="1">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có, * - Tất cả" e="1 - Debit, 2 - Credit, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Danh sách tk đối ứng" e="Ref. Account List"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Mã khách" e="Customer"/>
      <items style="AutoComplete"  controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_ct" categoryIndex="1">
      <header v="Mã chứng từ" e="Voucher"/>
      <items style="AutoComplete"  controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_ct%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_nt" categoryIndex="1">
      <header v="Ngoại tệ" e="Currency"/>
      <items style="AutoComplete"  controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="dien_giai_c" categoryIndex="1">
      <header v="Diễn giải chứa" e="Description like"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"/>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    
   
    
    <field name="ma_vv" categoryIndex="3">
      <header v="Dự án" e="Project"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="3">
      <header v="Phòng ban" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="so_lsx" categoryIndex="3">
      <header v="Lệnh sản xuất" e="Manufacturing Order"/>
      <items style="AutoComplete" controller="MO" reference="dien_giai" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="dien_giai" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_sp" categoryIndex="3">
      <header v="Sản phẩm" e="Product"/>
      <items style="AutoComplete" controller="Product" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="3">
      <header v="Hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_phi" categoryIndex="3">
      <header v="Phí" e="Expense"/>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_phi%l" readOnly="true" categoryIndex ="3">
      <header v="" e=""/>
    </field>
    <field name="ma_ku" categoryIndex="3">
      <header v="Khế ước" e="Loan Contract"/>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ku%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>

    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>


  </fields>
  <views>
    <view id="Dir" height="220">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
	  <item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
 

      <item value="11000-: [tk].Label, [tk]"/>
      <item value="111000: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000-: [tk_du].Label, [tk_du]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000-: [dien_giai_c].Label, [dien_giai_c]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      

      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [so_lsx].Label, [so_lsx], [dien_giai]"/>
      <item value="110100: [ma_sp].Label, [ma_sp], [ten_vt%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="110100: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>

      <categories>
        <category index="1" columns="120, 25, 75, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="3" columns="120, 30, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>
  <commands>
	&XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
 
    
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>MVQ8c8sjj/ZpNKFXSlajFqsddTfXYcRWPIdB4Z5T/+Ti0FT5jtfwSaM3kdZ/LhKzkbTR9IQ5HHE/iLNLtRABY4E3zH91WYHmEJ75O+o/nONz+FJ+MZivAfHdF7tqEFFoXicmfacNUauxJc47vOkb6cuKGpmw4Sm0mqoToJMuzrDZQnYyNvYnKhPTGm1l7BwDdfkhFcYJV8JLMrrjTM51zRWj3uhPUGzj49iV3zxWdv1o0j3z2p6iB9f1XPv6z9yd</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>dwNI/+6g53tr3ju9PHkpdR6+Gfekm2WFHtVGqQzA/CEpa92CEINK+xODgdAxkFD70Xs/Yh2xR50BFHCII9gS/wcCqf8MOxnaDmsoMk4lyt/3mMAeN4fAdRbA4vXcMDf/toAT7awzOOWTzC5RXeITkZsueY0+Dpop+AeRArjYYC1+YUCPrpjLcL5mTqP3tPrCmTGbttzo/9xP1B9UFF/MQnOrscAbeGHAiq2lAmeI2kMJ5DniAJ3NNG03Ecki/Of0cmqZdXIv99NqNLgxlwGC10ybDHj7hq+y0g+TwoovOOt3SwMLEAr2QwQMVi3ceBOZC+xPF3NFkGofyMKTiexXD8Kxq5J+8R7R2PGvU283Oi6oLtbleyOaJsxDvBsIVUu+1U10GqP/vaOFf9k8yX43Dzsp/HDa5m2aEPQQTJgLC9APObBIIsnNxa+Eg9/SctnsVzWM4+vLRWtLaE4NA3FNtzZ2IZ0UrbVsLUCMxlAibrKaVgX0K8VNCwRulw4Ln1p9Uh9Kh/lvQDZuhCXdivGGnOEkbuFba0nPwgiO5N3/phQX5ws5e3+mTynSMOLudDyrh+Z5LLqOZaXNCAP/CJQbc6Ldf3WBLb9+qO3JRnMlcnSIgsYADy+TSkv2nf9YUgcMFupgfXMpWRsRsyMX4FCxvAAQ+uA9x9Z1Y0c/4bSzW5c=</encrypted>]]>
    </text>
  </script>
  
  &OutlineCss;
</dir>