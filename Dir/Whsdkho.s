<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY WhenBalanceBeforeEdit "
if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      declare @$checkVoucherUnit varchar(32)
      select @$checkVoucherUnit = ma_dvcs from dmkho where ma_kho = @ma_kho
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end">
]>

<dir table="cdlo2" code="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" order="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tồn kho đầu kỳ thực tế" e=" Physical Stock Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls ="false">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa46Z5k7zUenSwhJbTUI3hiUf1G07pt2bprWHFwviQzp7adY6CYnpGcygzqiLhGMr+dA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls ="false">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'" check="ma_dvcs = @@unit" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa46Z5k7zUenSwhJbTUI3hiUeWtP3CrNnC+YFbPahy4mB8cfGSgscm1TmpAZrF4zPc5w==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c[ma_vt]}' and status = '1'" check="ma_vt = '{$%c[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ton00" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Tồn đầu " e="Opening Quantity"></header>
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
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="111: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="111: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="111: [ton00].Label, [ton00], [nam]"/>
      <item value="--1: [lo_yn]"/>
      <item value="--11: [vi_tri_yn], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>3Zc6mGSiuZnyzSsL1jvw0qPqG1xkfEZAw6mbpB78280qGH+IZyg4C94DqmaIEqhlhoCD+G8l93J9VYDB2OIqws1UPP8aSgZvJ2MBis3ZxlrzQw6k3WMSHCre9bcS+zTeDJt1tcm0fQZe+cq1/ASbyECm+YhEIdq+C4kJ/Cbd7bznq7Gsf+aSl3Y8Ocdfj2NSD127Q8D1coi7ru3e20F7+A==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>MzmyEZ144GjhsJJeeJytknRIsjarXulTWe34wzVsy5dXHTERGXlAJzGFR9fb6Kqj4l+vjJ/mEsz7qSu5X7SHXw==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F5TO6PUvuzECvgYM/jXufIR3Nj1ZbutsAQTd+OJi6tddMdCYzgAEtPyREmRX9s/hERN0qqNt0VFWZjfmmJW97WzBTNxGW+slN7c/SRdS6g77</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>MzmyEZ144GjhsJJeeJytknRIsjarXulTWe34wzVsy5f+guo6mx0H0LPdh/QDN/1W1BGmzzdjpBZ6CL3NShrqmw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3krliS4mOufbotnvmVF9Sb5s/wfLb35F9KAEKJa8C8qzweuVUm3IY8fNgklWtIpzoO1/cTVEnYS8UCMHovlrsqWI=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>hR7c+O67y/OtC2uu+Qo6c+4SA57XqD5SbHU9Cr+8voQxpMlh+6QY8nt7MCXT1Dqw3ignl3kxqWU+roPK0idJYh3/Bw3s6hQQJueB2KaEmgsRyJfKCcmiV74Bp+KnEm4jzyQ7isK2YatSiI7i404QbXhKBSck8bhJcJQyMCPA6qkvkdynmSN+G8F+5vBcHZABJux0U7brOr1saZ5SUA2Ml4tLDIiJaMvfz0pcTZzPrEZ+fy5g1iah6WlPrB6lQXX9s55oRd9ITZHC9sf1Iop9hdk9vCB/F3+PrHwq0LekMdw=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>Kb0lRa6HRX8T0wEQIEXznlmKfrCa1MEb4XrgZuBCTydfFkOnEhi9zsOs2HRdJ6IP6U8gPnNKjW7Ugxa6r1dAAxjCg5u9lwBwPHvHFebcDljHqXtlXHreRQCBIPOZiL9eOsvrT9yIQxBuKRhzZb6tUs9q4tSe2SjBsHXM+AIjPnnwjmIGEpt/RJQLESyymndIHaYj0ehrbsOow45QhN1XpyWAi1vcYtDnBQ+w451AHJxPn36xeTagNozN0V0pbYS6Syz6cLCpFOPNnirDYUYb8tkZESIwXtA3mNJ/MoB+a+7PnPT9jbl8fg/U86W7i+djXVRi0R8o+zvFXztXnEpgvFvnwiqM9T6iFbaXIHgjPoxCK9gjT6LvpY5dwCrrELiae7a0NT04xdT0dMOJqpGC+D4OaezVjNfi2EvcozPGekjulkWnvrocWf248NG3Enk5mVTOjxm+FbRpwr9377QbyL/vkl4qYlHZ4cEzRwePLzIO92p0A2IXsEI+w/LW7psl</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>+32IDQAv82e+ZnkD6NJU5/DcaSRS/ao8Ez1nFDwcxECsGlBTLwxvU5dtbNQ0krDmv6ahfYdsCZaN+xXXwrkr/APkY6aP7V7Ns+SdZ6Bwc0lpoKd/2GiBEWFFS/clFAF8xGsRf31ZMeY7QQ1cDkFOlyzFDJzNaWRkoQfU/IgUgHU8Sp/AwzQrjbMcuqGiNJImPFO153cHBjf6e4am6foj4V2hZpsrYEalxhMGgB3hW/DXvemtPrLH6nC6CuPNDlrQ</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>MCiiHOhG6tLJlCo+XvfPC4iHNYbqiuj74hmaWmrSLdwRqIN4ZSXE2891wkebkEPRIo0Ll4aEsfE6hS1MmLWBqJBuo6K+/4leyLcgMsxjm2VAjHMmMPJ8Wt/Q2/x/fwdS5cxQqnndebWsla9ZQ55+AgXA1T6NeI0obI3gwPq/MiQ64KsVqjF8UQYLMLjeDn8U</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>V8A47j+vwD2EVFDcklswGFfvgdb19uKVuNxRmQeKSXcvmZ0Y+zOlm+ecbcdwToLqzdpvMPA3n3TZtSkHr4bxhDUIZ1tho/NeIYgZnxqhvWVhJEM3Y7/2ETwNBboRKVr6u0W0mw3cKiyH+FhnZBFU66FaASXeqOcd2YrneARq0zHDVvfGdPPwuQKIQGsIYYSor+/js3Oh96gy1m0mm1NIsgOpgz2iYgGmx4er6tfD6zGHjhdrZ2AN+MHSzfw2C1uwg3L2HM4KwpkgRK02t/MCJ0AbIgxcPyN9vOSf7o+htWj9j1gTw+vfoA19yi5lSWrhBWLWDTqwKAfjDVi424Jjc+9esf0dIPwxXK6MMEFiyHqMXf5EPN1dC9NTRt8o1UeOTH5Mo/SflDZrl7kuWdFGW9d7drVXxSWMrFYJl7mtBdP7s/MyZ2pRBBAeLRNC/uKKm5eg+ARXxR+8TMrdhg8zjg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>FVb7Lm2HZFsQ5EVmPg5O7hc1R/0/RGuu/f1VmavRGAy8sFC4LQtQSS6aok3orPgxWgsR4d6O54VMe96WsyfsnteszTGYif/X2IymB+pft5jWzsquer7NbhpF7cr+wzw6Sh/xZOf4GwwRJBuYiTq8FEfg/krKevHVElro9SdKsBkl+BlxDVmkHnyZ0QIBpIPh3DxSKuTCq1mqJbUrsj9K58g6E8V2lXNlP/PprlEC6YxK+853jaq+hZezM9pjfcV8dZEcdeBq+y9FT2r63n8c3TXap63Ab4X4gYd3dwogSKxPd9IrHzrk5frOAgpHBfc/</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>8fVwEDGAzn9i6sjSZo8bBjPuQXqCfJMCXZhd9+T+g/mifgKwTrzumkZ6uQbQjzXgrU6zGke9/qWa1jR7tUpwBXfnCquju2Ny/Z8excOVQhOp4SnC95OKyfTSw960JJmY5Z6/VXNJB07mHmQ29FBy39eFqQTouXqhri1e+9UvhikmKImzaZUBOOTHsgtD5toDaLEJ7c8n1npkaVs0u0jjfMx2Z9zZXq/dC2x3CZvRwm9MG1UowzGj5J9LsxbfQVVQll5rASViM9Eu5rP4VKrtCjMsoSVMZX3bM4Jx6SjKKGNQEuuxN8/LB5Z/vf+CT9UYZBgrd1Dyx37y0KIIe3RZp8/ZnJ6Ax1FRIyoMfCujXgx2RtvSfUIXhL3kwE0BsXc8</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>MCiiHOhG6tLJlCo+XvfPC4iHNYbqiuj74hmaWmrSLdwRqIN4ZSXE2891wkebkEPRIo0Ll4aEsfE6hS1MmLWBqAzfS1HqORc47zWWcTNKCrU=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>uz/CrOHEeevrV1S98WfGDeo5KNql475Dj45nAp5L8zm2jfi4eFKElcf5xYswmUrs/GdyNrTwwAJZXj+U4JIheN8F4TrJ3SOuRGGxZOcizg1TD4CZJ8kTAbcakpc+ArgqGQ82tt0dIH6CEGljokc9xOMA9WPWLvDuhPh/DJDdqClnuwgIYwltffFp7/TmrO0LJw50Llmh0jblCXuydHiROSXqjDplWMEa4RmQsP7h5dx1e7ssO8aPt4ZGMe1vzw1pexrZQF8eXPC0ArJ7E8S9wFhcD2bYoWjy7qYdYKWrJKkijNIxuNxJLYR/iQpOrn8ab9kfl2HVW8xangme4Qd5J62bKN3smk5hW3+W0NB5kx+R6afKT2TfXuGI5mC+O41LGeH6k1RbPI4+HV3eLX/CwHWOqJDMfmkrKf6JxgqBk+hR3DoFDMNG/wHD8T6+OLW4W5lanhAtgVM9fL9wk5MjnaQhS4ozSRHVoFBZPHbKBBve5SaXhyFv9vcLwXFi8wAfpTbYPtSZcYWaIx4HtSwkMI6T/iqpx4QJSocIgLwBVo01lAZScWo0pYF6UQPxdc3X0feyYWPKSI2q+nudOWnYCb0EXbH1JGk/emQ1sM+dpC/KjNeN9wBdLpqK+7YIEATK5BGVV6rIDQV8dl9YhZJa7kJXujO/vHqTAOOVfNcSOfg=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>1StPJ57rSiTfiOLdWEArTIgScQjd28HwLVMd5GxjVfkVnbZxds7507+hdadSzInRLiqNRRGTVVxkcJigxm5grOE4kZyl5974sA5+ZHLAQdPJXVbYUgvLi3Z5UUlC/w9M1YnnySU0ZFKkK8BOHYATog==</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>f8sVAl7YdhY3yYnpGNWop05C7js3RF/CmL/ANZxVJC3vofKvWgI7ASOtjJlw+c3d/cBhhJFGsHxzWyUdGHsJwMEpBL1k4iHkmgp4n/hnMupc6p6kLQWLC+35Faug+s/lg5hG9q3lVuEjCkQ1OEA3PV0JSjk6QZ8GWX9Hhu6BnGI=</encrypted>]]>
      </text>
    </action>

  </response>

</dir>
