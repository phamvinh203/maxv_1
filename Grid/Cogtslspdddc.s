<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenAdjustBeforeInit SYSTEM "..\Include\Command\WhenAdjustBeforeInit.txt">
]>

<grid table="vxcdloaiytdd0x" code="ky, nam, loai_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, loai_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Điều chỉnh số lượng sản phẩm dở dang đầu kỳ" e="Opening WIP Quantity Adjustment"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, Year %s2"></subTitle>

  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" width="0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" hidden="true" width="0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="loai_yt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại yếu tố" e="Factor Type"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="sl_dd_dk0" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="SL dở dang" e="WIP Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_ht" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="TL hoàn thành" e="Finish Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_dd_dk" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="SL quy đổi" e="Exchange"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="loai_yt"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="sl_dd_dk0"/>
      <field name="tl_ht"/>
      <field name="sl_dd_dk"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>zvnW+gosrJycbgBF8YOKlmrlGNp5Z9RlblfAHW/xYJsowDLJQt2LydGK8hlmeLJ6CqxCer4HmQIeK6Q4oQ25Vmh4xApCDIA2UutXLsiZoS7VoL0wAtelK1G6EplNsqdq6M/05Ps27UVdugj3cawKV9vqL30qdt7NjsMsI7NikLNBXYA5oTLz8REkSahfdIyY9Vcbt/XeoIj1ifVfqUmkIpY8r+8t7B/xI8Pq9dOAWUfoxhkgMGthI5jW2T0KePpN9xFD1iUMdc9AQ/+CiNKuHQLz7O6kbqWchrYevcLVyJg=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kkpNJziKB2OtvVlSSbmeumR4Ri53j2MJO847XKW7npH4a0QPBrNrTHZDqPRDvKVh2ypD9bFryB2cvHg1hhYsyq4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>5Tdyzpq0WbxY95jou9uKLp/SI2N6rAdBzmops+Rcre3SUujhOmQEvTzmjhbRioRj81E45NTJ+TL7MjANcNf/v80oeTQs4KDV/D+ijtNMYssBfO0QukoE0CyDOyrEQXmX9j4dWEG8SAp0lKUMrBLV0SS6SxzLpbrkR09LcYcfFsBjbsCEU7N4N05pHeogINTyHB4mmk1zC/Xg2ZMCg7A9Re2PiO1DeI9CAPqdhN0I5DPISgQTarqIvre8zJ6GvFMV9j172E2xzm3ujFHQ/6ZYRAdk+BSQCqCKelUmjjrLY4YTs7/UvxoNm1+W5kCrPns5xlrhGVsO8eYVDWWuLKielBBK+YsYTjtul+b2o99McvsExPYxrEssXD/MSa3kR3XY7gWHF97wxb+URh2M+pCxAAVRMYfkj8OPukg4EulmJIKbLkd8ogwAlzIp561axoC0ok7LPjlVv3f5c8uFdbKc5Vf0nmwY36oum2KywrZ2NAr7n9n+62uyz/BFiCfL7HDYWPGwVRnKed0ihJPX8tptrweIPeUCJKX1fzaI3auv2ZXSK1DlENZPHO8jCOPhN95RYdKXP+yspxSR47i3pAWSuw==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="CheckLockedDate">
      <text>
        &CommandWhenAdjustBeforeInit;
      </text>
    </action>
  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
	<button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
