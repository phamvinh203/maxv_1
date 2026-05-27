<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
    <!ENTITY LockedDate "
if @r is not null begin
  select @locked as message
  return
end
">
  <!ENTITY Error "
if @r is not null begin
  select '' as message, @field as field, @r as record
  return
end
">
<!ENTITY s1 "Số hóa đơn &lt;span class=&quot;Highlight&quot;&gt;&#37;s1&lt;/span&gt; tại dòng &lt;span class=&quot;Highlight&quot;&gt;&#37;s2&lt;/span&gt;">
  <!ENTITY s2 "The invoice number &lt;span class=&quot;Highlight&quot;&gt;&#37;s1&lt;/span&gt; at row &lt;span class=&quot;Highlight&quot;&gt;&#37;s2&lt;/span&gt;">
]>
<dir table="ct60" code="stt_rec" order="stt_rec" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Hóa đơn mua hàng dịch vụ" e="Service Purchase Invoice"></title>
 <fields>
    <field name="stt_rec" readOnly ="true" hidden="true">
      <header v="stt rec" e="stt rec"></header>
    </field>
    <field name="ma_dvcs" readOnly ="true" hidden="true">
      <header v="ma_dvcs" e="ma_dvcs"></header>
    </field>
	
    <field name="ct60gl" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="300" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="EIAPDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
	
  </fields>

  <views>
    <view id="Dir" height="400" anchor="1" >
	 <item value="110, 300, 100, 100, 100, 100, 100, 37, 100, 100, 15, 62, 55, 100, 0, 0"/>
	 
	 <item value="11--------: [ma_dvcs],[stt_rec]"/>
	 <item value="1: [ct60gl]"/>
	 <categories>
        <category index="1" columns="1388" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>	

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fV8Db63cIL6Wa9pQWQxqQ5c270Lyday4oS85jUTh7MILz7PtlSlgzHpqfpLQ9EtdC+6oFCHdSwXB+fY7U1LofI=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f1h8IuHH30pVWY0Ih8jlSK4GR23//r9+Df1x7Rxvy4fUaWT5nIzqqYkQ+lL+LaUs6TURi0Gn0dfVR8nYIBwr0Y=</encrypted>]]>
      </text>
    </command>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>KGvnxAoRbzzJxoeI7HP+1UpogHBX+iNMgEyflnJXlbV1fjTdWtO5EDUa/wR0rqTldMBspCNMpJsx6r1vobulSesPV5pqZyRPm1yaaM/c9QAmvfO9KVOrDsjQyG4P2ule8nYRoigqXBYMw131yC/0V1dUvATpwwy1bAHjw1X6yClk93OzSmWYEVAE/Af2IDtqJFHHf/LxamAhloBKPPiMCDwoxQsS+vWjzxR/Zg0RhxFLn99z0lGhbEFWw3Y46KCmLlbfc+0v0XJpccCg3qAjai1N7ndLN6l3yTUY6fjEMrDrLO2gASvhZ1C/FAHRg6abE5j7QEKckaR1DjZtLx1Sjfes7Vj+Gt86z+E1uNaBqW7Eeq5CrapAjknSWrXWKacnyS127YqYe8jOsWea7caw2fXynixuWcvHYz97Lf0KIPuFPj+tYLV/KUGhOvI2QlkkEWXHVmseiwmDY8WEulRdtfOmoBGdd4rH+ifhrVpn6dGmlqvr3NSxcBxKTikC2u+kO8KabCr5tKc8phqZdTiL2wcbf06pPvFKl4iwBWF24/FIROUxoeSE55soJyYZfXVb6uEIoSgTtiU+7R3SzPNEZnGsUoFg2qrzmdBqipXimCrvpWfPxrpjERkjH1gXkIfbPONvNQAEJzYleLQwkxUevuj8HcA83NQRG6qMsyVRXiOyxkS1ro1JMFd+aUrlDDF+HGIOcgCa/sIPGtJTyDFyz7vtZj/uUdklN+yX+bLPBB85TV4u/lV/HxSNXCBAf/sfvJdkKD1k3Usam2GqOgLI31FIVaVkmayyo0/9wHMI3I96CFh3El9T3FKBZ/wmk/lUF3pzQsnBKtYtrKwFDtcGLQzjfdkFhdCpLwaRa/klTdYEHJesGIUvrQyCAuwouCVS0IqtzkMETMtifqgGUcnBOb2VI2mX9EdZvriG5j7i7GI=</encrypted>]]>&s1;<![CDATA[<encrypted>iNEGZu9O3re0dDi8BE0vV0Ep5rcpVy6H9d5jfEhWTc31NY2wZwcl7wGUp7kHFEWoer80gGUZh2QdJPJRQoNSr1dDYoZn95WSCKY3xbRsCkFHrhQtvBFIrmf7KZdqzLJm</encrypted>]]>&s2;<![CDATA[<encrypted>FJr4LeJ6rFrl1gXlW3SVj1Pt3kmqFwvMOI3AYqvgTSuZabRdWfKixglWlb8WU8BIpOikq19IW1Bk+/qZ+Ha6eppUVXhpUaPrd2D4GFKO0NT5ZmPDoL/MiqUjGgx5Ii71A7+PpXfkmnhXQLHiOzEF4Q==</encrypted>]]>&s1;<![CDATA[<encrypted>yx54K21T8qU2pKyeuDZHIDCPLfhciIBfDucsNxI25QFzGP4yLRR4rKU4YGAadUOa1tQBux8m5WeH2rvHL+0koKwPxihM57NBz4c6BwpAy64=</encrypted>]]>&s2;<![CDATA[<encrypted>eYYIcoOHWDx2QDzLaASIum+CPih/70+2cF2KLheON6EXxutJHqe6SKKOu2tUxabp3kyE9fJRon1wZJ6tJXFWLW8+tU8qobXpVARVMvErKq6HqQSBgC8n5hS7ESyt8TU4eATr/ZxSv9CAJjNf3Lk8dw==</encrypted>]]>&s1;<![CDATA[<encrypted>gjLp9IXhwcHH8nmMxswKQ17HkusHM83sU3TsDIDM4hKOo57UemQEft1uuICSi7JDPHStXycdpqCHQduo4i5g2S63/4Kv2K9qRhvTQCKoKsoZx8PFmroA1Aa3+7LWjkTs</encrypted>]]>&s2;<![CDATA[<encrypted>OXf803l7AEnvasfoCJp7+QkD6JwYAFqGs9dHASObpZEXPka9VBEFB9ViiQCLtJYnTOyquUiHKAe79B/xuuE9xDijg9DHGO0uAQ32TuxYwAgR5axE6PzMe+ikOEp6sbzIHFagd0yLlYyV2sa6QhXea+oUBygJJDo00lab271CrhMVzUmuxMwEMlXtXHghzH5Z9PE0F1Y2cv5Qbvj/+ql+JxyPJXz2jRm1h6gqUb4FasvUqqAzWD/x53GfVpIUWDO6TOGjifTDDKjTgCReIzan+kOsjzmiZBha9lcJ+32lG+eJ1170j9KzYFeuauBtnUolic0u7Rp+fn+Y/fUSJfzSQYR2WWzWalbHQ7G3tESwDMDte9Hy8zlcT2zgBLad2Dh9MSqh2X8+QCnjWyQUGSiF6GkuwsgEWnKuR3yGq4HZLb5kcMCpfUks1waude3Gwz8q81eXUU92Q0MGJrjNSefiiuBKedLpTu2TSktQ0szH4XkNbPUOvtmuAF+UgLQFbc+uGK0te/AjQ5AMgo0ZyQNRvFGIQJ2yqXj4mN39u/Ld6PQj5ZJfihF1Ei6KS/ukET6c72/cXoH65gRZiXo1u7rgSJPm0nTmS+0ow8DpbI1EJhq+JAf7hGnc9lAivd9Mp3zg6ITjXvzA8Te2lgxgGcfDGd+nYf2AjU4yFfGC7sJc23UMDcr+CVh2cRSpgrvG5ZWypj8FR3rtP38JgrJ4eD2CVmxOc+8x53hGC/LK1rogG8Jr7DE5QFQNP1x46G1LH03eA7u00KqKq98GrDNTU3W96yZhDvnfdDPnJ67C6OuxywLiFB9oPxLJh5kp1CvAfwYV/tIuQKUZBGX3esP+LQau87PSdF0xpfNaZ/3iXWL4CS8=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQhHCQPKR03Qwtpa02gf4gx65Oaj4H+91XpMDxL21/GWlT07KibxLRtSCFd+XrYfx2Vw7zS4lEpXxilvPRWXCLZr+/KyO8vdcX9jB4+7rM+st0=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQh0EY5H0EUcI+6BSZxMwq5OBT1y9i39ozs+OwlFVAPyajk6Pm3ozeGos8SCyGghTmCSp8qMTXXbIvGma8OlpHh3g==</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQh7ttlhUMlhS8ZbCWqnzENQ5+qQmIggCxCdzJPZgTb2F5HpoC4IbAiqNM+oCMeQKe7usyhpqmMdDXvneqxxnJQW3ImeYzm/rWbidMuh+quZ1Q=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>xwNBm35eWryFADCIMjpiMb7HCwjQEZDoccba0Fe14BegXSK0gZU/vkC3Tsct+KbEWDRR5K2wjkIZG/DW/uOeo76qIat8diCMU8a0E8OnXMNtIvVTrsY4+UjoIguvqL/LAyIvTDaawHL/ox/8A/7xbaHTYgFLNjle6PY1xcxSkwxd8JNfjHh81EQX/c62dr2G</encrypted>]]>&LockedDate;<![CDATA[<encrypted>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</encrypted>]]>
      </text>
    </command>
	
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>86GeIvpP8uqde/6k1R4/OTt+PR2iqMTL7YZRk6X3JhqdbamhmKnmf8Rd04ZvdWm/dwSiRiWQnRUcesoyw/5H9+nUBa9R6KGz8ZVWK0QHRuihdjCNB7K+IiJ6Wk4SONf/J4XkQtYLnMLUEYVS+EphYG1cCFw6/X3ciaJK7wf8lcujdL4iH0TO1jkWEe5YGqkBNgfoNTRQxwft9WjiFLAefjQ73P/+XMaFQnAAqjSTbjzQYq7HSE75RH50oDee79JjJpLsPT9jjb0Q+go5d7DWYtamsC35qZorxx77SiTH9nBexhR+fhQz5TxM1lwcb8YN7+/x9QrdUNTbs5byzKZY9IQyLB2o6lMZUfWvyiSJdGjCbdt48EVRqES4SBJsLaJDlDZfzfMFRVihAVHLqO1OBdnX0CVyieE1KlbDTXgfn8Ei7S61wJe5JyGZ9qtdmTOtpOR5P13FN9UsppJAlh2gWVE4GYZxPvnl9G6T6c7s8/nRoO1hynmltX/raBQjAsVPZxvj5FXtz8Fr2cWfQTJQwbtGuDoZ6JVn1sBLyvvbnUwjpwVxe9Y6Q0ZxpRzMCKbXdCjQ3KSolS7DARnd2wS3QR6uYUHcJhcpU6n9E4bd4O0RgdpA07HGk4P2oPQQDhtH2wNhtsYhVx4WmMm6ezpliJSsUpFkZScwzjLlRkSpxqA=</encrypted>]]>
    </text>
  </script>

</dir>


