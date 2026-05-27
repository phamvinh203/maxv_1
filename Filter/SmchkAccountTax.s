<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="tc_thue" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tính chất thuế" e="Tax Property"/>
      <footer v="1 - Đầu vào, 2 - Đầu ra" e="1 - Input, 2 - Output"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_thue" allowNulls="false">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_thue%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <footer v="Chương trình kiểm tra" e="Checking by Program"></footer>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 100, 100, 130, 0"/>
      <item value="1100: [ngay1].Label, [ngay1]"/>
      <item value="1100: [ngay2].Label, [ngay2]"/>
      <item value="1101000: [tc_thue].Label, [tc_thue], [tc_thue].Description"/>
      <item value="1100100: [tk_thue].Label, [tk_thue], [ten_tk_thue%l]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjEOp5F41TxMad1+M5E1U+/ZEo5/LGszIG/mlcYD5N/Vgxeqc85ONaaadCcdyiyPnEexWrsq2TVXJjwqXMrT8ceZ24Q5aCT3G7VR3mHkJShEqDEXqt4ZPJxH6gc615xTqhQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>VfeY01Jrc86vJhq8+5YpNPFogSyzz+X0VSUrBkHh5NhUH5v/sWvuqS8XeG4cz6z7ouyyPM5SiAKBB1SAgzXS7GddtafNqEfgWJC1RP6Pc2V3eK3S3DnUPuoCjzVWHOI8F0In12frE9fi/oWzS9cdA70ezqpbfDMPJ+Tjs8y33rdlIewvpyIZjiServ9+OdViHG1Z6YE3dv5Op7MeY4WbsH+LmqnfE0ioeL3dq4hAbXppeZpmj//xkXCMEB/uJxAVeJtLeYlM1dGgSO3b/reGRwdZR6m+YKM2eMQnTLgR7YcyOQ68pxvO74XYcRkj+Mr6Ff1VB2ZT19fk+DjLzBJ7WfLt/a8/s9z4D4RVAjNiSINvqRlGPoBIv1E7eiN7xSkI2PhRzaYNtFu+ZA9+RAENXTr/AM2TbPHAs8um29pTiQ7guA4+UG9EXxfJbvyDZXEqs26qB9zdNnvPkWPd+5C1NfkNCGA8vCUt6p3EgTntaEbJuOl7jar/e0Zc+qhvWHEIeQY8TFKAcYaDgVJIstujcQ==</encrypted>]]>
    </text>
  </script>
</dir>
