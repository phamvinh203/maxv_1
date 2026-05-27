<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY WhenBalanceBeforeEdit "
if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      declare @$checkVoucherUnit varchar(32), @$site varchar(32)
      select @$site = ma_kho from @@table where nam = @nam and stt_rec_nt = @stt_rec_nt and stt_rec0 = @stt_rec0
      select @$checkVoucherUnit = ma_dvcs from dmkho where ma_kho = @$site
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end">
]>

<dir table="cdntxt" code="nam, stt_rec_nt, stt_rec0" order="nam, stt_rec_nt, stt_rec0" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chi tiết tồn kho nhập trước xuất trước" e="FIFO Stock Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec_nt" isPrimaryKey="true" hidden ="true" readOnly="true" allowNulls ="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden ="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct"  type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true" allowNulls ="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="so_ct" allowSorting="true" allowFilter="true" align ="right" allowNulls ="false" dataFormatString="@upperCaseFormat">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_vt" allowNulls ="false">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="gia_ton = 3 and status = '1'" check="gia_ton = 3" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa46Z5k7zUenSwhJbTUI3hiUf1G07pt2bprWHFwviQzp7adY6CYnpGcygzqiLhGMr+dA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" allowNulls ="false">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'" check="ma_dvcs = @@unit" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa46Z5k7zUenSwhJbTUI3hiUeWtP3CrNnC+YFbPahy4mB8cfGSgscm1TmpAZrF4zPc5w==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c[ma_vt]}' and status = '1'" check="ma_vt = '{$%c[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" align="right" allowNulls ="false">
      <header v="Tồn đầu " e="Opening Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư đầu" e="Opening Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư đầu ngoại tệ" e="FC Opening Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="111: [ngay_ct].Label, [ngay_ct], [lo_yn]"/>
      <item value="111: [so_ct].Label, [so_ct], [vi_tri_yn]"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="111: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="111: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="111: [so_luong].Label, [so_luong], [nam]"/>
      <item value="111: [tien].Label, [tien], [stt_rec0]"/>
      <item value="1111: [tien_nt].Label, [tien_nt], [stt_rec_nt], [dv_yn]"/>
    </view>

    <view id="Form">
      <item value="120, 100, 330, 0, 0"/>
      <item value="111: [ngay_ct].Label, [ngay_ct], [lo_yn]"/>
      <item value="111: [so_ct].Label, [so_ct], [vi_tri_yn]"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11111: [ma_kho].Label, [ma_kho], [ten_kho%l], [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="11111: [so_luong].Label, [so_luong], [nam], [ma_lo], [ten_lo%l]"/>
      <item value="111: [tien].Label, [tien], [stt_rec0]"/>
      <item value="1111: [tien_nt].Label, [tien_nt], [stt_rec_nt], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>372my4T+yO4R2CLZzRqW16gciv+V+EUIVKJqlEjtZJM3bm1CdGSQJBXVug0l9vclvPLn/OlL5KsGUhnJ0f2MpnhOWViTQHbHR8rRLXrRcrIRfoPRIvpZlWWZl8z5MOmdW5q6JdjvFTBZ4Ylfotf5WHtPssCdSIbtuL0BkkFDPwGREtGNq9lBmQdXADWHn65R6czbSWr4H6yMZMEUd3Y4rQ==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3OqmDartyEUr3ckuJgmUD40pUbpsccuA5fVd1xrpxDOHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F5TO6PUvuzECvgYM/jXufISF0kCvjHVQOwrqL9xfX3lgkgYHbUAhqBtrfrWEbd1XSIVJ/vjvKOe7a6q44bEgae+s+sKqA3YcP26Fz45KG7/1</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3OqmDartyEUr3ckuJgmUD40pUbpsccuA5fVd1xrpxDOHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3krliS4mOufbotnvmVF9Sb5s/wfLb35F9KAEKJa8C8qzweuVUm3IY8fNgklWtIpzoO1/cTVEnYS8UCMHovlrsqWI=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>W18imc/ayk+8obDWIv7PqbqdtfV/5WU/teqSOs32EidsFP/jxRvzDoladx4Cs4ZOL9sPJAIYmjXkFW+o3vIYeurG0vCoMK2WWCcgwqaUI+KbDJFEoY/QCJAPf9iU/5hupGnXdNM1yQP5iGqKkJTpbR+iZzXBz4AtrVChKPZHdxC7vQWXkmqfQ+FJiop1x1fACgF6Zy1FykIGsssoabfeY9qkObswm9MYHfJfbQxC5Its7aP43BkBB/xq3zj+xtIqtBTKlIjwSI4JHeR9r4Sd+sKeuThnqaKfh7FWxOlYeu5Ui9f2R0CAwK6A9FuLVNfVSTyMIw8ncaUHx4RjMc83WkuUXl0Zb8LRiWi6n/AgzKZws1z69na+JoL3Mk9EgMNB</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>qPssVpb5JMsvzhPJmoPjasDdZ5h1EzJbajIWir/e0FlDJmsHjh6OZh9J9BUCCpYcmp2ZAGFMpg2SzZirw3u6JOiYMoCGHeuhd/QIZBjEmne0+WvYLc2xNjLtR7bKs7WVMsut6NBCixO+IZofLGrIpSMzKM0n4HmUhD+jIVi9sUjyASvO28i1JjQAi0QKFdXnumomjlL20ngxgemEK2ZR/xRs+45BnsBql87w1orE85Difq90R7HJg12uOzr62bmDxbtS+lYswsLrwJfCx3uiXXw7JdoGgIHhqfq30AmbFffxJrRhNcbsR80oiZoyIW66X6ONzKFJg+dltpaUKoHfdQemadNmKr+LpyKwswBtDUM=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>RJMTY23rhcvWoSpxGG+WSld+caw1Hm0I+2lmqqmSqSoBPBQGb1aM517LLDYRUSQ8Nya657F5LwSFNBrdc4SsLmGLnv4IfxwfWIBrnU+L92sr02c+YEAyKjLTWXnZbHIpL3rNPE+ozNeYcsEQzlMhLlEWuuyqxJOxHx/AEIu8D3SmYzeYJv7+FcDwhEg4fuSS3LwFyUWoxnSSIwM+ZckNG8NLcEcjvli0GZi7gDqTNYXEDXrq7ew2731pw/WFiZYs</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>XiCLdzN2wa+iyQzNKWgDtvYYL1ARcqPg0vOTE/uCq1zqiiCqxS6cRL15cqwG4wS7opzRljSuR0h9ypnzkM8L83nHKTh+8H2dp4p8fr74GB0PTJIIk4Zp3Z2fimstwXsHEg7B8u0teF0tMEkLfcj7l4WS+qYp22Bt1mFyTxy2Cwq4gnT22UFlm3nGYwg4GoqY0Ix+KXTr9txCW+dcpcY1VA9X5t4hrY+Al71Vi6L45YD+j5aFwBto55vzSZ1GLa2Z</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>FcIxtMAZtx0LmTjr1cIniTsR2t2JDe8DMYyMyY6FX9ysuuxygtWs0jFbhKKBqrHeb4Rk4OF/kfEfdtv5/jUT5Zc+zTzwpj+n63165whO0j3HCYUmTDlDQykcB33LPcUeJBplKWzl+VW/0Rl9iulROKAycOvhYTHtDCJWTk/XhaJ10m/hm7LA+EMmXdoxo1t9CVNnJfFy7NrX4o04FU2lEnnxw6xTZBtN1oaNT3Re8K2i+tzQ2fi/0neltOtC+iRVv1wSoCWdw+CMPjSRWs8mtlyevwrkS/8YcTJwNnTY+ebon8E6ORrmgOAZYE1TQw3QmDZM91q8588D4hWEm5H+Tx9Ycif+jxBRMjxZqnPZXsMwHmXw4Q7Da3BlDW+zI4Gz</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>/k4Umrw4Zt2FUy7FKK+JyrJHJCi+xs5Ak1T9IooGNIFh2xHRGYlwXn3BqqFbW0HrQrq35AqvwQYMDYvtT8b0KKbmZCLcfJEy8LaeQlyWyE9zN5+6h3rScC9o7xDUPM8vDOqAip5dzCjt4QxSvnQH2HQtMzFu2a+q+YLl2BI1JzXLGjAQbynzgVnGlNVU81PRtuJt+F+F/skyMejNHIA6nht/TEo6CntIV+8AXPDSUtUd9daDspF9OMzi9eFN/au72WPd1AmGCZz3yHx7EJl9MDqQemvA43vRiY6nwUZwDsSfZuPwiiu5cKHmfoukFZ+dNPmVEpsw1USC22yrSspdxvFjdbsHL4QRuOd+sp74Hi/0i1JdvFJar6phVi8wBGfVU0PGOoeo8XX+dsECYQt7Wa/Q1w7ZhoLFaqQkr6/PIr30AZn62SGzPvulrokLBK0AJFuKlYr0KtYH7LPtBczCMg==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>MCiiHOhG6tLJlCo+XvfPC4iHNYbqiuj74hmaWmrSLdwRqIN4ZSXE2891wkebkEPRON0tAbytnfbbQtwXZKic5Ek4axl3Jnvc6/xzWmJLs/rD5cLqC0MHnjKtWr2xtmMg</encrypted>]]>
      </text>
    </command>

  </commands>


  <script>
    <text>
      <![CDATA[<encrypted>SCH2ioZyV1VxiOmEAbxkzA8HM1jv3RJkfMzMUH1+0waGWqAlzAqHnRF4ZAUE+6an3gdQOVGyFJ1NYoY8OEfSMk/e0aYktmJDqLDj/ur861mnA3iIkMW9HEA9wZxXjYK1pHKRdtDbcWx9uK6GgCz4s0P0EMRJMcmeotZfBWly+OsbQg7rSKQ4nLZgU/TWxFA/Tk9d3jO3V5oYi6SQgKAoEtNdwUoxUrEt01L0fBlptWA02l7U5oLAzzw8lPjhy5jkwulyN09q7uBr8qRziuhuVFaSbmaVyB06xSQdN0zt5jaldfEvndcFONYnjzhuvtMEqgx8fMm/Y8xKs0t05CBs9HutAiwpxvAi9BCCtqnOtqYjf+ayeN36h/b8mpruLkXuxly4TjHF5zrK6nDWqEZfzokDAV+yhZec643QkBKVeOuH1isH0mtdmW0DQPxbkZBXw8YtnZUEqdFYDcHBfK6Zm/i17YTbWcoBF3GIFdpCJcZ0eDaNmGwDT6csiG3Ivd50NTaZX1Btuw+7/NIVUXY3J0B3MoKFnp29JtGsrHQWx7hwMAGfQ1SxhKYRr+xvDECpJSSLH+pQ7yEpX9fpG+M29KIVs0yFq/pM0A8ZSYvR4ypi8jXwlpC+5HebyUJ3Gy8xWKXeVY+6GIUvxPsD0DS2Y15nFjvZcpaoewuqQFDLU8k3WSQJii8ffVjdLoF/PgzRr/V8E2GaREeS6CbYfSmftQ==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>1StPJ57rSiTfiOLdWEArTIgScQjd28HwLVMd5GxjVfkVnbZxds7507+hdadSzInRLiqNRRGTVVxkcJigxm5grOE4kZyl5974sA5+ZHLAQdO4OPLSC7XsiDCpcojGOkYCwN4vuFlQoSxDkynh8Pex/g==</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>hkRHnhbWHzPFub7xIEy7KDtJLwBzFNKAlVB9AFhS+oGYucFvfUVMBdtAJtLG/6zRDygIqlwE9c6InJLiwguLmcNDNwqgXn70oJmTuHo1FdXQkB0jHHj5bSrQIUiV50g8KycVf3RWQTCAT38TQ4Nhg59sfgg/rgBzEZaRoxobkg8=</encrypted>]]>
      </text>
    </action>

  </response>

</dir>
