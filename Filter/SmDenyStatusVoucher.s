<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vsysStatusRight2" code="user_id, ma_ct, status_id" order="name, ma_ct, status_id" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc chứng từ" e="Voucher Filter"></title>
  <fields>
    <field name="ma_ct" allowNulls="false">
      <header v="Danh sách chứng từ" e="Voucher List"></header>
      <items style="Lookup" controller="Voucher" key="wedition &lt;&gt; '9' and voucher_yn = 1 and status = '1'" check="wedition &lt;&gt; '9' and voucher_yn = 1"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 300"/>
      <item value="11: [ma_ct].Label, [ma_ct]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>38MExpQlvyG0hg38+nv4xHhGbVA/pb1x+sEMoUtLaayFKJf+hVNLHMNhWoNqA5QGCICH/Dcg7459SQGAVW9HTxPpfoDmR9EKfeIa1v8V4Xezui+5kvfIY430icLT7Tk+vuC35eU/LA/ay0fZ8+vR2qwhxmPSodtsQsGiiE7YUDPBcSFv9fqL8W/snW0NirnDWQp8auWdxzZI54I+9rxUm2CZnHPC77tbO45bhSbSvujfEtFUeCgPx79lozl1+EM8lJqwyQ6Wk1XZ+jiAaxNWX4zdUl2PwKfORbnYtu1EZAUi9koXRzEzVUZiT9fwIakm</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>YFvOeNE+rpCDUMS8a/IxiRVIzQD+whwJtbJKngJLq+jjmAHT/sjPO1JR3xZX9QZKxUmA6ASYQ7Ak+sq7IebcgES3Z9Rz87RJcLsJkgy/ZyzD9doj4NXNZKX4GWQI0sttzLiZgLcNDkI1Otn76EC6xLri4KlZRXM7dc199cF3jBZT2hZV3kw1QZn0FPL/QtEUTltTjNlUb8+HVkukvDJ4bTLdUvTlDrU57xt/UryMowP/2SXlurTjeyNHvfUQA2GztaYkBnnMC6upqSB6+5VSPsY4h7j3ZqoHeRvlWYVJNLJ713LPvr+viWZzK9nOeXzy1KtTBCOeF0NTXhhouNndvzKvWQisW6QE+PjF+m470IxLlwdmy5aT9dlJuyGIr9jLj+JuGIRczZo6py9c7l7eAwJj0PZBq9MFtoK7DM4O+/puJ903b/Vh7d20yobMkfafZcxE9FYCEYSpf2ODTqUnUUlcaWT1SENYNV3xdiXlezvQ26cqyyzXsre+r9zOdg2LcCutdEBl7KFWk910xe7veZm5qa8Hp+D+MPKTE6u6jlAB3kNlr+G2uW6t/NQVn40WtixCn5e0pxxgj3Ljq7QrQg==</encrypted>]]>
    </text>
  </script>

</dir>
