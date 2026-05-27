<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Tỷ giá ghi sổ" e="Book Exchange Rate"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0') and status = '1'" check="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0')" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="kieu_tinh" type="Decimal" clientDefault="0">
      <header v="Kiểu tính tỷ giá ghi sổ" e="Calculation Type"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Tính tỷ giá ghi sổ trung bình tháng" e="Calculate Booked Exchange Rate"/>
        </item>
        <item value="1">
          <text v="Áp tỷ giá ghi sổ trung bình tháng" e="Update Booked Exchange Rate"/>
        </item>
        <item value="2">
          <text v="Xóa tỷ giá ghi sổ trung bình tháng" e="Delete Booked Exchange Rate Transaction"/>
        </item>
      </items>
      <clientScript><![CDATA[<encrypted>SZcHaSsQlt/rcl5PGuE04S9B4gIHBdxJpcdvUacdYFUZhOOalef7iO6XDkkGdYanbr2LYzwmtcqRe7Rds20C1sgArySA0KCYTMuNmj1wZBmbzSq99NCUT0QolZbQhAZvtjmRcvWDyiK3P0S4+gjBbaV68uOponaPn6ah7ev7+HU=</encrypted>]]></clientScript>
    </field>
    <field name="altg_yn" type="Boolean" inactivate="true">
      <header v="Áp lại tỷ giá ghi sổ" e="Update Booked Ex. Rate Again"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="130, 28, 15, 60, 100, 100, 130"/>
      <item value="110: [ky].Label, [ky]"/>
      <item value="110: [nam].Label, [nam]"/>
      <item value="1100100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110000-: [kieu_tinh].Label, [kieu_tinh]"/>
      <item value="-1-1000: [altg_yn], [altg_yn].Label"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>HO7J5BMBjF3dibfvCd2xejfLuJLPN0OeYSNeLblVrUxHJvnJ50mUa4jzLWLo5UcUVG+QtK2cMWe43+UV9mqhRnrij+cOVQ1G6gR911w5VvwwE6YeMWpjad63L7u28equksALVw4TgGTFDJhn4s/Kb1CPuHiykE2ftWrkbDLvHTkPebhkmKs5r/xaQZuVsdvvcGL907XmU4JyNnXEbQr88g==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>rGcRWczpBkUav6cogkfC07vTe6F8E1tmNDJot+4MllsAzx42F87RIyaiKJEcTqF2nAOAmqo8Cwwhq2k64Qrlon+uYrUmUUSbggNcl3oDzp5LwEaxs45G6ZGQ+Nc6gYjF0T0hPCCwcwJwbceWWWtGebo+Yl/lR6tSHVx/Fa4F2xLe4UW2ZEGQfjym3W20tL7r4Ve7Oc9uyEuQYnApixSSlnCYCosoppv5YP+hJh2YvTA=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
