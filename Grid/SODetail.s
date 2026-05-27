<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
]>

<grid table="d64$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SO1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c64$000000" prime="d64$" inquiry="i64$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng *" e="Item Code *"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt *" e="UOM *"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPO5Vu7zotkPNh5UDN2V7J3FvVhxkFLSxLNK45HvA2sFImSqzms1JcVt8xLVy+uouIk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho"  width="80" clientDefault="Default" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOsOqCtEJw8sjaJ5AuNCmVB8Q41yuCdKH1zOr5VMa0apGYKxfxKZc1r+KNu1g7NZfk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng *" e="Quantity *"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOqKYjGjeQ2B720vXiYhNo2aXrKV+GKZaM0F5zqnH2gIgrIagCNh2Gk44+hrme8DzQ=</encrypted>]]></clientScript>
    </field>
    <field name="gia_ban_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá bán nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue" width="80" aliasName="a">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMWANSp+4fESrNXmh3ZBDdfE6jWXZYbV6Fq2+jWE5kEBrfkyz8sxi2bweJpJM7gA2A=</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" readOnly="true" inactivate="true" dataFormatString="#0.00" width="80">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế nt" e="FC Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat" width="100" align="left">
      <header v="Ngày giao" e="Delivery Date"></header>
    </field>

    <field name="gia_ban" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_xuat" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" inactivate="true" clientDefault="0" width="80" hidden="true">
      <header v="Số lượng xuất" e="Issued Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" inactivate="true" clientDefault="0" width="80" hidden="true">
      <header v="Số lượng hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>

    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e="das"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_bg" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0bg" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="ma_kho"/>
      <field name="ten_kho%l"/>

      <field name="so_luong"/>
      <field name="gia_ban_nt"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="ck_nt"/>

      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
      <field name="thue_suat"/>
      <field name="thue_nt"/>
      <field name="ngay_giao"/>

      <field name="gia_ban"/>
      <field name="gia2"/>
      <field name="tien2"/>
      <field name="ck"/>
      <field name="thue"/>

      <field name="sl_xuat"/>
      <field name="sl_hd"/>

      &XMLUserDefinedViews;

      <field name="he_so"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="stt_rec_bg"/>
      <field name="stt_rec0bg"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXoK2w/YUkJHUY0ZH43sfD4duGnx7Ohbkr4DBDNymWoBwQEGMn/qD8zRnO7G9BYAe/TvwiNYB+shLIE0UZhWfV7Q==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCpOZwlE4lOVaY8k9R24ocGHqr/Y9vn0dleP1J95VH2VAf79ctKpKvXbOok8q6nET2T8O3xDK38OIY9OHxrvW7pj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>D8o2tNy+q4G0rATGfjfoM5K0U8B3199BHys1j+lUh8bLTWS0rSUKRb7MIo1QBO65TCkpcTbiXyPAMorlq+Wqc6zbSnfOliN891AalRkkjpsSLGsq2kKvhWLx80KmESfdZSutdbSd6wFw65dOZCHcmX+qnFXR8nPrWltKbHb494L6LKjHI9TZ52mm0oqHB2BIpijZwqGOuA7fd6LXw3ZdL1ZrG5ujgxAqevKxvQzA6DeC5e8EKxlUCL2W+5l+HfI6tRKO9ZZSGK2L5hB8KZN/PsW7cymA8mPmaDY99VovviqIZgiyUC01nlsuakN9Jwz/da16NZRrcBMJDe4UYum+JxUm6rLEo/XCUPMgcvZSatDGU+Gb0r29URYZbJpFbauWt+NC19ALX2miEUeClAjm15D7dwz6x/J2ZBppPFvOPyV1ojLcsjofF2hp2YhQnqf/Kj3qDkULscf+kwUNbYafjBJSyIg+Tc8Ck43u09cQ8vrKmxrafjknVoTIL8lJhF0g/lzABZdgSq17YZzowqZm0zzssPgYOUj8Kl393Umz3Rdt0HTtoOaM8mMLoGUeEtUGi9HPlSKvcXc6KK+udiTQmjrBM+32SVopmnz5lQX9cqjl5wCohqCZ+Aj4hnW9G2fH6DeCtY20Fk2dowbICe1ig7cwG8FVRyqnrZF+3aq/H5nNQyVKzQFzzrrODeZ8gfZsr/6Gsair+bS2MwiYa5ZO+GurnJfwtdYiEzMfHBp1N8FsaQUZDiH7THdQ/ab0MRKzWOYu00qMbOSDpkCFh8b8fklj3BsU13Ua8P37c5KSPaQ6Ru69CKPKcBwsjA2Xb3P/1he2qY8t3ZK5d+SaWzgXmWwPLQn6lod6+dL5XrrznH/3LOFEv8rwnzSCnpn3sYJoectoYnyYwGo8wMJg0rW44+HparkNltCuPVmW6H5sXoyEAfcQnR9b+82xPaGqInKAVNZQFjq31oAE3Rik1C5lQTPfqJLsrNZgTuDZP0R/SDoPYYohI1w4o5IxrfwVqIplNUTzwxteYhM6LABQYlK9FGRkSTQt5G4iupcmq2Bu+DmYgE4B7psK7Ksn8I+pwAJTGYncp1Ot8lhGNmd4qzxtK8gpQmCMblhQJSr/20LdOIqnDL4R5IjMdEWec8nHEUu1KR0cs80vwywhyAQpADZpjpLxVCDmaDVjMePmdBNE+te3g3jxqs/7MlCbZiGGYV5mWQ8nR+kySy0b3Z00/4UlUw==</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>B3M00vkbnS8vq9p5/OqWbN1x9rgQsq6rBonXwCzmYRiy80j1PxxDsMxRI3UVS8iFPDEshr3FxQr2a4nMxl5MVHlrE6D2OkkIFNiyiZoypjvcK/zE5jByASczqKUW2SkZ7khvba5EqwNM2dixS5mip+q8FQnbMsUDeztXTCcfZrwk0XmLixXt9ICgTVJoYtbJD0OMphG93GUiHI6IyfZ3MMMhOB+4Swsk7h9YHpDJKpFi7NIbnO+UeSlh40c9epHy41AI2bds29IHYzBs81GBqgBbGkUTLeYDks8MXGe04WhEUkop3/MXeurdokQMT7TS9SDCclmErdIXKwTDNZOri57PMuJqQthoxsQhQSKHRF24pIwbOunEXwUBcgiBhse6e1ANQTnXKwm34Y+qWCv/ZcQtPUVCDk5tyBI8pQBWIKVS/egSi4vQg15hoh9iaWaOif/fDKIo7f6Xrvd2tYL6XRnsy9odPisb90Wg5vGxs0UbHP+asYliJchvl2U3Pgcbmb035i8m6jfJtU1bTVr2Thcrgt7PjivKJUuvQYdgCEiV6rjPbkhJhF21F23jHcY7Hp0YLPmxwmlOXeR90CAWVx1VLo21lVU4CbTcQ3QZiTAyZMH1XCrACOGms04aDRttIoWEV/f6AGoVi0mJnCwTu5qCy7N3Niu+fyqYxHjMPCEIz0IU1iJCP+1qtHSDtPXGc+LGapbLc8NIWuE9oThVBN4QEJzV7XM6tdLxWB9WDzYYe8miYaSQv30ezhUsGPGM+vCAcIlUjciSaGQGyHYXU/p+GK8MzMQcZXiKB95MQSp7/11SkYioLt+vSCLnZNhKGVqIaxUfG4/HCAsr79Cd1rdctekOY6FlShqZatYOspYmWvq9uqWzcXJracmTrCoI50hJ7NUzZ0vG26Imq7uD/06SS3g7xRSGCw09PPmm1nhLaDX6eo+RhU5odWS/0tVfoqTm8/+cwa5FcHwTGwUARJUFVhsnyOjFxwGUAMl7joMCkdD0Xr1ge32BEs8Chcs1LZWH+SkrSZedR84OtFTijJBlWppjEaFLm6AO9ipfm+TH56c2G4N+hDUNcfNZmdi39GxyfQn9WeK883Dtq1QlJdOGAsPe5NUSFrHRgTj9zazO4RnGb1QD5wYbYOJTBm3d5dJRB19xuz+NDg0qzODagD1qElBNUmOQJi7x1s9OMw0Sw7t9NhOOkPF+lqiUtp+Amlzjb+1PSCCU5poMtPa6Poxj1kzU3ArRq8wZxykXTlBBQJiCP8WiTbyM7WFdKJAiitnVBnIIKFVzgdpWVbiNOBiVpCRmW7I4MmIGeVMFe/9BSGMrQxwY5YDIfSlxkfhff/m2FtBJF0it2FAXZnqZiVB9JS14Jr17e1SioJlAT3M=</encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>hl+Pm/BiSjJ1EhfExYcV3pOHlIO6FyPkHls6JbbGTKv5SGhp9YeZ6eWBjcMM+5qDL9pOLZhna98+ext2IESq3DBuul6hvlh1zL3YM6Vd6mMJ4vwjsf5cKyDwZoqybZnCMuPcTf+cCU0IPV2Sczxsts2q3wYIQxcZ4T+weQtHfH6R1uV/1vNuWsZ2Pph14Gn1JPAVT9S9nkNMWfqF3X/+gY8ItgT5cLxRX19sIuslMywKEFNqHAVRqa6o/stBsmmEuhPKWBU8qzewjq4dRgmJbRAqurgTrGhpZ6vsyU3Ct7I6w4b2RU6xmEEALwLh0ehq</encrypted>]]>
      </text>
    </action>

    <action id="UOM">
      <text>
        <![CDATA[<encrypted>3IY/lw0id1UrT+pbQ5RBBcqPp5f6u6caH2NSoMkZW2eMGT9aWkXa9ZmTAUWnzzZ/SXfMzbvt58aHE6y8E1GvO/FPKCu9lSDYIS3OY+bjqhU8m6h+a2SSYfcPSFfU34ZO/xdyBe6WWbEj7JSJ5jLpzRzdg3pWDYECTMp4no0xumk7zAtbe4koxzkZ0xPDyZuWMAbBSruBSC/orVU9QcvM/QSE2R1omC8fzGg/M//ka1YWUEPklBk44haiJgYx/fr1RdDz3jpfW8M4iSY/bMs/85kEZlDl1k7qRboGXWdLZvrBuioduYGPFq8cImsjrSoCnagR5oCD2y+MxM9VIwTXpw==</encrypted>]]>
      </text>
    </action>
    <action id="Site">
      <text>
        <![CDATA[<encrypted>AxUTgA+BgKxoTkLpt/k3ABbIQgVZgYnJr8tQU+/ErVhN/pfCp2jb2YFwEjGe6PU/uGrfPmwuZAn3ZISJwKzDKsPc1A7eniS6167Cc1qu8vFB9434a6tRAOlVBnu4Vzzl/pmxQOcO5LEfje4cH4ZazSGAtKSPYFTGpOk1YxytTFV1TFWlQz8o8fHUrV3WWJsP0O1UBpPX9zY9jOKFQxPQe1up1YxB3J03YPTotB3yWk3fCHr+bUEeNaRvQNZMA9gIGyZ0RcxtDuSDjog8FUQus6F634AzLuINJXAVR3sPRXzslYJ6bO+mxo8p1ank+gJZpSNye3CXRcfsdIEP0apEsA==</encrypted>]]>
      </text>
    </action>
    <action id="Quantity">
      <text>
        <![CDATA[<encrypted>WeAGCTH6arWSy8eLE+X5DmhwkJtKolc0+VLFsPCgUhQNljF8BE8dCdlnNjD6mEwc+WPycDSYj8/5kGQNzzm1vpZFXA9dtg6vGDRV9v/6R87PQH/ZOFLvCrvJ0gf4rvdgnc5h8pNaQYzSMp1G4swT/pxDZ2m6L6vUSM+yqlbtmvqPoFTE6NydX8x3R5DzyraYQ0UziXAvTcVW+TNl1NNSyzTeRUm0SZnlmJwQ2umpiZi2gDR3oqL18cMz+4ZyxC0hHMTCA25aPmbvTXJ14rxFIA==</encrypted>]]>
      </text>
    </action>

    <action id="GetTaxRate">
      <text>
        <![CDATA[<encrypted>NDOtOBT2wHmufX4Ccbozu0DbdrgaGRwcYR9uJfEnS1Bx9BrhzoeTItMzMkwFpGmBrQw1/TB8FHsy5/y8s7yK+El9rl1ZVoEFWI7UL/PKQu1TtCrnZ+/pwrVUws3IqcacwzKJH4mGNsROCr/mWGVnP69f6p7aK+gVOQA2cI/PRQc=</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>PIMwMHcDQTnS1pN0VxlCw1DMTFI30cte4yHGuipTUfzN6EH5hjcv5GMi6hUk0KtvRAZUnOzyMoUSJeOn2NvsN65MJpqez8OgZHvMtXDMsEBAl+81XHxMflCcdzGa/IEHzxF3dLxByfGScUDRhR9jWgdoXVqNngutcewuqmcN388szv9mhW8VBOwg6cy7d5L7</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
