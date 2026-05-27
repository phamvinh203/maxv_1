<?xml version="1.0" encoding="utf-8"?>
<dir table="dmtklkvv" code="tk_lkvv" order="tk_lkvv" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tài khoản" e="Account"></title>
  <fields>
    <field name="tk_lkvv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = 1" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="no_co" type="Boolean" clientDefault="Default">
      <header v="Nợ/Có" e="Debit/Credit"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 330"/>
      <item value="11001: [tk_lkvv].Label, [tk_lkvv], [ten_tk%l]"/>
      <item value="11---: [no_co].Label, [no_co]"/>
      <item value="11010: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>iXTjIbzhtCvjC+jTx31X+iN9GdjpdzEAFYUcj7RhJDoCZiyXyY+gnRrFq2pz8zAPhaFWDXvnEWWzb9g11bzEIVg1HfHLMIy/0Qsnqli3DF92e3ggBCOAGcS640Eh7dhbF9duOEDk6UG+k6R7rRNleHfiq6kb4aiVpPAGF80Ie9k/Ot7Lf21+pkh/SUscQCuhAcwEPlA2tOAh5TR8eIre4S6dOrboyw+dnrpyK30d1xymSzCAoq4rN03FHd18XjjGN1c+O3KdpK+FA0eTd/lOot/ciNHZs2eVWxGl/GmQvMZeV+AahbJcXkZa9fohBggqGj7qdc7GhHHpgwDK6l95sL9OXyXdSd85MylY/li0BMDKSjyPnlvRgIyNOIXZ6mXy8+Z47PlzIGe2F+0q8sqqENYI1kjxFLruy3gXS0NrqSgAPczdstDhrR6zQBHEVNuJ8+/xmOlEEWhG3ZCCCjI0HQjS+UlsHFibS2I/tNazaT4PDeo54IxyXGKK6IhvVSRwT6F7tfB0kB9hsUwC5YanHwVVWaKvr0TKn3iwdVRM20cJwluntD4GlbpbRUKQagtj</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>aRp2UMpnHwesoqAVI37aHL7HfAcKFUHxHu0GeUgOBdmvyqWSAxFDSXC08n6YOXImPD5wQAMk/2vV6N6Xn1ELo4H71X34iJHN4UW+3Pplyg/ub/REz+Q4ZCg2hpm1Z1u1VNVhSJDdiFL07Te70Y2CBQSygsgz/1xs7EBs7deGlSCDcGEALDfEQ0YwJBrwUKas3QkX8N6DqLEbIqBY8Rhpunsoe1kTXtftZ+I65C983HuiBNR6lljr4jtlUgnPtGV3k71PbzYPaosFrfBxalTlGg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>6JgV622O1QkxRdVn3np0Qtu0uyWrxM9xHy35ScQ04DYP7biw4Sz+dkHUNqMeBwP2FXjRe2n1Cs5CX418DzxSF/79DH9zSwBnkNxoSt3aK15u9phcTeUD3XCSQkeIA/nGEB8yq+I6g7SkQGbj5+yEkkWSasQP5LVtOdMe6M/YbZZMKthRLnDm4QAmqDr6AOX3pW3IWQILyUOhUVf3Jm0CluRgr2elbW+qpRFvFGYnN0cZRisLHIAiQfEqD6oTJQLsHHwmt6WIadmNsTgm2nm5MSECJet1211nTOgeU0+t8JEHWXj/2vZD9WHjlIclKAdA7ycxoKaTNPmRX5Ulqw4UGQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILaH7WeiKE5QcMN5w9779+L6UWQZ4uZOviH0Wgu8isjij</encrypted>]]>
      </text>
    </command>

  </commands>
</dir>
