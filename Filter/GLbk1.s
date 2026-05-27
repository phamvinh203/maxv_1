<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLBK1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
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
	
	 <field name="nh_theo" clientDefault="0" aliasName="nh_theo_glbk1">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
			<item value="">
				<text v="" e=""/>
			</item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
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
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete"  controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
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
      <header	v="Diễn giải chứa" e="Description like"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"/>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" categoryIndex="1" allowNulls="false">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList" >
		<item value="">
			<text v="" e=""/>
		</item>
      </items>
	<clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_vv" categoryIndex="3">
      <header v="Dự án" e="Job"/>
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
      <header v="Phí" e="Fee"/>
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
    <view id="Dir" height="246">
      <item value="120, 36, 75, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
	  <item value="1100--: [nh_theo].Label, [nh_theo]"/>
      <item value="11000-: [tk].Label, [tk]"/>
      <item value="111000: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000-: [tk_du].Label, [tk_du]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000-: [dien_giai_c].Label, [dien_giai_c]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [so_lsx].Label, [so_lsx], [dien_giai]"/>
      <item value="110100: [ma_sp].Label, [ma_sp], [ten_vt%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="110100: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>

      <categories>
        <category index="1" columns="120, 36, 75, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="3" columns="120, 36, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>
  <commands>
 		<command event="Showing">
			<text>
				<![CDATA[<encrypted>WAx1EIzggWomp7TPxhHO3mOGaOQSIZrSTTXD0yXg3Acvc2+v08uKQQvzJMI4/iLUnI+L3b9Dmhvj5Y9WyMgF34DUHj4f3qn7Lo7Smi/lsGfjwPSjHKLmeR1ETHdKrBJZnr6SVY/bJ6slmDfTssTkhN7W5nutSguNntzWgGftdwQ4YhfDZDlirJ3NKOr6ZUjCxo91vBTgUDOEYbd3207NH5f+nyEZHKA6VusSficroI3QdnskQHYcMIyPPXrmtj/jPwSiF5R2iXFbkLmi9bpkHw==</encrypted>]]>&Form;<![CDATA[<encrypted>in5QY6pT0wP70kToSE1ByzoFEWQ2/ThY/nJrimM44tXnAUyMNxlgLrHNA4MFl6lLsEPFP3g89UTZcmqtEZOIbGjx1tJSEmnu2w0g7rx2uX9wI/G7MibSUzhodS/Uw4kYqDs/FsFN2fzgyXORi1SCRH8FOTV5b7hDdovw9muJLzDwGWCY0mv20I0N9p53qmTBhHIKWQnVT7e1zwAbfk7onTTETxVgV3u5oKWMFc/yS+HRkcZiZ25AZUvvcr/qhP2a</encrypted>]]>&Form;<![CDATA[<encrypted>T7qyw9BdwS/13/WwaJD6f5t3O779mGWUpBDTzcGkThLxJu9EgKXkjgz05N+Ls51xtPZ/BHYuOo78boEwsls7AzLUik+OjKnDavTggoA0+VTHdcKF78dhJs7y/rdV6BaHrsM0AN8g3GgXiy4zDELsE4qshWbXFeQRVVI9agDWZbERkLNa4IVK+NAMBNj3OUroSLnCt2qanGGe8B9a12eif/xNtbSVOUEpL/L0LPtbhcZY9dcOu9B/hNLKMU4SeoN4R8K8EVDBA+bdOiCphpg5gGk3/PKX1jX/79skzsN4vDmzMtQq8wcVZnbz9umNsapf</encrypted>]]>
			</text>
		</command>
		
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>gm9GvdbdzX4Bic1mgnMTKoFuZnL4HoDoPeasTBWzpcsyc9kd+N/MtRJlwgb/iApX3u6O4pamri6lAdGJlHCjcUgfLDIA5s93pSmAVY6elqA8IyXYTQ16sIV3bVVM21vq03r0aN0+mBmboT1ITCm6iN/Kl/CYSDa6KqWBua8CJF8A2QzTTIhsgp171mDWEu5dg3tZRV19qUswRxb29xVd2hT+p1WWOLjRSBKtJ/sZ1RP4QB3+FJ/ACxbEAyGH+qI3bspKilr5IGtI+iLstMWaHT3bCy1E/vzwpXKHzzog68w=</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>CaUH7pzCpKkDFqBtT2CmS8HnvhhQhoQCcYQ3mEfz/mMKAUVHiIlW74UGyC+dohIcIxGbmKg7B5AhEOJfnB05wqlAyvv/MYcPpVY8EXdtMMysS0494BIjfS4SJFxrJb60S/eJA/2CQa0+4tNiZg5PnZEd+yRjMrKt5vGsZifSrp/jeIhrtwT+1WU3y6Knv7XHpZKzGrhr2lKjE9/LVJR5MX+Vjfhh7fRwU5s5RFXaXn9thMGt767/LtIk+a/GsnqvvN7TE3wDht+EMCy8cWW/QsmfATqOixYl/15n+C+aVVzB1anyNlUABVOqs62wBHGliis1bX56Kvkpv2QEQBdC6S8ou1p0qkwFPIvxVB7PQu/uq6WofkGHpqi6b1DrvJAMbW/aOe+T+ao4jnYlIYV8Ri2nO1ovRtJvzkcsnJOCxgLdlvckxF/K6oCqZTKAl7eQ4dZNc6jEhngMWOIG2VUWPcufMNGNl8/4vTw5PpMf6HXNht7Pj52iZXyKYZjtlmlMiAiaKOVvkjDmUJEsXxlAo8gUtvT9svCIdBwZhFcsAAv5ZscJyc0yywn0Wk+WNCg9RLy37PepyFPxkDjR7fmFAw71VCaLy7kpo6XWlGLlbl9nq91C3vgQLoE72tY3yirzADVPWxi431IcaRywKY5+F9odvqQPppNe4ruDG3Jj2FiKowsMcUF10v87uXShSClozlsr6SQw+WsQWm9AtAzhyUglunuo4aIH9AnFCSfesjSwKKxRU5VaCsAzMfkmMvDHHgETWfgnfW6Kyn2sHbkHnKXNQAMDSnvPylia1YKhyOrMuY37nXtUjb6avt4lZ6WNLG4usbZ1B1SbYaEFHB1BGHcaklG5+1U1luaq58m8IgIHh3nqAHxu1jaOg8wAWHOD6RK0jc6oXMUDoOtYBET9tXobjiPcHfX1XpDYas7ICla555mTpWDj3g4kK74BkSZi</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
