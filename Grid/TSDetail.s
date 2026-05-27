<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ctdmcc" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="CC1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctdmcc" prime="ctdmcc" inquiry="icc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_nv" isPrimaryKey="true" allowNulls="false" width="90" aliasName="a">
      <header v="Nguồn vốn" e="Capital"></header>
      <items style="AutoComplete" controller="Capital" reference="ten_nv%l" key="status = '1'" check="1 = 1" information="ma_nv$dmnv.ten_nv%l"/>
      <handle source="dmnv.ma_nv" foreward="true"/>
    </field>
    <field name="ten_nv%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="200" aliasName="b">
      <header v="Tên nguồn vốn" e="Capital Name"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Gt đã pb nt" e="FC Accumulated Allocation"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" readOnly="true" width="100">
      <header v="Gt còn lại nt" e="FC Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Gt pb kỳ nt" e="FC Allocation per Period"></header>
      <items style="Numeric"/>
    </field>

    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Gt đã pb" e="Accumulated Allocation"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" inactivate="true" readOnly="true">
      <header v="Gt còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Gt pb kỳ" e="Allocation per Period"></header>
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
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nv"/>
      <field name="ten_nv%l"/>
      <field name="nguyen_gia_nt"/>
      <field name="gt_da_kh_nt"/>
      <field name="gt_cl_nt"/>
      <field name="gt_kh_ky_nt"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_kh"/>
      <field name="gt_cl"/>
      <field name="gt_kh_ky"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="dien_giai"/>
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
      <![CDATA[<encrypted>cRC0oI0aDBKbjeuFZVURUO6MHwXJXBvQFLCscQ/OlM17f5Crp99dufJVY+eLnpRd8b4I9RKQrVAq7oR3XH9/Su49qngbH1sVzewKwD03NiUF2JYusc1zviaxFWOPaomFOWPhZoFAJpHd+JYLpFeJmbXHjsiGT5cK12VSirqfgvv+6GqLsvLG83eiesTDVaS8P2G86IaZEmqbC07znDbE1cIOMmy9n7rdJ3THTg2F0eE2GuCnITyLz/13UYkH9yw1vHzO50EReooFcCUhUeNuoCjxttdFOMf8WUCHZc9YbNwdlu7njxyQ+BC1R8HuQST9BxnzjQhcPrNrqfPRe1CzxPRmykoHNvmevkFjE5bPV/2IfV5I5zrPrjt6rvMdUSfBWofAV1qJF1rjefqMvsBU/d0d06Up7CiodPWm+aNV3CKYcP+wMTv0ziZN07XsIBfEavrYkg8hXPIVlalSIPN84knnE8D3Lfi2iioLFlNvEkLsamUiPhBdHPYiZfOWlwfdi9hJ8sGPsNMaFbDhZG4NSbqk5Q9lvRJfOJNzHbBN9+h0HalhBLU7AfEeylvPZzHrr58GzM/ZqInSvk45Xts43v8cfT5EC9dilHoCog7sbcqdQJGjXp2Vm40Mv3ker1V6mIYufZWT5qJF80UjhlOYrtlaIYQHHuW1bHf2Yk0dXqCSTF6CfTZ9y7LJSATOu4ZsqJgD6pSWyMXK3a6HbFeJU9P/fT4fbwHX698sRxtTikozA9Ty6A2C0h3/oAuxIyxh8mUmMisa4HNZdHqiOUp8cX7+jvcsGz68uLAX6RqezMYBXtNkFglJLM0oT3rN6dCtGU72r2fKvBGEKkL0J31s//b8DLKaNUgqJjDeUffJ0IRN/xZlM5kcX0lbK3Ze9W6nao8GSoVK9FN6RBlAc78q8gvJTxyM+jbvB0EXSUpspjAHxehXKOIAdJkgEF3dyxVTjg7Dhe2PV7KA7k9ACXRiOjClBk7Yuojhjj2kWG5G/p+LnocgHhCfkEq/RZSCRl4pY74+vi+jLeZ73exg2u1kWvmkf4x8O3EsU1iMGT7LvLo=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>0sroB3VeLqy5knK6N5EGa7bJk536m7oFqviyN3+BccAbF+w8EVlLOO15RYT8rKkqSqQMy3l+9k+wCQyiHs99b7p+q+RRHgxmvfYPTZAMHRBR6iK5+Pax8TsoQhGN9A+5/KZipEM27vjCLfCsr9SdkhGLp3aHxnjIAC3HMpVtDO2+asY2Tx+6rESbIcbd5/CG</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>
