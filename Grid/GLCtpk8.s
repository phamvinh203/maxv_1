<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
]>

<grid table="dmkcgv" code="stt_rec" order="stt" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bút toán kết chuyển giá vốn" e="Gross Transaction"></title>
  <subTitle v="Từ kỳ %s1 đến kỳ %s2 năm %s3." e="Period from %s1 to %s2 year %s3."></subTitle>
  <partition table="dmkcgv" prime="dmkcgv" inquiry="" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60" external="true" aliasName="cast(0 as bit)" filterSource="Tag" readOnly="false">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Decimal" width="100" allowFilter="true" align="right" readOnly="true">
      <header v="Số thứ tự" e="Ordinal No."></header>
    </field>
    <field name="ten_bt" isPrimaryKey="true" width="300" allowFilter="true" readOnly="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="tk_no" width="100" allowFilter="true" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_co" width="100" allowFilter="true" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tag"/>
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ksHDWCkHEtt+iNpyzh+LEKBKdSHSq2KxZh+kM06qUrCjf0VOcf5QGfSwrPTfWxXDu/kuR50cuFvCXRk3YVxuVus=</encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjsTx4aoKFC/0LzfM++Agf3Fpu6I4lq+rJk2T/lWJ989igNkrtMHCGTP0xuDcKUyOpwzZw+5PofBKEnfxnInsRo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ku0s+MPpSw+4BviHGbpGdzmfyHR4o7kMFkgcV8IF788NeGSFsV3oPRikiY+QT/tRUqEgJ7LJBBOv5piVkre9bso=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>QIoZw+jXH/OqCaBVQ7QnUNS8OGT56y6O1VSowab3SY6vaSoZ7OhbeH6GveKCC6WyO7inTg15IOvMhW5ixIksuxDVFN0C7g3BxHTUYKZPbhDjO2pv1aSdxpV/ESWl/EUlPl/Gv2iBXhzWGesrByxAhhDf1DZkxiq3xhNF1k+67ynhGLmavvP4k9Ox7Bj4wE7XYINU5jLADTEfTkVW898ky+rS7J5xmedbdLuM/LmdMQdt0PSu8bx4e+mc8SGDW0wFEpkgoG+nlxU6FElBunkUy4q2GMOhjvqigpAOn5hRfeQFgRBViZvuwxV9GeA/2gTjmNy3FgWvMLvxB/IR0gOye1TovWChjya/syrIfKBurwGCXQcA882EE/h3f6wnZKtEZmfRjKbDn07WM0aVIr53wYDmtHQ1M60HFG+R4Z2rsm5/KngolM0tzR/MhCILFKS20Y2P6PtDpJXw9+aRfyIYy+lRNUuAPZTKI2Ke7O/V2HpqvneB7j2i2aO958+NL6LC56WgQiphRdIEzcvlFpZBygEuRCmuAGVpxygr61eexGpoaVcJeyUwRMvCgyvwdHQ5wOuxwDwZ98oKvYOGIY0XLOhZgl96v88cDmX3nM5lg5oUFRQPGlRJEjQ1gGWtv4wLIz5A29GZmjztFDjLHrlJjIam3YYFIJHAtCnXccp0V+M7leJ2RHGxTlE3v26OTw0u9+8BKdOUglbK/Hb8U0LKX1R+kQC3ud1f5u/77nemd2mn7SwSOHoBKGqlkVnbz41WOJP/jXHzdtAaR9lA15Z3G7aV+yqQyRqiKy2dN4iMQP6P5SpLfFBB/X3KyLpWrsnUai4NkY7+KlMAFz+DTY8WStaDWS+J2x0Hq5PS7X7cYJSRai56MyYS9ELVJsq7T/jHChfdkYDmCq23bJ7g55plvPbrmm34ycEyYWRpYApoKUwvgF31AxgWb9dw3yG7sb15MbThrSDDYELTL6IXxhyorFHnyFk3Sc9tfxe2E/EnvAFF6MjG1T7zG5rP+UqNqfQuJ+H5ZR0+0c2/V6hwLvRP3CDcWJmVQDZovYIk3Ysk6yVGSWzPzSTWlCquFvu0GNbGVF36JKd23LnXS/sm+N8+QUyllwaoc1wamRFKct7lUHurLf1icToYY2wfYrjRfmStYibJoJ7S+CIDWa80gBXJvtPhZzCWbf6b3DpLJoxm7yHSZFkQp1CjCLZxnQgsVyMQviL2iKF0+5BY98vqJzEX8UYp2nvC+QpHoBlimER4nEDe+EEfm6rm90T4qbLNY+58uv217ulTayyAqvlAUodYBdGqvCFIia01bh5ZDgOIsPqlPViolsfi+QhRp1TGk+EMcX+5PQwtmJrPaJ2fafFgP96E5ofP6LJgGwRT2IV4w0gqfH4atJIm01WSoIoAaNRIslSJvrnw4YUJTbLHyMFh61//PlpA+NlRO+G10bwQlF3Xf8EWOGu+q82fk3biPp1Se8eBNw/UcVAOlCh31YRSoX6PW/YWHIN5hFka+o+GUqJ5UEeFD5H8Cwk/ZCDmQIiYxiLmapE93tQNCOMkJCLEgeMJBUhghGcCvWhZLziQ3pvPznVI9BEI+RvLrw1L1hGEXdWEgmtKM0Q4UJVOBOAh9vRdSb04OdI6BVTr1gKmR95HhqELFptATvK12JdINi6n2+QdPaxlheUhZOrBGnvmqzRnmCj3C1vXBZHp6vu/V7+VUprldqJlZ1gi8ld1w71g41IdCFuUeO2yQRpDpERPNIFFclaZA/OknCPcfZIFKlw/iOzcZjtusIhFZOVYG+oYfs/2hNxFfe68t/DQtu5BmZBFpgZhXrWhJ8vSsGsPCwc=</encrypted>]]>
  
    </text>
  </script>

  <response>
    <action id="Calc">
      <text>
        <![CDATA[<encrypted>KGg33Cy6BWrqtFXg5we7taObUuUBWNXPOeWIJcL6v9tVslFraJbpSSHu5L2dhT4RGWbJtpBXLWVZcHjtbtZe9Ctss56nX5SVUm9qUa4L8b6GipS/9siXQylVtaKnO0P5h92ZC/fo51Zq4RP6emKn/u/4WFSEGmFdlrHN19swGEke33Eg/LRgGk4eMb8mQlFdAhq7wMTwfh7Jgqtm7TDIymu7vwg954Wo8Olhfot01wM=</encrypted>]]>
      </text>
    </action>

    <action id="Allocate">
      <text>
        <![CDATA[<encrypted>fxSlsYbXhCAgMM1+Bw7RmSgvaSfXdk567n1+59cOLLoT1B3LmUMMxTbfCJ04JVNb0r1mwphmAOSHnLNcSwre2J4Bw49m2CIYr5BTFJqfcEhjPHC2k8G5yIADYYq230J4TkzMGhQJFt1rCRKHXbBaFajWrbzbZOFRGLBYSfIqHSZ3u9RUPJs3NQ9B7W1orPKd2Vl4nz4xJ6J1L3Mf2MucXedDr9ZX5/57AY/oIuaGIE4DvK3YTSen0QSywDmhOTGUsLzvVO9LlOL/rmL6Cw2oYqymlbXRZqBNsbJgCCp8DDvzLUbwg4Fn8rau4pLtIKVBiy57YiMqCvBfjhIAwLul4UTLBV0y/Otvr6WtMpC0SQKqgN6OW35u1+68H9TblI3f</encrypted>]]>
      </text>
    </action>

    <action id="Truncate">
      <text>
        <![CDATA[<encrypted>i9Lx7q3WPtbQc3AltLDQlkcfApfEyI2M8D1E1xZNFuQjiWOILgHOH5Xzkir7jf05u79TlMmMUUD80jsYajB8wXA7wNGOZ2PQRzLMnK9qp4fZ6Ig9M6UDDvQFbszVCtNQD22WTt8dygJ9K/SFRqdNm+US2lW54hZqqhwmSkdMKezPrCrkBjQ8NkNc1OAI5PiXTpouW6kU6VSkxgu+9RtS/aJlMoRB2Mx9XWwSYw/KZbbrwNCF7+MO8pe9UBr9J5Ko</encrypted>]]>
      </text>
    </action>

  </response>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FlsW0AjXhxqF99a1gTZbDXMVWjOFL3zbk7ogcUV96VdNyo4K/0kak5azRoEMXHJY5oUVJ3B9ezEp/MU6of+dhEHwufkRb6C+4HPYg9t6CSSfFVwmZP0KEpOB0tYumpoSzn4AnNfh2RPQDwaOcLzTf08O22te12cLNv46XHrMivPYp</encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Calc">
      <title v="Lấy dự án phân bổ" e="Calculate"></title>
    </button>
    <button command="Edit">
      <title v="Nhập tỷ lệ % CPKC " e="Toolbar.Edit"></title>
    </button>
    <button command="Allocate">
      <title v="Phân bổ" e="Allocate"></title>
    </button>
    <button command="Truncate">
      <title v="Xóa phân bổ" e="Delete"></title>
    </button>

    <button command="Search">
      <title v="Chọn kỳ" e="Filter"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
