<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmtknh" code="tk" order="tk" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Tài khoản ngân hàng" e="Bank Account"></title>
  <fields>
    <field name="tk" isPrimaryKey="true" allowNulls="false">
      <header v="Tài khoản hạch toán" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field  name="ten_tk%l" readOnly="true" defaultValue="''" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tknh" allowNulls="false">
      <header v="Số tài khoản ngân hàng" e="Bank Account"></header>
    </field>
	<field name="ma_nh" >
      <header v="Mẫu uỷ nhiệm chi" e="Form"></header>
	  <items style="AutoComplete" controller="Dmmauunc" reference="ten_mau%l" key="status = '1'" information="ma_nh$dmmauunc.ten_mau%l" new="Default"/>
    </field>
	<field  name="ten_mau%l" readOnly="true" defaultValue="''" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên ngân hàng" e="Bank Name"></header>
    </field>
    <field name="ten_nh2">
      <header v="Tên khác" e="Other Name"/>
    </field>
    <field name="tinh_thanh">
      <header v="Tỉnh thành" e="City/Province"/>
    </field>
    <field name="phone">
      <header v="Điện thoại" e="Phone Number"/>
    </field>
    <field name="fax">
      <header v="Số gửi bản sao &lt;span class=&quot;LabelDescription&quot;&gt;(Fax)&lt;/span&gt;" e="Fax Number"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="275">
      <item value="135, 30, 80, 330"/>
      <item value="1101: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1100: [tknh].Label, [tknh]"/>
	  <item value="1101: [ma_nh].Label, [ma_nh], [ten_mau%l]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1100: [tinh_thanh].Label, [tinh_thanh]"/>
      <item value="110-: [phone].Label, [phone]"/>
      <item value="110-: [fax].Label, [fax]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhqAuQzajCvrH+eKQBwP2ATDUUla8y6EdKCbJrQQP+USzcV/WOZviRTsLPtgqSK5tOJHQEeq0zf7tXNZwuyuq/hO</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ctKYLcHhF5riSdXEb6XrEp30KdzW8ZYSrkliO+sdZuqYNI9Jv+cMan0rI3IsPiuQinSDqCGcjBDBwFsweWTyh1WKf7YMXMZPyncaBwi4qkl</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>4ppyrqx1jB6EHOB3IixcxOjjsO/U5KWB8vDLfS2uvHWHMEzz025uyZndNGNzzkOw161G/IIKLF07a/3PwtAWiY7ZK8fo65B/Gudjw+qCx+f22koGVTfHbR1HRI+HW02xzT2gr7mZVaaGHRwuk/reHvhNYkE9Xa/a4m8A648S3WmLXmZLcLt7tDLjIWJiDJZSTl5ryyBOvVo7cngAN9QJEX9V8hp81WL8O//7pAS4BhlH/m9GvGNEdxkJNoiPLzA7KnMRGNMyhIB7tilJ/BKbtxlvzpo9mYWrph78oJz48vuKL0r6M2ScBtat2womhfncvy8aBqnGVeutzHrItvEeaM/eA+qookgRi9O/8wKniecwm4MHen98iJsgXcMaRyRq6IqqZtUdhg1VWkulrV3JB6pz9RJea5FVRhDAuy6y5P4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>AgT0PUZ4WEyYeTDVAV8E1sxTKNv4GWRHvkylNMsczt0WETTng7MkDUcmTyCbAXtmAcbD89gXNkqw7gbxoT8i1luv3QklvJEXMncY/dqdWo1KqlkJUQ3BPWvxQgxx9dDNV5Y8LyvtoPDNoe/0wrujuahHPSpMcm92hjKxbr1yqUz3mVFjZ6jqXceJu2Yp/rASTr9ugwbKdips5s64M1ECUpIujDQRQfRU8BBfCYbGtioGtjjN4ifolzKsiTNsbrNd</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>75GZe9z2LryhMGYRO4MrILetMvfb6Ohwt8Jr5kA6+6lqv9T3tjNMoL83MFn2nGHybowrhguLgheoqWBSP7ra7K4jgP8bMykk6GMEaMb1V+M0oHxT0wkvhbrX51QtGypGuk8YiXGsNyMyy1pyWYGKXMtpgmfOXU5rRu722bMV9Fr6bpqt5RXiwWFL9vBJczyeO4SIsZ/A23hsR+qMFpD1FJ1ywJ+4E4B3modlKy4R0nWpT58E8cfNi+TIHnheRsnjx18NS/1b9thCDXb24xDqoyMA71G3D3nJFQ531tHuXU0=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILcGX0NfpE14+NS4oos44BKncMsFMCbiEdiY/pnqWjtFC</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>B/6sInCDqVl+ZjtTqAAgENOOlW1ldPo0J6bn0NQdbOmNhK9V6OfmnAqchupgEf+bOWPjKCkDXrxTKA6KGvlbfcHXN4msZunFS1/m5bqy1wllQ+pq/CR62I9u1Ds+rcVYvqWy/uSczFMnps4pq/zlzBPLKJ6bTMNZks87l9c/QYnwf9ugSQvU7739XVsEEkHiGygwjC+I72srtUNHrqVnXW98J5UT6zC5tOtb1+1EWHLwXcAZ1YWOg11tAQOW30Kk3IAze0EczFo29XH9XiaJt8D3mFRwPs+txVm/yAfRa7SA9o3hX7zrvKVycLFLKuBxemqwUZVHa+uZIz28vH36/JfUHHmDHTaaRPsfN7tOWj4=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>4MvSlYt1KryJh9p3EYdigbeHNkax6TbSyjQk9J18A7fECQfkHV/rPsFFoueI93vbpEJGePAnOxAv2A+peccU/g==</encrypted>]]>
    </text>
  </css>
</dir>
