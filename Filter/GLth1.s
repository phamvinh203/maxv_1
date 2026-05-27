<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLTH1">
  
  <!ENTITY SelectPrint "case
when @ghi_no_co = '*' then 'GLth1_110'
when @ghi_no_co &lt;&gt; '*' then 'GLth1_111' end">
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
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="nh_theo" clientDefault="2">
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
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4zRdf3yyw7bSBz8/D7RT8dsgb4P3hn+hj/BcNe/pD7uA</encrypted>]]></clientScript>
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Danh sách tk đối ứng" e="Ref. Account List"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_kgt" categoryIndex="1">
      <header v="Ds tk không tính gt" e="Non-deduction Acc. List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Mã khách" e="Customer"/>
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
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList" >
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
    </field>

    <field name="ma_vv" categoryIndex="2">
      <header v="Dự án" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="2">
      <header v="Phòng ban" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="so_lsx" categoryIndex="2">
      <header v="Lệnh sản xuất" e="Manufacturing Order"/>
      <items style="AutoComplete" controller="MO" reference="dien_giai" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="dien_giai" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_sp" categoryIndex="2">
      <header v="Sản phẩm" e="Product"/>
      <items style="AutoComplete" controller="Product" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="2">
      <header v="Hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_phi" categoryIndex="2">
      <header v="Phí" e="Expense"/>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_phi%l" readOnly="true" categoryIndex ="2">
      <header v="" e=""/>
    </field>
    <field name="ma_ku" categoryIndex="2">
      <header v="Khế ước" e="Loan Contract"/>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ku%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="266">
      <item value="120, 36, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11000: [nh_theo].Label, [nh_theo]"/>
      <item value="11000-: [tk].Label, [tk]"/>
      <item value="111000: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000-: [tk_du].Label, [tk_du]"/>
      <item value="11000-: [tk_kgt].Label, [tk_kgt]"/>
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
        <category index="2" columns="120, 36, 70, 100, 100, 130">
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
        <![CDATA[<encrypted>NL3ff/XJ0KzNG5O2GVMg7IjgoLif9DiTBeALy940MMbDHilK7sjaTOnPsHgpsY9FrZkWBRz+j8O25f80gDfKxe6m4T8KkGYpi6LXpLi6iHOPg2P9Ed7Idsp2CyBKUY0osB/Q6xTfF+bmR/+jlICdgNkj1N6XwzxEjU0Xp10gpDvw5+5ZBGU7OjAVzVAyFhPFj7XGtsvP4vluLs1mfgBTwk+OFk0YX5uZULi3WqybeCFa8CcRvnU+CavK71Hm8wn1ThNC48gs+iiWVVllma1JU6HLwmvAH/JNUMpIZOHD7ksp+Ht8Q31h036KQfsL/5qCbpS3rFHDb2zMMmf1jsc+tsHxsjRtUJLPxINw+NOY5QfaOVcQ7cEtdUmMcPig1mAf0xwlE1Fzm6Avm682K7MrHxA3fx5PgPLg+KvFdHYhMRwn7sIamzGl0nJ/OkiQDAOG</encrypted>]]>&SelectPrint;<![CDATA[<encrypted>H6MvT36SJNm3Rg7DWSBxlIMeXdphXPrCOj45elKsTQk29nv2c0WG1HW97k8LcJsQ</encrypted>]]>&SelectPrint;<![CDATA[<encrypted>yWkGeakZTwI7AXujPtxFzchRNjn22QHy1I4KImvSbsw0Ef5W9UyyIhyW4xvHtIxi</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>rk3lCVbosw5nuocRc5Y4GevlNpejeSl+xynwju1w79i364HckmkXS19jWg1qVPDzQ3etsIep5bVk6C3IHgrEGHtCn7yMNJEbON0sR/dd3LG6t7ilbB7sQ7mA21jIqXTYud3M6zbm0jNUQ+winbrLUvkL4NeGScmR7mjBKG13sMvX09bJhHnr9lwytRVzRaR5di+Xbyagzp2JG4j3cHGzIxrisUXHnnaujfsYt4HNubOy/8agcmqrGbakjGNCTE7ZZVIV5zMHDtOYxyF5cXL/v0INbpNn1/ZMCAhWBvLD9BcmUbK3Nj8r46koQPcyLBUctYzddkTKS3uLWH/eTxa+PPbim3o7Ei3D8QSqrETseHoo4sCGIb8QlNUwRkmbUodnp/F1bKoLP5oubK7d9BVPip0X7Y5Tuj7oCu4s3IbZO5aXvvY6Hl4aKDHbqhvFTM1pmZ1zwyUUIGWQ5/QQMqZfsGwjyIGbsZa/b7g3C0kh2pkO4XQoRqMmUm+zFUkrCt60k1uhST58igf+bqGxI39b8OJOtAcTogRFILvEEz7RPr6f5HdmmKarFYtIcB1iLAir61wf2T+COiz/469n3F083belp1/le7bMYmSxrp4dRCFCpF4ugfi0AaJ6po8vRxDtWR7KJGm0dn/dPpVIIACcoOwob5cA68uj0uQMCM9yWwtiEo92xoMI4r+w3NzCMqI9alV9V7nnHWPV3FkW1VxHCU4QbMuccNGRnQlXRYdnZfba0zBeCqWGMf1bcw2HDdIHg4G941EyJXlZmr/pHfcsKD6Ei830knB0oXnGhs5QlmgIHCjUORUmr/RNnsZma8NIWvM3XjTdiOdX5yAxb23HTsk4ORpx4D6LapKg8OOSQRfsAgjdnHlQ1SC0N51Br8tgyY2GECgiWDfs4wAdIPE4SedtX0bH/sSqRndGsFalInrhQ1s63hFZH2utS6jHjomJAGLXa34mZTIgE9ZGWkxdntqOVxEazmca1mYuAadic4rt+JejQzUr8a+nPr4IbGijMn+t49KfsSdZHttHPRHM84ZrH3tlb8c9lP6DMIpMgpOnSgze65jC1ks2Xac6urDDhoNy9X0I833FkQExTxWHpLfbj2xrNFWeYdaFKyEYDLlgzMePkXHwh4mHj1K4jz4StsfCR70e/u/mAPwvl1OIcH8bT7U4bDywjDUGcy1NsHu5mMuBMzUNwHxRAF6U8jrb2DGszigrVw/8zjfcNrFLQPDolR3CuBw6CBeKuW1d59C13/wgrqib5r2TCjb1iAqjgIIcVdhYplvn5D3AwcZs/9Ursslr5ez3v0Ss35PXTm1x0hWr24Kk1Ue29ZO1iEmRQJsAGnmGIxkRrN/XpGTkHWbs7poi5ThHPr1NRlDRTg/upeUyIVrkqeWKiqYob/tF</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
