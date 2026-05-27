<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetCreditTaxRate.xml">
]>

<grid table="d76$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HB3" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c76$000000" prime="d76$" inquiry="i76$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a" allowNulls="false">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPO5Vu7zotkPNh5UDN2V7J3FvVhxkFLSxLNK45HvA2sFImSqzms1JcVt8xLVy+uouIk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="km_yn" type="Byte" width="40" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="KM" e="Promotion"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_kho" allowNulls="false" width="80" clientDefault="Default" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOsOqCtEJw8sjaJ5AuNCmVB8Q41yuCdKH1zOr5VMa0apGYKxfxKZc1r+KNu1g7NZfk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_ban_nt" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" hidden="true">
      <header v="Giá chuẩn nt" e="FC Standard Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá bán nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_dt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk trả lại" e="Sales Return Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

	<field name="ma_thue" width="80" allowNulls="false" aliasName="a">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMWANSp+4fESrNXmh3ZBDdfE6jWXZYbV6Fq2+jWE5kEBrfkyz8sxi2bweJpJM7gA2A=</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" readOnly="true" type="Decimal" inactivate ="true" dataFormatString="#0.00" width="80" aliasName="a">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>
	
    <field name="tk_thue" width="80" allowNulls="false" aliasName="a">
      <header v="Tk thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ma_thue] != ''" field="ma_thue"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMKX/jXyRzZdRui4xXGR0atDgtr7LdP2IayqEI8Ci5JjDyi+oIJ5TLIyprM6tYFdg0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
	
    <field name="pn_gia_tb" type="Boolean" width="80">
      <header v="Giá trung bình" e="Average Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100"  when="true">
      <header v="Giá vốn nt" e="FC Unit COGS"></header>
      <items style="Numeric"/>
      <handle key="[pn_gia_tb] != 1" field="pn_gia_tb"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" when="true">
      <header v="Tiền vốn nt" e="FC COGS Amount"></header>
      <items style="Numeric"/>
      <handle key="[pn_gia_tb] != 1" field="pn_gia_tb"/>
    </field>
    <field name="tk_vt" width="90" allowNulls="false" aliasName="a">
      <header v="Tk kho" e="Inventory Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_gv" width="90" allowNulls="false" aliasName="a">
      <header v="Tk giá vốn" e="COGS Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_gv%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_gv%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_cpbh" width="90" aliasName="a">
      <header v="Tk khuyến mại" e="Promotion Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpbh%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[km_yn] == 1" field="km_yn"/>
    </field>
    <field name="ten_tk_cpbh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gia_ban" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" hidden="true" allowContain="true">
      <header v="Giá chuẩn" e="Standard Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true"  when="true">
      <header v="Giá vốn" e="Unit COGS"></header>
      <items style="Numeric"/>
      <handle key="[pn_gia_tb] == 0" field="pn_gia_tb"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" when="true">
      <header v="Tiền vốn" e="COGS Amount"></header>
      <items style="Numeric"/>
      <handle key="[pn_gia_tb] == 0" field="pn_gia_tb"/>
    </field>

    <field name="hd_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Hóa đơn" e="Invoice Number"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="px_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Phiếu xuất" e="Pick Number"></header>
    </field>
    <field name="px_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[lo_yn = 1]" field="ma_vt"/>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_px" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0px" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" width="100" allowContain="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
	
    <field name="so_ct_hd" external="true" defaultValue="''" width="0" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="so_seri_hd" external="true" defaultValue="''" width="100" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct_hd" type="DateTime" dataFormatString="@datetimeFormat" external="true" width="0" hidden="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
	
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="km_yn"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>
      <field name="gia_ton"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
      <field name="so_luong"/>
      <field name="gia_ban_nt"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
	  
	  
	  <field name="ma_thue"/>
	  <field name="thue_suat"/>
	  <field name="ten_thue%l"/>
	  <field name="thue_nt"/>

      <field name="tk_dt"/>
      <field name="ten_tk_dt%l"/>
      <field name="tk_thue"/>
      <field name="ten_tk_thue%l"/>
	  
      <field name="pn_gia_tb"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="tk_gv"/>
      <field name="ten_tk_gv%l"/>
      <field name="tk_cpbh"/>
      <field name="ten_tk_cpbh%l"/>

      <field name="gia_ban"/>
      <field name="gia2"/>
      <field name="tien2"/>
	  <field name="thue"/>
      <field name="gia"/>
      <field name="tien"/>

      <field name="hd_so"/>
      <field name="hd_ln"/>
      <field name="px_so"/>
      <field name="px_ln"/>

      &XMLUserDefinedViews;

      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="stt_rec_px"/>
      <field name="stt_rec0px"/>
      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="line_nbr"/>
	  
	  <field name="so_ct_hd"/>
      <field name="so_seri_hd"/>
      <field name="ngay_ct_hd"/>
	  
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXoK2w/YUkJHUY0ZH43sfD4duGnx7Ohbkr4DBDNymWoBwQEGMn/qD8zRnO7G9BYAe/TvwiNYB+shLIE0UZhWfV7Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCpOZwlE4lOVaY8k9R24ocGHqr/Y9vn0dleP1J95VH2VAf79ctKpKvXbOok8q6nET2T8O3xDK38OIY9OHxrvW7pj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>ZTCoyPFhp2R7UQ4pGzurYJzzv3Pq7dAEDRnCa/j1XRESgdykphAB43U4jDmebC1ro6wA84fCnDzDAxj1SDmfXIeh0nVTijDbDeMQAxEhAgatSmhQ0Xq77/6vrHfjKp+wZ4rfdPKfQxse+F15wPnDVuLF43SWy5NpurZz1VYqB20soUOnmeTRV7U/b1f59+KIjJrT4ShPe3PNAPC0msjaDHCars+le/ImXDIHy2+0lQt9Yb8oo5X5NHh3QHnIaLAEUVkIZ5Ei+hRg4iRF1QzuWL3Uuwudoh3+j7TKufsZayG5XYMMfWYyK39/XL2vDfrV8ifKOhQZbeB/tVN+35VrI3oaLyur5Alnvbmuo0WOFMh4EsdPuoYfp14Upot4zIYMu4S7NDzJWMAwxlGPy6Q+V2ssopSL3alOyrD/bddoYf70XwTD1mxusnczZ6zr2KjSH5qaniWcIyM3lb5sStwdZ+32wIv10RHBZSEci9q6FUyl8jgR/y/mJbYS3FAo+xFrcnonNfK273WM0eoGZ57LeKXPwSExMg+IzTtOd7ESE6/gOHvO8cP1Vr4Jp/82p8d8EUGM5N+FyML0SELXo+N5TlA/NQ5D2r3eFxo3XFQPmYfc5KksN4TwOjiEgs8D0q2j+qLz0fcTSvVtC/UWY6gvvmYFrxzt9zl/jFh2571mARggXYZCPjTGLSt0H3DieXScE36tskKfcxYR8PhM4jOT2JFtYM+kbo2AFRdoYdslGKrFVahsAfFz6tJl7fMMaROjorB42wt4UoqRAJRAi2SCEkxdUU7OSfmplVHns8PYyAmGqGVm0bUlQ7Fl4LVeN/n6gybOD9YKfSiA2e22ihutdCqRG7XBsIeu1WmXUxcljC0r1aGn7Irarfnus3dvChGkLVKP15l6tCgtOcyvt9xQhV496ScVMdjGhow8JGoS4pvn0LuyMr4Tl0lelCEjY1m4sxU1sXwg5ylldz+q9m0QKIEpOpQsX5kBuLpzGSCGTJD6fOcnJ5LHJRvGPah81quBWhNwuyPSmTMOgOTYhRAMS7YnnsG8bZrYY2cMIxmfA0KhcQbAQvb4ZHyLRFR73ybBQQFhRlm+Z98pfhHb09jiuEKAc1F0U+pIWsRVrYCC/2PsOBDv3WFjAMi50qLPkmTcvBja7ZoamftJxYT/cwl3uyKrMkvvzMhXlWgfg6R1oEtRCKZRq1GdmrJe7xSk11hxGUDRDRmLdUjIQfNpmJVmlnzjX722orxpWU8IaiATO5YPWtyiKl/HrCf/FUFUzH4cHvaxEFUbtzYkgZ1OXcGHxjtOAu71TWpIgRyvnlWiupTT0GA+D4b2J9H400X4qEM//CfQGh43T1sj+NaDo7zP/vUWIjFd6d1rqJNh4s7SRnvthcxsBLNMJjJIxz3geiUwmw8lmDLLRM1ywgFqm4/WfMw7z5oFp5LGbHUkCj9bDGPPw5bubGfiH75bL8buPEjjp1BTH+yPm7cV0rGYw6AnoSPxtATUsIuvFtZQlMWUG4JohjQDN3fWHUUjqiBfCCtyJKFi9l8TbSORqXQMIjvVt7Vz0YkwW1lnp8FXBgqiuLzosTq4wD/d7Ne/uYrq7jW/rmmN+RQ5BQMOns9ZcDG2NGuxq9PqxK82F62AncvMYZnHsIlf0VaojWdpe5jDvuub/LinQJcaNa25uPTR0MPe/69Tg4lbjEKzGyK+I6o4GTQ=</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>UM6Ry+R1msneQ3LD6LTJTWV8jAUGQAaz/UkEQzdpOYrYjC+6VXsA2/nkEq04rl5fIcgCxT9/HNdKsRAzNRH9eEuzRZCZ4G4roOjRdndeULMg84zckgOMqV64Q6zVzCpCM4UI93/8j4cw9Inv1jr95jmAJj7A2oqq+ZQUhr8hdoIA5C5TeG9LAcd7NB69bFqKgVewJ3/d88i3DPZcF0t40LEPLdvTz8etAs5wi8EjmA9oLxewaDsE8mLtGVfqcNvRu7lwHYcxDCIk//QzhzoGOTXmJXyjFk9Kshqh+pPmr9g1szFayXFltPjbqEYpYk66twMjceM2FnBShxTuTfJv4woa4N1hPkArQyXZlmaZdSq9mE1HtLr/Rpws1BLKan037Dt9yJ7WxSYYzxCFogB5T/ZczLSxWPTrYJPOoN9A6bRdg0sjLxTitpkUxxHgQgYssLqL+hGp72eRQPAyQt0zxa4rPLS0QCZQE0fqoRXNvSN1OWjbKOy5REhcHENnhAWaUcfBusziUoBVD/LElg1C9uXSklhyMvC+R85eRfMQguR1MxWUzYJQygC72yRkDy5BduQp5uhgjRv19/I1ynJuz1E3IF/0EAnbh4KR4MZWC2etUV9bqNar0cYS24b1tqgZVa+/jZscGIEwfVrsLknY70o8ahijSNteDFA7HJSSbo5hyGUSOj3ZQuORi+VNk/f+PPDLCTLxeafucmodL/dqpesd04ddZ6WeUFRNj5cHBAcEX4Vqu7rlT1miiYah4Rwawag+MYg1UPYpXe19clVKTDRmdfpO5ewGtKKDZUDiXRacPj3Om1MavUiMq4R7Ud6wdFjDODK25SrJL5darnGBghGqS/DpN8cd6mMT3YbMYicLfnTI3QoDVVIU6U/prFhLD3B68iUzZta36E699WPhxiuAdBEDKg6VbBFaNGTBXzETbjNZOa8EN4M1xoX0VfXfmFqyT2X0sgrEzxxEwxbhUozSmqtSvHhj7NTpmjJYfs4AUMA3aRqhcn6LF/TqBT6YrdKnNHH1N4iYFakOzwBfbSjgkFP/aKfckxITULOvuyku9ymIK2t0/cj0KpNAaHvz4l5i9/Ku4QE2JWSKNtjCWW7mX6XttOUMPGTEtR5fnY9iZyLlIXFKM+d/kNJz+dA7jFqbQdRAqZZ+8ibBJUl+nORgJE3jtmfw0VXwELY6UBldYDZs/x26y6u7Qsk5RQZvmB6MRVzGdpphhFJIpg2dUDAUVBirmWaW3HMywQbep+KjxG1zDta+8OUyFB+h/eTqLx5lzCE7DvE1f5Ih4MON2GHGEVJfAXtbm9f4z0p1T6zBvd7BgbZ1+PhidQRYHldkK+TtomIf3NX/7HNTz9jxCA1xXUsSNiSrFR5AhVRDL7FmMYEwDWluIpf3qj9iDkJzrILx9nwcEHBXd8o1xLf0aVQs8V+m+dZJ64AdMpSPq8E=</encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;
   &XMLGetTaxRate;
    <action id="Item">
      <text>
        <![CDATA[<encrypted>2zsKPLABmQd07xwRXo237aG4Z5JDId9DUZRdqGMvJZVGnxDujR/rq0B0/VBQfjriQ0Nm/MQEXu5k2NSHrSBMm484reDcbAP533yBrZW66XsGCxY8845jb3vR8p/CMd/VVMUntQsqB0jNENqv4b9hqqYQmJDn0WX0gOiNLIksr+EcadPzY4oMtYv53F/iXTET7hkKzRnYljCzgD3/fPSmcNZqPqAnnMTHqvUMFa6UG/LyQ1+VvHHlDBZ+kINSX+b1PlAIyCYdsecBNUU3wlJoucuPR2sm9dK/FNo8vtg83hM=</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>6FbaAHJb2W6fbXgwV4nWwpVd6UIzF4zlGopfB8bqjnGKMJnqqaw5DUk2jELnmEJssAYF4/2jsbkb1jDT3n4+KSKy6ELda1BgdJbNzd9oiYJHUsKXCX+PSIL+i+u+uE060jO8uUmA0x3ll2CIMcZvR2mmeWM+Rq25Bqw3KL9Bg+HF/LEYz53we+I/9LzAN4abeS0YDvHKChUFefNGcpN8mxr2TzbvgSVvbQ1GLDNpgZLaBfP3Kxm91kYSxS4IVZzXPrNKqv68l39p+6hX0sRNxw==</encrypted>]]>
      </text>
    </action>

    <action id="Promotion">
      <text>
        <![CDATA[<encrypted>z6jhJU9j8Lul7tNiRIKnmCloyOYd1v0ZTGCqb5ZJavXSGx2xuCgc4v8g7iedXNuglQT8IA8HEknPOT/yF3H2+KCSjq3kvWOdnW8vDpI38TzFyOmA5ctijyEG+VgabSeELyqwjc0vMnj4EmWtn9L/mmy2X6M+7Jx8+tpcg2FnhAI=</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>PIMwMHcDQTnS1pN0VxlCw1DMTFI30cte4yHGuipTUfzN6EH5hjcv5GMi6hUk0KtvRAZUnOzyMoUSJeOn2NvsN65MJpqez8OgZHvMtXDMsEBAl+81XHxMflCcdzGa/IEHzxF3dLxByfGScUDRhR9jWgdoXVqNngutcewuqmcN388szv9mhW8VBOwg6cy7d5L7</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>   
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10" urlImage="../images/Menu/Invoice.png">
          <header v="Lấy số liệu từ hóa đơn"  e="Extract Data from Sales Invoice"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>

      </menuItems>
    </button>

    <button command="Separate">
      <title v="-" e="-"></title>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
