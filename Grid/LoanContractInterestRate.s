<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
	<!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>
<grid table="ctdmku" code="ma_ku" order="ma_ku, line_nbr" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  
  <fields>
    <field name="ls" type="Decimal" allowNulls="false" dataFormatString="##0.00" width="120" clientDefault="0">
      <header v="Lãi suất (%)" e="Interest Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left" width="120">
      <header v="Hiệu lực từ" e="Effective Date"></header>
    </field>
    <field name="ghi_chu" width="260">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="line_nbr" type="Int32" isPrimaryKey="true" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ls"/>
      <field name="ngay_hl"/>
      <field name="ghi_chu"/>
      <field name="line_nbr"/>
    </view>
  </views>
&XMLStandardDetailToolbar;

</grid>
