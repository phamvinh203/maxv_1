<?xml version="1.0" encoding="utf-8"?>

<dir table="sysunitlimits2" code="ma_dvcs, user_id" order="ma_dvcs, user_id" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="quyền truy cập theo đơn vị" e="Unit Access Right"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
      <handle source="dmdvcs.ma_dvcs" foreward="true"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd%l" key="id in (select distinct id from @@appDatabaseName..vsysunitlimits where dbo.ff_ExactInlist(name,(select restrict_users from userinfo2 where id = @@userID)) = 1 and id not in (select id from @@appDatabaseName..vsysunitlimits where ma_dvcs = '{$%c[ma_dvcs]}'))" check="id in (select distinct id from @@appDatabaseName..vsysunitlimits where dbo.ff_ExactInlist(name,(select restrict_users from userinfo2 where id = @@userID)) = 1 and id not in (select id from @@appDatabaseName..vsysunitlimits where ma_dvcs = '{$%c[ma_dvcs]}'))" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa45a24RAXtRJXK1DagJEZXGE3WUp9s26EVEfqLzarvFLkVKOSZ9hVkRHDIq+EpFPf5A==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="name2" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd2%l" key="id in (select distinct id from userinfo2 where admin &lt;&gt; 1 and id not in (select id from @@appDatabaseName..vsysunitlimits where ma_dvcs = '{$%c[ma_dvcs]}'))" check="id in (select distinct id from userinfo2 where admin &lt;&gt; 1 and id not in (select id from @@appDatabaseName..vsysunitlimits where ma_dvcs = '{$%c[ma_dvcs]}'))" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa401jrAbekH21fwhm7dO7jmwwinzB30xyTVe3IClakLmIGA8HtsTfTGURO7SDgfZGFg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd2%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true" readOnly="true">
      <items style="Numeric"></items>
    </field>
    <field name="r_new" type="Boolean" categoryIndex="1">
      <header v="Mới" e="New"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Chức năng&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Function&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="r_edit" type="Boolean" categoryIndex="1">
      <header v="Sửa" e="Edit"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Giới hạn&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Deny&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="r_del" type="Boolean" categoryIndex="1">
      <header v="Xóa" e="Delete"></header>
      <items style="Numeric"/>
    </field>
    <field name="r_access" type="Boolean" categoryIndex="1">
      <header v="Truy cập" e="Access"></header>
      <items style="Numeric"/>
    </field>

    <field name="admin_yn" external="true" defaultValue="0" hidden="true" readOnly="true">
    </field>
    <field name="user_yn" external="true" defaultValue="1" hidden="true" readOnly="true" allowContain="true">
    </field>
    <field name="comment" external="true" defaultValue="''" disabled="true" hidden="true" readOnly="true">
    </field>
    <field name="id" external="true" defaultValue="''" type="Decimal" disabled="true" hidden="true" readOnly="true">
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 100, 100, 230, 0, 0"/>
      <item value="111011: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [user_id], [user_yn]"/>
      <item value="111001: [name].Label, [name], [ten_nsd%l], [id]"/>
      <item value="111001: [name2].Label, [name2], [ten_nsd2%l], [admin_yn]"/>
      <item value="11001: [r_new].Desciption, [r_edit].Desciption, [comment]"/>
      <item value="11: [r_new].Label, [r_new]"/>
      <item value="11: [r_edit].Label, [r_edit]"/>
      <item value="11: [r_del].Label, [r_del]"/>
      <item value="11: [r_access].Label, [r_access]"/>
      <categories>
        <category index="1" columns="120, 25, 70, 25, 100, 25, 180, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>

    <command event="Created">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kklE0HPVR8O3MXqbwOgwK68nsGzAUEn38jSamvJibnIrb6eD6/t7NaR+zbEVXa9dp2x5ygbrM2iJv36rU2RJRD8=</encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>CcEzR0EHfRtOELFKo+tXoKj/cuSsIeXP2HSYhFY7YQke9CxwujLhFQrH4Oxc2V6KSal0guPQ0spUQhoSAUCgCTadmgC0mtI86rbp84G8s51xNzBUll2MZRKA86xkACeaLpdJVlU2Upt8Y7ULxeiM7MpOHMmo0fF8CP+Oguf7s67Z/rZBqhuAOeCTP0kazLKnduS3KsegZTZv0Vc1PeZVUaTDTtbVMJkqtcRV42j7tORxLEDvjAhC8QBP/6GM/1khmuET8Vk4mpT284hg84vl4nPCi+VcmV2y7QYHLYMNoZqkSMjTrqqPCz3s5llXKCHEnn6PCr6+rM122jCuYZHZAXmgVQlhrPRCYOI653nxFC9ax8WiFjPqABI2kH28wHLaOdLRyIt68BwVCI3irG8BwQ==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>1z/uefEBU9JpYaF48lULs0A6QpF/6YPDBtGTeb5ZRcV27jFt0g0K90JB81GQ5nivh4r+fDnG24l9qMD3U1Jr+sz7wlg8nmwtCeLogiUIPjw+QQ9IL/MRiMVGQjG0hauVkMQfEzWrWWIsgerzVAwVeJDxSiY/oKfgz8HeckBNLzJFGx/gMRgztHvVfxHc8cMRG6OtrXcRrbm1Yn27z8yLx3LKfoqQgDF92bd2pvhVP23PZ/E60KfRrNA6by7+NyX4oxmE/J1894jEiXVg11oqc7bHmCqQmHDdXbNXP+TuNIcciAk9H+ndsJABkTQTPNIWSgmDXO16nWQ0SRwpmlxE95BGSWQmtt0s2d5AF3rgfQ2Q8SH/Ugjf39MA/9NnsRcAtqdl2gm2ubMwmbSpeiLTyd0cfl/4UfpZBCrfsOFB/A+N4/Am47pbbFSHmR6OVXjsbwiwQQW/j97ponkxk9HNV9B9kYcnSxOsi8zlL8CAK/4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>KN1XtRffzvAN7dv5yoO0ZnCDyvnBetsb6OdB6Kucw1wwg9Fx4/281NgqGwBg47reiB31Th0JLFOKn8zgq/vJLZ9L3n+V0nDj00S0HpxPLzTkFhzlSn7FoDFfvXpI9xmD5HAree3RivgeHK27rBObisA1eAkELiIA9DysUGaJD65Je8iIALMZUuIIc6so9WwtgZGcrWw6JBF3bHkiHI/F90OLzepcNNWMzmQhGZYYBT3OOPz/xVglUknMSMeHpU+vAdBEdD6nMblvQbxux/a+K3+qVpnEkYrQVcefC0GNCwxR20MIYMK2B5dB0QuXaEKX7/nfdzi42QrjPRJ1nPWgEjZTanrBX76XVNmxQpKdtC7gN2YAdS0jscFD17alqCg9yUQR7sIWHeRPl+hTOi7qXQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>KN1XtRffzvAN7dv5yoO0ZnCDyvnBetsb6OdB6Kucw1wwg9Fx4/281NgqGwBg47reiB31Th0JLFOKn8zgq/vJLZ9L3n+V0nDj00S0HpxPLzTkFhzlSn7FoDFfvXpI9xmD5HAree3RivgeHK27rBObisA1eAkELiIA9DysUGaJD65Je8iIALMZUuIIc6so9WwtgZGcrWw6JBF3bHkiHI/F90OLzepcNNWMzmQhGZYYBT3OOPz/xVglUknMSMeHpU+vAdBEdD6nMblvQbxux/a+K3+qVpnEkYrQVcefC0GNCwxR20MIYMK2B5dB0QuXaEKX7/nfdzi42QrjPRJ1nPWgEjZTanrBX76XVNmxQpKdtC7gN2YAdS0jscFD17alqCg9yUQR7sIWHeRPl+hTOi7qXQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>lyvXNZyjNsX9bB39Reswh6/eG7lpimEgYYe8m2oHquXe2iALpq2Z0EgNMsW7QG9F9VBzdBiAEC4F2VbQJ5ky0Yvi/xPUTUX0bYhkEYAVJ/iWeqWgxFsqxk6VK2uWDU4Z22LGTge+X1Qy0oGYVqrgljY1JSLRm9+5pZO0OW2ngji+8J+xQHSrt6d+DckVnPQ/e1cWawgK3nliXQq9x80QP9nZgprioAgUZDKa8A5ONTI1OSmm4huFzndRZMUQ3wyN5jKfFl8e8iYshpOWkOcCjjtJ3F74uav/v9uR5pOZMReaBMtfdlJ1kZb/45AoN1IME/47tuFsItYNBfZi+idqL6HgPP3/mNXb+kf33EE18A6q6Gz5gO1GQDP5pYJgUtgQjm1wmDplkXNTmlrIIPUXjAfdekWl7aSDz2mgcH6Fe9n/Pub+VYQDMlUld8Kwekn2</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>Egy3cTUUiFB76/D/apRaB/djGEujWWt91yp3lPxNiu6dinR/Zx3srJPS8cnDk8GeCLdShv+9ijVxTKc6MhEnI3F2aDXXoB0J3V0azRBuXk33AQnCbEMPMvM5e2nUCoefHjo1nz4oPY5ZCyo6XipU19awkvLepGH5KFXYgfMPWN38bMPPeu5pxuq9vZcabhdw74h2UjnLJUOIcw5ZQAuxr1qPVl0F6SpfI0X3/oBrzn5WG2jJBqjakfkMpkgNV3eKzhBh6KEbugTMJ7Cp7omtNDb1HC94DcaW4uBa5YspPq6GgoBaVIBv2jm/KBGI60X07aYOUZiO9Er+C5253Q+HMMSIOP/aH/60g41S/hHovn5bozP5NexJ8/gkl1o4xqGTcdPJxfvNDwfclBd5U84g1RRJvHZrWGiMCVdZETlUJ8rrQDA727JvnulRx8kJSRf+1CjU5OgPXYjqbkpPZ5UBQdLi9V9yLXhPgjdwRxCmWmIMxLOOpt5x6X7FJrNVX9w5e0viWmavgYHKi0eifs+pqA==</encrypted>]]>
      <![CDATA[<encrypted>tXdyHOUo+X/43lBa7s8hJTPbUsQmBma8zV4s1X+H4xZrMsDf4HSdkFe7nLTbDxqMMwEnOUNDR/UxUG57LJoZ7ySuqmOn8U2Vc6fbwMZGaEQOrpu7ZxQvckULNkkpJ4auO7+enZmAc6uPIwuVUlsOm9JeBNDZ51L3jOzsN7mnE9n4DxSZovDYKnAR1C2jmHabRIiPg9pMN7oR8hofhYXyb6ZS7v2Z/BReb7M9xNRX8CWGeTHzNzy4a6yjg1hyWQlUCMTUIUYW9MMF6zssLCkOlCVGQt6BGzolXva/zffMaZy1mZBi0H8sMfrM5kAZJ32j5Nr9curDz45++HvF/LFoPus+EBvymFO3dwYWe7HSJXm7YRGFBNOQGWuxtLcackBVC4BDc+M12cnoiv5ByEcZsn0XD+ATcmNa2sW8RY+Kpa6jJvMFQzRVj8jjJhNCcwpi4lEQakdWYKGf9+BRjxOealrk2wn8Wdhs95Du/ZiJ0Zd0sdVMXCsgPaRNHB337Yk7nLZKWDwVa8NHh3OA01n57ahvXo3i1UbBEXktjRkO9xSDGM2J43QEJgIFIuIG+1QomeQI7eqssA3lnS6PYsrD3YKBfU0yLAbl8vj6ItRerzmUfHJlvALoPqqT1WsJvo7gI89GxS/dQTRc7i/74zTo4YfjqEcA4R/ObOnFZZWsQ6mfMuAE9KALkaiziOgHA9wgWE+Q8bvAdcL1eG1g9bxvby0KFeYyicK/iIDEQSleVTPfDge/7F77fP//vTvMG6MtQFs8DDP4BuLqG3CJVTvTzOLW+fMH/i17S2MF1pIHxBR72tfpY47U3SLAcF0FIhy2kMlyQlCIA3f04Q/GDulwhH6SqryoifQUv1gc95ur/8mH7ECZFepkH/ViWzDCP0146ye7F4BjriOy0/38YG6nTKiHcLYrwaec1uPZT05EzE5pFHD0V938plW0JlReduEqEYFA3wiOFrWOxvtQjvW4Cg==</encrypted>]]>

    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>mv7XiHAYAWCX0oBTnyEra17CflBWac/w97cjxrFF7WtfymPaw5T9B4SbqC82fbVuxSYZWCSh/PtNC0fwnChx+hYRL20i04AIulnaGewejeV9rWIQDCv0uoLY9Yy3u+RUFcucpMVz1KkCjIsAy1pIeO56S+ilQXitlG4NJNdW8CCBUFyQKwPGMAXQMoJiuviF3GDPWH1hP/CFih4PPhcOZ36teEnZDzm9RKZRhx+3R8M=</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>ZbidIbWv7Q2TykPrxG5ndXChLfyBAa52Wq8s6NGqPekN0CYEkrk1ZXeIIvjw4/Evbp1UkYpNr1PLI3fI4DreAV3CkeZVtSI2n6UdmMl9B4Xaskjn94RX76PMzV9eK3l49wVKM/r5nSkjpaVAha+2xrXCYdD2qU7oC55AQDeK+Sw2hL98pVNys6JBMvcI5DtTyEmjOLBM1B6pJCRm/MECNlyaMUqE175wKOs6FF5WgV8=</encrypted>]]>
    </text>
  </css>
</dir>
