<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmthuenk" code="ma_thue" order="ma_thue" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="thuế suất thuế nhập khẩu" e="Import Tax"></title>
  <fields>
    <field name="ma_thue" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã thuế" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_thue" allowNulls="false">
      <header v="Tên thuế" e="Description"></header>
    </field>
    <field name="ten_thue2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="thue_suat" type="Decimal" clientDefault="0" dataFormatString="##0.00">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
      <items style ="Numeric"></items>
    </field>
    <field name="tk_thue" dataFormatString="@upperCaseFormat">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" new ="Default" reference="ten_tk%l" key="status = '1' and loai_tk = 1" check="loai_tk = 1" information="tk$dmtk.ten_tk%l"/>
    </field>

    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_thue].Label, [ma_thue]"/>
      <item value="1100: [ten_thue].Label, [ten_thue]"/>
      <item value="1100: [ten_thue2].Label, [ten_thue2]"/>
      <item value="110: [thue_suat].Label, [thue_suat]"/>
      <item value="1101: [tk_thue].Label, [tk_thue],[ten_tk%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7TCyZc3mcIeWRnmLSsOSWbjva0QQ1k72EXoQF1wSi5XS3vS5x7Jkb1oBW+1r/iKLZ/+Z4421vai/tKr9V/5UHxQ=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7YXFQi+/nQXLw0n0lYndzfi4RSrD52XS+7v8G8WcKuDE53M1lO2u9g51TZjdrYVMaV/1X4NbwSCuNzJ9Y7HJY4U=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>WFneT6+mbiJOcW/BlKv+zfIOlbw7hOW4B6vKLUcYB8fOeJ+YebFTSGUYDf/xyWxicy/e2PAww1LlhrsicMICdRNNsbbHotIfp7LK0bEK3yOHo9b0BvbMUn5t1gHBZWjFgDmQhMcHfUstv0ftydOLzlErjAspGhpWGWuJVGUJrwpElMHsh1AxZ8go0rSy//sKTkXAKAaIsYGt5/XTrcudgxo/LK9Xx/bRja9X/WrhwceRVbfhcR9Vh5865Tsy45PQkDqbXmSnj7Z+IowyaB2PW1KOdLqKzM9bnslLB80NtXJ5YB5OBt8aLvK4yuNJS41Q6TY4QPLV3bLWu8GdrS1ESchekKCOpJq5pVtLamyGz5/nHuneWDJYwTQB0Uxqn6JPknE/EnUDv80vS9zun2bLPlQ/B4tW5/P59ZmZjMCdiZT5KAS5m88/ErbnNBrfxMLIAX3nIkxXDEyIn9N/FBwcPg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>DZG7GEI227+BhsXCUCQqwcAaihgyGJV4OYSwEZR2Z8PSy1xwcV8u5q50T0pxkLWnL9PoF88jPJ6Un9x1YxB7UPkGJtKTSWiW3k8KlMLwuc1RVlj0aXqrCW6y8GZbcsTuIht1Zk9zlWmDl1dVyZo/hCPPyfAQVyfm/EC5gI8+IoY8+4HMMDmWQ5uY1YjmAnZGooluQtTYkq/IqAu5zzhSqPYRYOLeeTkJUOjobCCHy7gn7yse0Srxcc1d5cRRr2yEWkKDigie8BGtojRUkEVB1w==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>6JgV622O1QkxRdVn3np0QhyZQ4XE/EcUBzKLzvjZhDUCVB+joip+PXzfXOa5hI/wSmIsEp9zU6ovnEjmilHJ/YW/QlUuP5S2q4hO+BOlWuJanZTBpgKPQ7T1z8yXcUdtDerSpBedsmyex65/vsMNZ2sCj8MwS4bRrlXIWkrWaAm0V8a/+nRgjPbfhiBSXK4rRW+7QplOvinLvx487MSrVQNGtauVlNibUuecMaHXr1TdwBaOzrWvtnn21gR0wJz529MADFf/vFSgcJ7NmIzqD/OMNpLfzkBlV4xOg9nzVlorn4rNgzb/6dsXs6hG5g0H/N2fz5BbAoBRCvJKbeZpFQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlTta7dOMHd3h/k7SVd3OObhFMj5ssnqhC4wYoZUVlvsi</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3ouNi6N7Y71w01XIV1FvmCc9UZWfn/tmV6D5le9z69K8fRBXPy4qhmCLEOFy+iT/Dmf3oW94vzwHesl2tXjXlWzxkCbc28F13MPWmlam51T62tbpsUM7tSdJx31lAfuF9UWwF3eEkRfEXIM3rXL+dKBdaFuX6YBuYAX1Z/4IXxYO3SWstH1h5J7OAh7WLtbwzl0QxYXi49jNP2rcFT+jBlzApo0CX9sovd8aD4OdFnNEiXJZeNLf9khbT54TAwz2mnV+gwteIMDQR0yIPY31u2ufFjXkQYekFIbasYbC9QUE3B4oo5XuY7ehwL/r/1AcrWY4kwe3uhnfjGBeozIjxDVc=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
