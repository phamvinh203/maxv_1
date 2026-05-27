<?xml version="1.0" encoding="utf-8"?>

<grid table="dmkcgv1n" code="stt_rec" order="stt_rec, tk, ma_vv, ma_bp, ma_hd" name="Memvar" type="Detail" xmlns="urn:schemas-maxv-com:data-grid">
  <partition table="dmkcgv1n" prime="dmkcgv1n" inquiry="" field="" expression="''" increase="{0}" default=""/>
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
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="s5" type="Decimal" dataFormatString="### ### ### ### ##0" width="100" aliasName="a" align="right">
      <header v="Tiền chi phí" e="Expense Amount"></header>
      <items style="Numeric"/>
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
	  <field name="s5"/>
      

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
        <![CDATA[<encrypted>m9hg7o5qO11/XDaLriVWwHV2KVhGAK613lW25kHcUMhAalxJueA/QfUU+wKuTqnO50sbaEugr/ZEV9yNt1Q7M5uOCMMTLOkxq0kbetJnkcVC4zObutfjyInWyoGK77vPl0IHxnpp+jKaND2qdnx4sjz+7lQB6DsJIfhhyR2CXFZbTA7G0MeIecHXMTBXx7zuhfVX9F0ioXcBqXbZG6A4TWOZIHOFIkt8wUFXrWqMPy3++w5SFLyX0C4r7QUfOh8E1+InWuIuUKh/swKOh8mpoLjyvE1TnDSrQwpostk2M4pEi0HuKqzN5AJJo+ZWEWJmRjdmHfrvB5BPpDBB7haYFUweT1nbOMCCipNQ+moXg4HaDs7cNYQ1Ms9BimQshEoLVno98PjjmHRQI8iYdb667C5GuvcWLWHzxRRDLjcYA35Zz9Fl0dU6tba7c63FEuhqMyo6U3y/c7S297jO4uCwImc1KhfS6aIJL7/kkrnJEnxos8Naf3zEWdNJ4XKeUq3Z0PMAmFfurt61X8LBaKLITcIUY5M0S5Y3upqFiIHDwhfS7gsCEQW6XehzTDLCaLDezQ5H/CVREgfGram9vmmARhjq8oYpDDX2aaeoYevbQmFeY3n1rXhR5EW7VhJ7yfce</encrypted>]]>
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