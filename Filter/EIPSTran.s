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
]>
<dir table="ct60" code="stt_rec" order="stt_rec" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Phiếu xuất trả lại nhà cung cấp" e="Return to Supplier"></title>
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
      <items style="Grid" controller="EIPSDetail" row="1">
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
        <![CDATA[<encrypted>ePAqLj5t82gqWqCOkZ/FpSyOR5O/+RpSqThIG7rqx7l7bE45PLOzaYRDRZf8gpt73PIvXDxxOiepg23n4hQbqtwyIdN6cxeU+Q03NfJuAE+TyIx0xKv3cH9loyGIJeT/c+dApr/TWL2DP3te+wEdfroHgrLiHgf2Henzpf4+MDg49QZ23sszNsiJUTXDYPtXJvP0cANTXE+4Cac//sQ58MIwipIWIA2p9BHC2dGXAsgnNnJRGG8mxMXI5fIdF7hdITRs1RJM9G5cIF76xcz4iEcRws6b/cglzibBLioPa644eHLim+vdzBKReeuYYZY/2OzRU8AklRK+CNf6BEG2kP2Xspv7IYpMo2ICt3fEpNR4UXxn7wZ8gfT4CCbt6QMBodw/RybGKw+TMF+nMlFe61uzAoRrDmch96Awh+/5bBzbuzv505ylnaHxwliPq4suo6B908+rHqkmZTQmfc5os1+o3YWTzv2g9NKmQvrD4LWpLtwCWTgpaGsVS5kjIzkMlFP8Vokx5Noyil3ujAvKU/MAkwn0//qlGFk18W+5Ubio5iu7Rv5GGHmTAHoyhndNo8bIv5fGojmPBQocV4TVRvCx7xkTvp3TIcRF9v3i+XhpfTl7njadOsiN3Tx6HPWSiCy2TXmZaOxO4vqF5raUnT3hdKhv5cfsLVmLsWVoDGkm8oTwSI2KHmV3SaKB3SnBgBlDaOKYzAggjf1OYuzIiOb+rTKYEcS7rGmziBevV/pNPIFEBxLCIeD8qejJtgQHD1OGwOfkk4JBQH83lPA5zHgzkk6CAxW/3ta6l/yVH9NmerCNI5xBa/bhj1az/cXH8FsD9wC6+U3THPBNZ+TZK4ATQWQwWpumrjbjnjGCSw9r809bcbBwMSjKqLkCLPMzjIo0T/8FfA98BoZ8xEnJ9FeeCziFfPHYeLIc3TbN+C8XjAPrOILqgdY6oZSHuHEqDEwgZB/WgKW8K4q0ldJi5ggTQQhtpeLI25EQ414GM4P41q1NnzJamDXsWqeD7KAsilbOFcnTVIVEd2rKG2Oa9aP5aV+UG9kk3v011AglGdvhMJroZn13kjftIHOHZGQS3F6FylJmQaUP2CmAJK0NZbwqe3rFmVl57VePbR8NJZGvGlAmKk1U66wS2uw1RYRgxr8BlrrXhfQXwRqDF2cKppcqj36F9ALQYbLaLkZFLlIu4aAVr35yCNjYzFhusiTXYhVswElZg2pQoVBmBwHrOixjyg4hWXoS5Y4/rocbRUGxCPH2ZIS/ofJD/f9Epa+t1XgpB4e5KOfDU9lVvj6b7WipZUO9gfsgMgz/7yKqDCY7CfKQFtZA8fK73e2lyFNE4uD+Oke7hYLR4QRXUL6zNQiq0tQ0XQ1YLH7wRHS4y+ZetXhwbJ6svyoTv8NpJ+jl9fP2ChU5e2Ai72sSYlULrlQ6AONsjNZGUPxIgPomfxoUt1zLTF8AjqQP2GVCaAIF8pT+d/axv9fvEVYpYFbQu1UmKXry9BClB4uwnlDzwl1VtABnON6LK5KeWheTBsJrujBmp7hpB/5N+zg6UlGMWaiWMaTU8ktujYUEg+/fsw8=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQhHCQPKR03Qwtpa02gf4gx65Oaj4H+91XpMDxL21/GWlT07KibxLRtSCFd+XrYfx2Vw7zS4lEpXxilvPRWXCLZr+/KyO8vdcX9jB4+7rM+st0=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQhHBCPzXeOtidO7uBS0rKdQ44//VtS+Bj3V+Xr71LpGD4GXteOmAAT4wrK5s4gWJmjAk8FYyuIIKeDSydumUeO6r/v2YvI3XvUhJ+08hMHcKk=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQh7ttlhUMlhS8ZbCWqnzENQ5+qQmIggCxCdzJPZgTb2F5HpoC4IbAiqNM+oCMeQKe7usyhpqmMdDXvneqxxnJQW3ImeYzm/rWbidMuh+quZ1Q=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>xwNBm35eWryFADCIMjpiMb7HCwjQEZDoccba0Fe14BegXSK0gZU/vkC3Tsct+KbEWDRR5K2wjkIZG/DW/uOeo76qIat8diCMU8a0E8OnXMNtIvVTrsY4+UjoIguvqL/LAyIvTDaawHL/ox/8A/7xbaHTYgFLNjle6PY1xcxSkwxd8JNfjHh81EQX/c62dr2G</encrypted>]]>&LockedDate;<![CDATA[<encrypted>wR0DpyVwwuLMxwEaL/NfA0Cd/9UwsK0QPS2cARawSl5tJ3oi9UONdshNozl2Nu0asrhoxaS2kyJkGqets4m76fnKT81AiaJQGWGMl007I75Lr3MwDqEhhMA8V1mndgib8y65LuA8vyaYqWAs24B5g057GJDA2VlSfCvTrFEx7aVQGiE7oSgvCm8UHyHtlLQj0K83DShqVS3hkQ0GARC++PkdVygk4j7PGyKb6A4l2HVnsUij6ofbuhe3qT5TxuVL2xENRZTXlqCbJj+1/T1qG3AGXW8t8TD9QWbpdnAitLueXI4yhiqfgIQfmWuWMi0mGaqhXUpbbcVcv9aA/7nLrgiRyYD8OFqPv2vajDmbK5HI7h8FD5OPpDtU/zHG7jz33lmYwlpJjqOUlaXo9HtLpbqHidp27W/7HmRRYcs1djulI3T5UdcT5GGpli45EWzhlz7P8s+Ejm6LwZbidvEkNLON/rZ5MSlsqEDT9wGeH5GRirw7eIyJFQDJqU1uIGzV3IcsRKTNIbR7kysly8YpA2F75jTWdOqwLxwyTkJNtGINpJKt10tFcHdIP96KwT9ZoAjpJQHJbNG9PHHlLrizu/wht7wH+95f7nL7rTervxmW3D236k+SsfgLmFfcElUsTOZp1POErs/2q0XbVSeUc8viPfvZx1VxeXf/xinTfNOacSF0uHUtv2vDcC91H+Lz77GYqOohVUcPD9EVQiudxnnLPRzs76iSFiwGYOtGNuzhDm0Y/bIz6P5oYwfilHEiPaKbmav7QLckn2faTqTTFDywojoSch8YXNN5HpA2LQqrhQvNrbe8MtCBpkNGCnuPP0TOfDVOJr7X9YEI+DrPR5x//c7tSlFvDABpJmhcbgzjkVTTLsSUylSEke2EYd2gNzz2IjccghVfWw0QgQVCIqy8MTYyJ0mDTRKCiHp1y1pf8FNqVrfGINetWEILHI3tT+Jzvt6LWWpLGfzfKciH2M2aZesr5kxWAHSQv4T9tZ9YHHojMgrUBhRFLQxJZEBw92u/E0BSG5PoLq7KiUKHdlty/u/PWnHUfMHhvdteT8Lf2INW48BIlvX6ez2WRWloc/k0JnJG0zQQxq1TANcwPAJIwIgoanRsLlMbRBOp6fUM1FIPmnTszynr8wNz5sxmrbTZIUDpiVbwX5Y+MuK8zyRBb5GxcT6PxoZR3gXsRgG66PWR2Z9llc7yzBgDqQVXV9ko9HxFicAK5ch9TlYsB7dsrnMUbIpF5OhN04T19EX87v/2QNfcThePAjCNOZ5oZJtAr0erPQpSZX/FoDKGS40ipqEBnniw8I46UTMNreNOrFJ5Bxw8kjK3FcO0Im6G+gwI1yPeXeEbsSfA+Yov4gMe76j+gWmXNpeEzqHDf/2bHZoLrbCOWz+9UOX+C1jXymWmkAlBmrH0vnyiP4TM5wDSeuXRdC4gInUyw3zweXTIs37XAndC4IO4oqwDbptnzPoc26zS1GQquEqowAzzupx52zNhCSEuFjEahBOi/HDilzaCRJsExPVQcENqc8iEPJQNRLjnOfijPZ23rm6dzdjN5K7oS31oVXU1DxUtfIqy+m0zATdVVci5QdP+VrwE+pngvT5pjswzq/xQaabeuH5ubL0ccLq5TUAagvjgrdgkHcY3ZU5ErsLg+KDk3bHHDSQ12ga7cGjnbA1zJtizxZLqxJ6SOIKnpImwZSXE2rf0iyl3VH/r219at7VqkGhGSQht5F5N1N1l90X2656aQSG/81u5pNQ2dlS8yiP/6qOoM08Zi0OQqIAumTgAPXFogBbBffvIk9TPN1IIAiU3Ge4VHeJk5+89Lk6DPtXuPaKIRk635msK9nLceMn/oXHEV4okPQqp/AStdgcARCWlqZqVMa1tCIycmlmJgSKAOPHJNY+ehc6O5ANnkskVsk5cHJZKdAe176cvxrn+ZKK+dMOwn+pfVPBRMyMuyGjesuKS4yz/3Dhd6kVYjQrBQ6fb1z1cShg4Kp39Oce1IIWnuzkYIEo+VjsAHpENCSn5694x4FfHbArioF6Cc0eSBE4xcCimz2MExutTtzKud3SHOsmd+dGjsTzIzZvH88NCDqu7Tor3jWU4zKnBZizOeKW21GxCAl8pknAtIMMjJDCxtiMBBcE65CU6P2beDl9OPEjWSXifnsasDlieFWE0wbjMv3rjeSXgyIMhegZUkEgQLqtky5xbMy5k5RJYMSn/stmtJXJMfh2nK3rebTLTyC3II4uNgNhE/eXvungAhSdb7/4DrXeSJ9l+m2sSqgOYDEg2Gh+u7wd8Gp1dDkkov4YaNralIAzyHYpxIgK2/G/Kiv06cm9KZy749gfsXXtUCTXSXOw8seusZKFHsu3payQGa3JI/Mxm6TjOkWNjsZLQDi75ue3YEVfPjtXcgADe5uBzfm3v5wqBB4v6eyuzXl/AX4egMRN1VkwVDSddC3pzfcEwy+LVDUEp7XQC6PO0kv/YYo7Vk2wUieY7glDTo68SiLGMyo/jf1Iv74+FicUZqavNgF+Px7vu+IOz/zRuDQtQ9dPmhQTDzIJgkl826OoRQLmhFVe8hmT5zO754JNcgOtzd8owIYD7xuKapWyUY2dkgGvTDZVqbFP9gAqCdlx0fYM7aqc0/K94w+MU3A56pcMSub8wgsb6OyDaWJucyiagVouaEG0hlHztKDKAoaj6/vz2uPfkUP94VjRnTIlVt0Xcnpx+pveoKjmP7jvl8GvabiWxpLx1oGzLY6bCOETSKq07uIk/iVhBy2xqhIYPPMxApdARpEz70frili+OvAUknx0lpS/p4Trcg1jnR3WoA/XshUrXheX6WVamMrj0b2c7MSN/J3yDyipe927PsUeZxmH96fsgs9ONUuq9kuFnbdJo/9PWp7jKFwnwLqd5LwXsio+H705oGljQNvbBzgUqkBceFcuiqHUVb+0TEAk469Fo+YzZCFktKQYf9IPEf/UGwK6hdEkk+QSi5JPJh3TAfqKVA0ku8UMNQoL2UT6laUbUSIEecHKDdOQOM3mmSL+Nxrig0GqMvVrprsd6TGCrm3ZNyOXh0Og4DWdBrbOfYcVBeajOlzM1h4i/tNk7qsXBONRkA5oPkNzBAIIVuEjLbj9TmTJvXGzKvxYwrXYzwBBWi7IeoMwCnc+vPE0xtyzVCFCNJiFoVZXrnEoRQHWRdgQUASDbqDQFRRPUsmfm7w2CS674Y/cYVXjiLaHrfye1FpikivKKN3Iz8kM5/lN0JPOrTTpQiR4gfufEBnWxhCc/GdFoZztnla38c4auaCRMx3lDFghGr84LDU+IOKAWCOrmFxtn/JHo+UefCggiWioOCvwD8RQ4hKs3fFmJSw9FqtldjpGoVQ0311L2kxWvdjZ/3S57GmFvoi8y5x6gN9Yj47n0Q9xf4eBpvMJOM+6c8e1eUMe4PJJ8pnjKB8HS4epg2+7G7ucspLD5srshXkZCqj4S6vdTBSWRf4a3GvUZAQxkpG1RqCO1Cttox0Zpln4VhtNE3azLzIvmhRGKC8JoIyMLzFi0dy8ajmyMEiTp9tSXG134SaMFEhnIiiS6xy77cB7Az91F/HImhDHc0f1oIwPv6ZIM9ODH2pytSaB/HiHzhlyZMRIV/Gdby5ufapVqROX/jUqzAAx/q19SvSdFa2GCOqmktTJX9/wZfyKla77mQ35MQB60Cs0Txb4DUxVWqyUdt+yUgswwfwvB0We9VdfaGrA8dkd8WwLu+TXmlWwSuQULvkKwEVL3Rj3ualMEK16tGGtO/s7ojTqwz1XgCSGOSj5j7hIpoSgKBo2VAJLSTtg93s0SYpZrEqPeyUej8wr4phO1h4eM7Op5ru5nYDOnugnCWnXrTn6dY9E62llvrg5tNtVuYRvx8wxUqxF0NnvoCVx8vCS6rxvoD2kBnpgUZjb9sw4O3brLtJoGuV171WJ0qvfLqRR+j3OW2QDJVKsCsXSyMTjqr89nsVhCA/Po6LVFQWnF1xQbPGOgctI2MwPCetfq01HFCxrhmOLfkWwuZY/2xQBHd9xF2GlgarUtkbQU5wxqCTZClOlj5TaIjK8pXizpnE16G6kYFn1SveQob961UrKAWymX8Kv1F4zNDTBj3W8t69XenWUU2H4a1WOCdCFLMq1orSjlmWnwNzPIQ433R8vDjjbQk5VNIOcC0R1BudQPfVDpr/bLXhpoxkD072ToDifkAZeYLX9ZGONXjkQhWOsvIWLzEU3B8b+mDuJAM/ndqz2c0LccwpX3WC85tkNAbwDv2dOBSWlFJ/tqSmUVVj95wrviasOXNyiZLWBjZ2YhyB58EYBiKw5QtzOh1phIk9mSYNyqFG29/TLAmyUEm1YcTBk00vZmDCyX1jiu+kA+F2/THQoGqGUlT1KzEByMhGMJtxMlMxAqGuE668LbOUXb+8hk/3KfQmnGEdArxBBtvYxn0TktFlqnWHeHJVDgEHNw8y26Lh6fl+4w6AXmdREJd4RtB85V+ivNLUEsiOLGNYs6fCHwze9ubusu+sfMJcuLJD7DAKXeKJpCVcR35U9ytUyF28Thpw5fd6NnqbOKZRM5D2eEOsBGWrX5HHZQhLjdbPBMIqtEohvukVb5GPPnTnkLMwFIdA5Ie/pqlosJoPdDpui1Bz2BKrJwyyhALULypfmIe68DvhGHh1d/y922DQAlc4qG3XSKLz0fiZ41ha7mmTTDZXF59KW+rWpY5b08W4WrTaD+hgOUbhM89/I0uEyxwzFLjI60XW7hiurQ5274VhG2wxwhcqjxeEOoGIHdLPt8rXrTGdkuaRiNxDzfXONJf0kdMDDw//91Y1PPkk0UqXpXIVWkvteWukS+kJMuDFgukw2TknWQ6v/Z0MqC048jGi+mTzrbD9rVEX06NOtiLYn8+E4qMKbRbfi2NvxGOBe/WqOJzOKPFABp93o9sgyjtpIlVKyxEC+Ptnk6FXnWsN6I4CXD7FnFCBFkNyUVZpFdrw6uU+T4CJAkcFvsJ7VWmueckvJc7XDr0K0maUrW8BZ/TtFAH8gpfou5LO4R4ysa7NUpnFno8jiwD5yyo2qy9aEd2OWoeZh0Ec5NsKAyMh91h/r6MikAofXO++FVnB2lNnJ/qJDaJ8V6y65WH5Ya7sljrqj5/o+Ec/bQIQIs8ZGNFLcrhvRYb/gWAZ0eXlrY+ABt6nCZKEgRg+qu0/OaAVRAuM9HAU+/INwCt6UqCJZZkwAyqnO+EO6xTDgiTm4FCIeq7ZrRE/4qJYcHWDbjoGP/gxuePF8+AzPTTulTR9582caDysMm2acIxSr7XyIRD1+i2ayvNDvjf+M8n8dKFGR0yWWm1Xr6AEBo9khrX4saydAtxd9EBiKfDbdQZ5SXgrnMar3sdYRPd18DGncMsy/PI+8/efgZxLFnyuxlJCVoS1HTxBtye9BGZF+bLeUV78hv74mVai47aL/8hIJywuQHXG+rjm9NzetREoviRm0JZCWdv6dws005JFAt3Mqeyoca8XctvtCkseUrllyeVG4qFyBfhW8FgDpLYcOUD+lRdmKL7ESlvGbE46NTIhERj8uURAvyLCJENr4XiGTkzjC8mA0q0lljTj85Iw/Qenq1utxuVie/5xZdXLvNn+rz18TAsyMdnshWtv3sKLXiFgoEI+T8pXj5t9DwAENDU1JkqlV97dcdX60pg8z4t3c3CSercl7BsMwmIIBosWVWKDbptX7R4EU8iDLcNZvTl9LVOkqMz4YWyCc0FQ3P3rHLPvil1VeyngribCUd4HcDBoIHLgjKimMUuUkn+dgHUyJ6S31z5YM8L9UblOly+uk53NbykjT6tZ1vVGWpf885UVdC/pCpu08t+tZToaDor6CPl7gYN5ZZHwTuVI9mvrG0jL8mljS8p/R/QBYk+XUHCqoZAj2P3WwJnRx0WA901Ev9fBHsNNFbLonT9AQKhbHMXe2/chvGyjNOTkvoyNtEeTpL68oU2Fi+p3/SE3mRjhCQsrsCG9X59noZ/gkIF7JvacJU5Snun7Ijhjhdtvh2KzcdAKeqzz2JuDrTexK0qbNzICfo+ADrrg50WpJqfOtvRDQINSQrg2WaHcTTVi9p6p5ula+NGsQixNg36XvCr226NO1I0UXjvFiO+a4pi0RuSub6/CmYHF+21qyfeeTbXjt4vAUATSYEbSsJQGvXnffWW2SzLkggY+XGYq1OCb4u75/TYFvuLn6BCCaoMa483vsCwhaiN+CWhgWrZ52/mAJs9Tmr1UODBeNXUwrO+q69vHl2vi9S8ynhHVwnsbiKlsEhzfJO3tKfbDtp3onzewp1mamjhi25mUD3WRjYJOv7BBZAqIU8PjDKkZsV3JrC</encrypted>]]>
      </text>
    </command>
	
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>86GeIvpP8uqde/6k1R4/OTt+PR2iqMTL7YZRk6X3JhqdbamhmKnmf8Rd04ZvdWm/dwSiRiWQnRUcesoyw/5H9+nUBa9R6KGz8ZVWK0QHRuihdjCNB7K+IiJ6Wk4SONf/J4XkQtYLnMLUEYVS+EphYG1cCFw6/X3ciaJK7wf8lcujdL4iH0TO1jkWEe5YGqkBNgfoNTRQxwft9WjiFLAefjQ73P/+XMaFQnAAqjSTbjzQYq7HSE75RH50oDee79JjJpLsPT9jjb0Q+go5d7DWYtamsC35qZorxx77SiTH9nBexhR+fhQz5TxM1lwcb8YN7+/x9QrdUNTbs5byzKZY9IQyLB2o6lMZUfWvyiSJdGjCbdt48EVRqES4SBJsLaJDlDZfzfMFRVihAVHLqO1OBdnX0CVyieE1KlbDTXgfn8Ei7S61wJe5JyGZ9qtdmTOtpOR5P13FN9UsppJAlh2gWVE4GYZxPvnl9G6T6c7s8/nRoO1hynmltX/raBQjAsVPZxvj5FXtz8Fr2cWfQTJQwbtGuDoZ6JVn1sBLyvvbnUwjpwVxe9Y6Q0ZxpRzMCKbXdCjQ3KSolS7DARnd2wS3QR6uYUHcJhcpU6n9E4bd4O0RgdpA07HGk4P2oPQQDhtH2wNhtsYhVx4WmMm6ezpliJSsUpFkZScwzjLlRkSpxqA=</encrypted>]]>
    </text>
  </script>

</dir>


