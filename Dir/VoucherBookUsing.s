<?xml version="1.0" encoding="utf-8"?>
<dir table="v20dmctnk" code="ma_ct, ma_nk" order="ma_ct,ma_nk" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Phân quyền NSD quyển chứng từ" e="Voucher Book Using Definition"></title>
	<fields>
    <field name="ma_ct" isPrimaryKey="true" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>

    <field name="ma_nk" isPrimaryKey="true" allowNulls="false">
      <header v="Mã quyển" e="Book"></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1'" check="1 = 1" information="ma_nk$v20dmnk.ten_nk%l"/>
    </field>
    <field name="ten_nk%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>
    <field name="lstuser2">
      <header v="Người sử dụng" e="User(s)"></header>
      <items style="Lookup" controller="User" reference="comment%l" information="name$useinfor.comment%l"/>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_ct].Label, [ma_ct],[ten_ct%l]"/>
      <item value="111: [ma_nk].Label, [ma_nk],[ten_nk%l]"/>
      <item value="110: [lstuser2].Label, [lstuser2]"/>
      
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>u6MQP3yh/B7Yx4L6PyFgyn2uQtS70SaXImMVZ3AoSIM1e2sRqHWFGWyUBlUNnlEuoGVHzG7AR7aTEJgvJtx8cLaiR/FEcF0rVXMuS/Dw0Rln9xOa7oB1oFjdiualCsOHIxZ6hxX/0k+MDvPYQAWQBkam3bCQsB8WPU8rHPDZyMEgZhmqrvr5W49ZRl8LB5q9QbFoTopjG2AiLfTCVopL+MJ23/NPYiF21sqJHNqRSdBfnuwCY+Se9YQMYmKsATqbQAxyOuF5kcnf4sXSm06aUsCA9bkshM6ilXlTCqg5QGMQiSq6saxdnEa9i1+k5PcC3GD/KaAYCxRUX7+FCNamqms5PrX8vc0oRUNms/C+hxgkX46thsWs7kGbzapAIJLmzc1wyoBANtfmmF8FFPQNVVlSMiBkcDsOVxpYsYicEf57a7ehKWs8bcfeSm1dSo71qPgjqHmKsX2k/7yEpxu+ejdNlHPa/8HUibfmnCLNGohg4IxnraTGdNQqufkXtcAh</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>YX5SlkMFrO/zR7X7SQae1c1uG3iz0Lf2mk4bmmZWPdua9odIdpYRzXcBkhyl+vqw2rYQnJQ07RzfMvZwYRnV74bQHR6qUQeO9UnELR27WvYoLy4E6Uo4I7lOJxe0ta1ewIoTd6xP1234icsnoR9fSdjgvm/iJ3LZzfb3fzG4cEQgh7EKgDz3G+PsFzAv0Ky3N1UyzXWgHrmkdUkJfHcmByKA7uPr6vwMTFOtHTAKur+eRd67K0bR+JBEmXM9PvSo8fdPBt2NjYg4i8tA5oO8/WWwtDPDoWKwBLituy8clVs69eb1cUMVjPJ40ZzFO3fZ</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>koxXceVCmdIYIBK2R4MDJr0cuwhH7RQrEu3eLKaMn0rxnP3S30cGpMGfBQNoe6HdpwEse6WvxrOLFwGGyn9UvsiTyKCJlcjwk5BqL8ZysbK6h8cMRT9lLxIR7ne3qE9TWY2nk7oA4vOnpNT4CVZuLbeiPMZhnXw45/OZEEyyr/FReasyyZOFMs8KTeWBcKl1KyAfF+GcruxI6ubaF0pFlR/Do1yle9B1BS+MrLULyhf+MsvKfmHqy70sWaj+VIcITqcNEB3lUWRZAasqDIYqG4r4s6lrjaQa2fIR0K/ajua/0J5YfMbi+/ZvcvZwCfIEEFSjJxE1u+THOs34UVZPQvAzyjOf4z2nEuIN7AJ99zk+XkvcM6pUT0Rg9+Ugb2LBe3Y/lGXBgldnUvtr3e6kNg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>6bEAp3UP4nU6On9yc8aAiML6AJ4EUMLZecO9Iww2IXKqBDdDWBeXDaq2unslxI5emHoNJiL7o4PcDhzpHslE7t2TU/PQRiNVzEUOMM1Akuj73bSAOWnzmBcneoDEhBVUQmt5FAopfMW4+02TPlAyBQ==</encrypted>]]>
      </text>
    </command>

  </commands>

</dir>
