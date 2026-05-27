<?xml version="1.0" encoding="utf-8"?>

<dir table="vsysStatusRight2" code="user_id, ma_ct, status_id" order="name, ma_ct, status_id" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Giới hạn quyền truy cập trạng thái chứng từ" e="Limit Access Right to Voucher Statuses"></title>
  <fields>
    <field name="user_id" type="Decimal" isPrimaryKey="true" readOnly="true" allowNulls="false" inactivate="false" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="admin = 0 and status = '1'" check="admin = 0" information="name$vsysuserinfo.comment%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4/xJthm1HkMyUFVgw2tVUQ5qQcGzwV8EoTShT/1f8r0rylP5bD2WERWSLXJnrEX3cg==</encrypted>]]></clientScript>
    </field>
    <field name="comment%l" external="true" defaultValue="''" readOnly="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Chứng từ" e="Voucher"></header>
      <items style="AutoComplete" reference="ten_ct%l" controller="Voucher" key="wedition &lt;&gt; '9' and voucher_yn = 1 and status = '1'" check="wedition &lt;&gt; '9' and voucher_yn = 1" information="ma_ct$dmct.ten_ct%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa44QPOPRiekt328s9kHAtLA8g4XWqxtNUuPfV0DwFeTsXzgiXuLPLZbgEoYbkTaGodw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="status_id" isPrimaryKey="true" allowNulls="false">
      <header v="Trạng thái" e="Status"></header>
      <items style="AutoComplete" reference="statusname%l" controller="VoucherStatus" key="status &lt;&gt; '0' and ma_ct = '{$%c[ma_ct]}'" check="ma_ct = '{$%c[ma_ct]}'" information="status$dmttct.statusname%l"/>
    </field>
    <field name="statusname%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="r_edit" type="Boolean" clientDefault="Default">
      <header v="Không sửa" e="No Edit"></header>
      <items style="CheckBox"/>
    </field>
    <field name="r_del" type="Boolean" clientDefault="Default">
      <header v="Không xóa" e="No Delete"></header>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330, 0"/>
      <item value="11011: [name].Label, [name], [comment%l], [user_id]"/>
      <item value="1101: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="1101: [status_id].Label, [status_id], [statusname%l]"/>
      <item value="11: [r_edit].Label, [r_edit]"/>
      <item value="11: [r_del].Label, [r_del]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kmEYpx3BAmrbhbNd2jhrP+5c8whfQAsstcQ0iJ/xDCpngz5XxzCNNllXuGgogv58P5QlxAstcz5DzfDmnYPuGvs=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3knHYe1bEhPINDilwHi2trRznwM/ZOKDhKViuYu5kww3QjaTJFYkHTadKCm970+3fWtdyAg7EyspAi5poe6e31Ps=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>khTwQPTCucIu2zQ0m2e0CgTuQdtxFZDJa5F0NlJC0A9RYwvyM+vQuKIHLOoEr7L0S4dFHsctOK91snf8q3jlppUVfjNErhBPrCY6yCon6QciDbDdReherGoUl+Xc6GDGSF/xc3j8aimqYIZd6t2J3NKfePekorenuaiqJfnsQg1rvODe7/kDzaxPJ5xC4Y7P1PlUrUbO8CtNI6UHXCWoh49MOCvRqopve6oVIhaTVENHRWkma2rtmwZfwMjDJzmi7ooIDQ6z3lhPhjQ5a/LTKdNvUbzN4CpiWXdRWg3Fk12z56DfMjWVEOzPJ7Mk9rqQc/53pa4dAcaSR4HiDMaUP4GqveSvwuV3yIPT7eWX0gkGu2zUHUnZqVb8s5lsNEOe11HksvTGaShPk4uIk3BH4hEmca+RMfdvYSvn1FAjqZZUP/OxLl5gHKKoHuTR2GqZPBFeaf2SHtJVcY2lDypvKdMcgVTwi2h2ToH8NDygIGJCslx3L122T1a7polZpOme</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>+F6kirQAvVA4KAd5QIowwdVdFAnq3LtS3QApOPGcEzQsYz+o+3XbwLat0nK4DXQNF+Wz2t41FYJ555lxa9b/yH/FWvjFZofbqWnKSC8dWfXPhKCzKeyun6g7Jk0/1RXm/O5/AQCPwNRVBs1egZnCOMP6WfMTtrMpQibHKX3KM74/zcoM3Gsn6lqZOoFFJ/iFsKATvRGCUCqMA/Gl7DQiZNyvWA5t+nWhjTqwJDk8QCN2KODheHzipU+hFkgtkiarZcMMxYZjg4gU6buQmMIj0jRy2q6UFqdtRcHCMI7mcrDdbhAOtbbg57Pv69u6QUK+vvfA1VkG8DWzLZLY9YvlU2evTNiY4+FT2X3QR15hnvv/x10vxF2uylwdcawDThaCsih6Y838MaSy2iKy4KheYE62G/+8SvZr86jQoER0b+R/xWEJdxCDcXduBbyEhOVuqdqD5GERCcVY3Sc5Op1ElJXP4DPB5eH1L57Z/d3VjRqbxkSoGUuPVbtdiNUaug4QdeQwgmMBhjLRowgddEIHTMqijSLKv2Pd9yPskLlsXOZqdRFY6+gD0w+VHBAkseBjeeQSXpJCo7flxIvZhyJ7CHqXoVj5SjtHw6BX1uPczTU=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>T1WLNCP/NHHJGyFiiCfeY746en/44bprIKxFNBnvuBk=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>qEmhs2ARML6IDzaS3q6D7oeIRMuuHTBNAbCmjki9J2jpdzVY636uXqlSVDddBMIv+gmKaBj+hOhmWHasNFC4ujPIL0XFw/8Yyy3sPODkCBGVFjPyOPyjSTJXLC3dIDfcXuAomKxj5xUU/Fj0SLMxhMAwEas+UFqnDFTt7xACmo7PfSJMw4rnMEkRHREgG55t6DEWMUeIesdn8kiA618bY3LKGWYArpTDP5PHCXvnzRcf2BmXLTDWWOuRYA0Bf2aMHzXCTuUoX61LDeQWI8GJkN0vLWJpAzjOtig0yyFhpLgNByvU98wzdsoDcmjotEWNim+Z/yRthXn49HYc6MHcAC26aJYSBQVklr5Bgzz/R/llnBaC0X/hyXbR6zMfDOwng1Q0y7y14QtsqTbxx/y8NVYJJHT/xPZT28qvA6lVL2yVB5CqUho/uS8BQU/2Xxh3eNIWRyBqUE7cX83bSAkvtU37e7KwrDLUbcP245s9kwLIb19EBCB+2Ri/3wLzc/2rLiRBpgtgcim5lySTgmc03urlA+3o0flhKEL1javbVNx10Kgzzq0XGBFpMZKZBb8pvVFrdrCp4FOUhIi347o/97FKvg5bQuLVMmpi854618Colr9sLyhk5XEOPKHgTtJ2</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>T1WLNCP/NHHJGyFiiCfeY746en/44bprIKxFNBnvuBk=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>0qzTaMsSHAsZRrT2GLH8+Fw9/+e68F3Lea+2cqiStWs/f4lUkOHAn70nYIP7e9A+2JwJIRLzNDQp3F81O9+dalvyoU6ZW4p68rI+o1XCWsLRypB2+mW+Q3evbTI7kl/rEoA4t2VQhfPt166bIZwQMZsOgwLVe0QOsT+OpB9jJDc53yehAvlnUMNHpx0fXStStYGZ+P5BE3chxmEukpu+R6QW4VVnkuBf1ynrbVwRj3Vs2FLTlLKCZzWDBvyAKmUsPvM80P2eoF4KFs3VMclkloDuqzINYHBYL8U5CzTxqPxpfHJ3JI5WnV+ySpStOqBGmbhph5WONVixR0/40J3rbgY+50AGLGXt7pALBh00DRL+EXGU3qP0rJyGW6E+sjmXkuQEzmT3Yv9Yrs4g80lkaGzO9iKr8uH3BFaWUiK98Ve974vXYIixfknkN+eQsq2XRo7+Loaw01y6NC4lm+6UrGPzVy/RWDGLjVRDLy2VPFA=</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>T1WLNCP/NHHJGyFiiCfeY746en/44bprIKxFNBnvuBk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>eEdALnPCpX39MOsWi2ykYddX9X0LEefS/J8PotpssSqtPu6hyqonTIPUdbcVm/Wm2xAVAVnHLFJb8djS7XkBGg044QldbKrJEVKDhvlyoHcWMIBr9iF7FJnpy42bu3e8I3+sIs1YvnallAi9cQ2NLmlPoXjD9/INyIJinUkOSOgTvzDX/0uYxYBbMAlpkdFvJlxjTj7ET+S/8LQzenm67LqYs6Gs8e+k2vHtIoJBapoYcnZtuBLhdKTCE+IPiVvSilsH8cXiUc2jSiVdEAnTH1iMKnKhijo3ON5MQBBAwmRnIUf2njRIFBwOC2X8DP/R8otKYjlg3zvvw1YVwzo8CccfVC4W/nuep54JyeYYMnF5lXqRFAYto8wki6X1o7bwPyL/7zbKjqXlH6UZXNWrwmskBFX5gLmpJz02fvD+cePnKAlsXGLEK6nodxLU67zyBqvfN8cJ1UXb5tYrRIU6FUQ2ANW3Ut/KF1dJeLjsVbmbXZYDghgZKY5X6SMxAbAnJUSFneY8ExlzhBXoJWN7zhxe1DLf62kvYTpTzhB2PbLaL+7FzGXQxMqLxdVRQuej1y0fWZdLZ6PePDru1oY8O8F67SfboIRx3D8T5m3j9rNLiq0DW1BndTaeCWmUOgJBIoCXEwe9syvpdsCx0K4RajPj0gSyKAN2O545MUgPk/g=</encrypted>]]>
    </text>
  </script>


  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>td2G+z1fWeWRUz39uLg9pghcKJJcP79P2TwMXm/hwkDSKc2XT7jHeWiKGIDm+qbLuAJFvn6BGT3HUuc/kuZFljBswtrg+2q0js5+6bmFh0GuwWA+FWu0yhwlDkWf5zf01iDxg16enchmDLL73Ni1mw2YvKKHyBsTnegQKMuP3/0=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
