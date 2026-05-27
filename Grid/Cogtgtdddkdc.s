<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenAdjustBeforeInit SYSTEM "..\Include\Command\WhenAdjustBeforeInit.txt">
]>

<grid table="vxcdytdd0x" code="ky, nam, ma_sp, ma_bp, so_lsx, ma_yt" order="ky, nam, ma_sp, ma_bp, so_lsx, ma_yt" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Điều chỉnh giá trị dở dang đầu kỳ theo yếu tố chi phí" e="Opening WIP Balance Adjustment by Cost Factor"></title>
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
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ytcp" e="Cost Factor"></header>
    </field>
    <field name="dd_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_yt"/>
      <field name="dd_dk_nt"/>
      <field name="dd_dk"/>
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
      <![CDATA[<encrypted>gcJ+6zEMjWuzEObnymya/ruJVKwfe71j1ziA117m87id/FCUN/uVjupnQoqqX0eVP+4jb72KRU7iA1KFOz2wbV58c+TSBsGEXrTWVplBa44tQZRCYlVD/Or+cDqAXtaWYG20npoorEfRvOKh3yUaG71oOFX08n48QJBAvnNwpsJCWBPbYyH91/mvImtX+TQDnFgFyFzcepkviChsDdABdkrDl+5IB4Zd2xMPEJraa1Zjvs97nlNSS/rVl4FYuEuYIFeCkoKiz9yrkn2Ju/otqCHa3D7SHZDhXF7zGYNwcBczIFWomE3l/I4Eni4cy45jnRE8MxmkG+UgF1MNOaKwpHpSKrIu8usf8GPstvp1qheVduIBd6znOMp+5Z431xNt/phblsWYnQc1Kj4tiVfZWikdij2aVDtphzkjR054kEYZ2rvUksUo7DEbShLirHdRctaEbzm0oipZ34o9V/gdNl7B+HhqS2H0hHE8UMReKEbrjc766IbGXNhoAF0YrNWoV6OZhHP6rePyGNpIIZP1Xx7E0hKbwIZxeMPoVoKK6AYcs2bKJpi9pFJ6YUYF9hSkF4XnBiFzsGSMIBwerZ+Dow==</encrypted>]]>
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
