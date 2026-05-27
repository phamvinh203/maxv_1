<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="dmpb1" code="stt_rec" order="stt_rec, tk, ma_vv, ma_bp, ma_hd" type="Detail" xmlns="urn:schemas-maxv-com:data-grid">
  <partition table="dmpb1" prime="dmpb1" inquiry="" field="" expression="''" increase="{0}" default=""/>
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" allowNulls="false" width="100" aliasName="a">
      <header v="Tài khoản nhận" e="Receiving Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" width="250" inactivate="true" aliasName="b">
      <header v="Tên tài khoản" e="Description"></header>
    </field>

    <field name="vv_yn" type="Boolean" width="100" >
      <header v="Chi tiết Dự án" e="Project Detail"></header>
    </field>
    <field name="bp_yn" type="Boolean" width="100" >
      <header v="Chi tiết Phòng ban" e="Department Detail"></header>
    </field>
    <field name="hd_yn" type="Boolean" width="100" >
      <header v="Chi tiết Hợp đồng" e="Contract Detail"></header>
    </field>
    <field name="tk_he_so" width="150" dataFormatString="@upperCaseFormat" aliasName="replace(replace(substring(a.tk_he_so, 0, charindex(';', a.tk_he_so)), ' ', ''), ',', ', ')">
      <header v="Ds tài khoản nợ" e="Debit Account"></header>
      <items style="Mask"></items>
    </field>
    <field name="tk_du" width="150" dataFormatString="@upperCaseFormat" aliasName="replace(replace(substring(a.tk_du, 0, charindex(';', a.tk_du)), ' ', ''), ',', ', ')">
      <header v="Ds tài khoản có" e="Credit Account"></header>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tk"/>
      <field name="ten_tk%l"/>
	  
	  <field name="vv_yn"/>
	  <field name="bp_yn"/>
	  <field name="hd_yn"/>
	 
	  <field name="tk_he_so"/>
      <field name="tk_du"/>

    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>8eTZozuBN2cGSIHGZ+boTkk4FZzWhRE1sJw7N6jjMR3DNTGWk7FlBktBORHyOeDhDsL3DbT397hJXL/2DxMfP+6OPcICaMad4Fv5VO6LcAkEV1i5cA+J4dPwU9NvRQkrQgc2Y0m5Sxd00Hb1mmLgcYXWRuwoiBAL7u/Ty2stJ6M=</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>
