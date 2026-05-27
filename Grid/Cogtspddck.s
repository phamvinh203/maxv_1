<?xml version="1.0" encoding="utf-8"?>

<grid table="vxcdloaiytddx" code="ky, nam, loai_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, loai_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Cập nhật số lượng sản phẩm dở dang cuối kỳ" e="Closing WIP Quantity"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, Year %s2"></subTitle>

  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="loai_yt" isPrimaryKey="true" width="100">
      <header v="Loại yếu tố" e="Factor Type"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="sl_dd_ck0" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum">
      <header v="Sl dở dang" e="WIP Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_ht" type="Decimal" dataFormatString="#00.00" width="100">
      <header v="Tl hoàn thành" e="Finish Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_dd_ck" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum">
      <header v="Sl quy đổi" e="Exchange"></header>
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

      <field name="sl_dd_ck0"/>
      <field name="tl_ht"/>
      <field name="sl_dd_ck"/>
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
      <![CDATA[<encrypted>64QjOTGAyztopPpKHpBzk5F0Gd/17X4OKkrxW4N/JsR2vO9K1n16EZpRVfkqWrfiMLbABktDCSDJw6BcWaBnCONU/lUPFwsBc7Yn4F/+uz17BNP+C58OhT/+DlmRcR+JnbaDqwMYUTWEHAYrL/9TCZyLKfzRuMqgcGJyhpo7w/def9UtT7XPpv4tf05GhCKIy4NrS1P7gkBJNaQRiN8dEJlTEKK5gq1jYpu11Q5ZfnMU7rgttQoyY5tbQTW4zCUlNsdiTRW/7aTDpIAe+BhUtA==</encrypted>]]>
    </text>
  </script>

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
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
