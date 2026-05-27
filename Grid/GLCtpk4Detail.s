<?xml version="1.0" encoding="utf-8"?>

<grid table="dmpb1n" code="stt_rec" order="stt_rec, tk, ma_vv, ma_bp, ma_hd" name="Memvar" type="Detail" xmlns="urn:schemas-maxv-com:data-grid">
  <partition table="dmpb1n" prime="dmpb1n" inquiry="" field="" expression="''" increase="{0}" default=""/>
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true" readOnly="true" aliasName="a" clientDefault="Default"> 
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" allowNulls="false" width="100" aliasName="a" clientDefault="Default">
      <header v="Tài khoản nhận" e="Receiving Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="b" clientDefault="Default">
      <header v="Tên tài khoản" e="Description"></header>
    </field>

    <field name="s6" type="Decimal" dataFormatString="### ### ### ### ##0.00" width="100" aliasName="a" align="right">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_he_so" width="150" dataFormatString="@upperCaseFormat" aliasName="replace(replace(substring(e.tk_he_so, 0, charindex(';', e.tk_he_so)), ' ', ''), ',', ', ')" readOnly="true" clientDefault="Default">
      <header v="Ds tài khoản nợ" e="Debit Account"></header>
      <items style="Mask"></items>
    </field>
    <field name="tk_du" width="150" dataFormatString="@upperCaseFormat" aliasName="replace(replace(substring(e.tk_du, 0, charindex(';', e.tk_du)), ' ', ''), ',', ', ')" readOnly="true" clientDefault="Default">
      <header v="Ds tài khoản có" e="Credit Account"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_vv" isPrimaryKey="true" width="100" aliasName="a" >
      <header v="Mã dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="c">
      <header v="Tên dự án" e="Job Name"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" aliasName="a" >
      <header v="Phòng ban" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="status = '1' and truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ma_hd" isPrimaryKey="true" width="100" aliasName="a" >
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1" information="ma_hd$dmhd.ten_hd%l" new="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="d">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>
    <field name="ma_dvcs" width="100" aliasName="a" hidden="true">
      <header v="Mã đvcs" e="Unit"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="s6"/>
      <field name="tk_he_so"/>
      <field name="tk_du"/>

      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
      <field name="ma_bp"/>
      <field name="ma_hd"/>
      <field name="ten_hd%l"/>
	  <field name="ma_dvcs"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ktSL1b1ziHJgs2riJnmCroGly4aZ/cKRBksfIWwSRzrOGRcbk2lY0ioaMZHnW2d5+IInHgDY4n2EZKZr0FpZ8OnVvJ+BEqefdklCEWLvxcp5</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW1hrC2ywU+Hs7CsRRGcGm/2oGQB6EnMnDjHjXIjPwGqN3cxniz1h9ONuRCJoJyPsyaXEDF93Pzivx/7/opXZnbbkXTJHeqK5MZOgvTmmItsD</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>YYD6qsnWsiecCgx34VE8yt5atFuJPzpojqNpdPOICY8IkYz7bWpcqo1pKMJHJmXjbm5KZrZwV3tLBH9d4TVODuaddqMbHCrxSDATyFyHtnQLrVZrUhJ+2Tsf/uincL+VlVcCLsD1Y+NRodCYYaNk3+cbuMH1ax8K8P4cXEQHx8aB9E3ufPb+/eJHASZRxarSqt6xuWcYtqkcAKUEKTF975+FFg2qUyEsAOHZsHEMn97+ZVAKU55ogKGH4VYO/I2XT3eAtELnAckdEjy4YQC1wG8B+r+6Mtzd1au4RPRM6fGtZZWusNgJeJub8aTzTLOzIiLkrI+zOblP+6ncgtKa/6LHqm1igB6r6ivdaI5xUp0OyK0DOhjRg52wQU3Weni6eSffDXsSClieGeFPVe4mBCBaIIPhhFFxlI/r5i9bMtAcLIBchZ/AJQTW2v6vFSa0IQ4q2jGqJrEVvjkbu3pEQ3/UMrZARsCTATcr4pu9ossCUdS+Nf8c2ZsiIpLGRchM70hUJXTJkhEitY4E5ybSJQmnIeMnUXHxWaZqlxLEKuNirvQdt/4dVmP4tVHfNGbvBlHkIDma4qeIW+/1ceKPyZj7JmNA2YXxqWY2r7+mdW7885qrpAK62K81LCOTzJXCsvv3QbUiFTi0RVymJ4FG1Q==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>