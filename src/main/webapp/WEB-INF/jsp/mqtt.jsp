<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/26
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta name="viewport" content="width=device-width">
<title>MQTT Websocket Client</title>

<link rel="stylesheet" href="./MQTT Websocket Client_files/normalize.css">
<link rel="stylesheet" href="./MQTT Websocket Client_files/style.css">
<link rel="stylesheet" href="./MQTT Websocket Client_files/foundation.css">
<link rel="stylesheet" href="./MQTT Websocket Client_files/jquery.minicolors.css">
<link rel="stylesheet" href="./MQTT Websocket Client_files/jquery.fancybox.min.css">
<!-- Piwik -->
<script type="text/javascript" defer="" async="" src="./MQTT Websocket Client_files/piwik.js.下载"></script><script type="text/javascript">
    var _paq = _paq || [];
    _paq.push(["trackPageView"]);
    _paq.push(["enableLinkTracking"]);

    (function () {
        var u = (("https:" == document.location.protocol) ? "https" : "http") + "://piwik.baycix.de/";
        _paq.push(["setTrackerUrl", u + "piwik.php"]);
        _paq.push(["setSiteId", "5"]);
        var d = document, g = d.createElement("script"), s = d.getElementsByTagName("script")[0];
        g.type = "text/javascript";
        g.defer = true;
        g.async = true;
        g.src = u + "piwik.js";
        s.parentNode.insertBefore(g, s);
    })();
</script>
<!-- End Piwik Code -->
</head>
<body class="notconnected">

<div id="header">
  <div>
    <a href="https://www.hivemq.com/"><img id="headerlogo" src="MQTT%20Websocket%20Client_files/logo3.jpg"></a>
    <span id="headertitle">Websockets Client Showcase</span>
  </div>
</div>
<div id="content" class="row">
  <div id="connection" class="row large-12 columns">

    <div class="large-8 columns conniTop">
      <h3>Connection</h3>
    </div>

    <div class="large-1 columns conniStatus">
      <div id="connectionStatus"></div>
    </div>

    <div class="large-2 columns conniArrow">
      <a class="small bottom conniArrow" onclick="websocketclient.render.toggle(&#39;conni&#39;);">
        <div class="icon-arrow-chevron"></div>
      </a>
    </div>
    <div class="large-12 columns" id="conniMain">
      <div class="panel">
        <div class="row">
          <form class="custom">
            <div class="large-5 columns">
              <label>Host</label>
              <input id="urlInput" type="text" value="broker.mqttdashboard.com">
            </div>

            <div class="large-1 columns">
              <label>Port</label>
              <input id="portInput" type="text" value="8000">
            </div>

            <div class="large-4 columns">
              <label>ClientID</label>
              <input id="clientIdInput" type="text">
            </div>

            <div class="large-2 columns">
              <a id="connectButton" class="small button" onclick="websocketclient.connect();">Connect</a>
            </div>

            <div class="large-2 columns">
              <a id="disconnectButton" class="small button" onclick="websocketclient.disconnect();">Disconnect</a>
            </div>

            <div class="large-4 columns">
              <label>Username</label>
              <input id="userInput" type="text">
            </div>

            <div class="large-3 columns">
              <label>Password</label>
              <input id="pwInput" type="password">
            </div>

            <div class="large-2 columns">
              <label>Keep Alive</label>
              <input id="keepAliveInput" type="text" value="60">
            </div>

            <div class="large-1 columns">
              <label>SSL</label>
              <input id="sslInput" type="checkbox">
            </div>

            <div class="large-2 columns">
              <label>Clean Session</label>
              <input class="checky" id="cleanSessionInput" type="checkbox" checked="checked" disabled="disabled">
            </div>

            <div class="large-8 columns">
              <label>Last-Will Topic</label>
              <input id="lwTopicInput" type="text">
            </div>

            <div class="large-2 columns">
              <label>Last-Will QoS</label>
              <select id="lwQosInput">
                <option>0</option>
                <option>1</option>
                <option>2</option>
              </select>
            </div>

            <div class="large-2 columns">
              <label>Last-Will Retain</label>
              <input class="checky" id="LWRInput" type="checkbox">
            </div>

            <div class="large-12 columns">
              <label>Last-Will Messsage</label>
              <textarea id="LWMInput"></textarea>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="empty"></div>
  <div id="publish-sub" class="row large-12 columns">
    <div class="columns large-8">
      <div class="large-9 columns publishTop">
        <h3>Publish</h3>
      </div>

      <div class="large-3 columns publishArrow">
        <a class="small bottom publishArrow" onclick="websocketclient.render.toggle(&#39;publish&#39;);">
          <div class="icon-arrow-chevron"></div>
        </a>
      </div>

      <div class="large-12 columns" id="publishMain">

        <!-- Grid Example -->
        <div class="row panel" id="publishPanel">
          <div class="large-12 columns">
            <form class="custom">
              <div class="row">
                <div class="large-6 columns">
                  <label>Topic</label>
                  <input id="publishTopic" type="text" value="testtopic/1">
                </div>
                <div class="large-2 columns">
                  <label for="publishQoSInput">QoS</label>
                  <select id="publishQoSInput" class="small">
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                  </select>
                </div>
                <div class="large-2 columns">
                  <label>Retain</label>
                  <input id="publishRetain" type="checkbox">
                </div>
                <div class="large-2 columns">
                  <a class="small button" id="publishButton" onclick="websocketclient.publish($(&#39;#publishTopic&#39;).val(),$(&#39;#publishPayload&#39;).val(),parseInt($(&#39;#publishQoSInput&#39;).val(),10),$(&#39;#publishRetain&#39;).is(&#39;:checked&#39;))">Publish</a>
                </div>
              </div>
              <div class="row">
                <div class="large-12 columns">
                  <label>Message</label>
                  <textarea id="publishPayload"></textarea>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="empty"></div>
      <div class="large-9 columns messagesTop">
        <h3>Messages</h3>
      </div>

      <div class="large-3 columns messagesArrow">
        <a class="small bottom messagesArrow" onclick="websocketclient.render.toggle(&#39;messages&#39;);">
          <div class="icon-arrow-chevron"></div>
        </a>
      </div>

      <div class="large-12 columns" id="messagesMain">

        <!-- Grid Example -->
        <div class="row panel">
          <div class="large-12 columns">
            <form class="custom">
              <!--<div class="row">-->
              <!--<div class="large-10 columns">-->
              <!--<label>Filter</label>-->
              <!--<input id="filterString" type="text">-->
              <!--</div>-->

              <!--<div class="large-2 columns">-->
              <!--<a class="small button" id="filterButton"-->
              <!--onclick="websocketclient.filter($('#filterString').val())">Filter</a>-->
              <!--</div>-->
              <!--</div>-->

            </form>
            <div class="row">
              <ul id="messEdit" class="disc">

              </ul>
            </div>
          </div>
        </div>

      </div>
    </div>

    <div class="columns large-4">

      <div class="large-8 columns subTop">
        <h3>Subscriptions</h3>
      </div>

      <div class="large-3 columns subArrow">
        <a class="small bottom subArrow" onclick="websocketclient.render.toggle(&#39;sub&#39;);">
          <div class="icon-arrow-chevron"></div>
        </a>
      </div>
      <div class="large-12 columns" id="subMain">
        <div class="row panel">
          <div class="large-12 columns">

            <a id="addSubButton" href="http://www.hivemq.com/demos/websocket-client/#data" class="small button addSubButton">Add New Topic Subscription</a>

            <div style="display:none">
              <div id="data">
                <form class="custom">
                  <div class="row large-12 columns">
                    <div class="large-4 columns">
                      <label>Color</label>
                      <input class="color" id="colorChooser" type="hidden">
                    </div>
                    <div class="large-5 columns">
                      <label for="QoSInput">QoS</label>
                      <select id="QoSInput" class="small">
                        <option>2</option>
                        <option>1</option>
                        <option>0</option>
                      </select>
                    </div>
                    <div class="large-3 columns">
                      <a class="small button" id="subscribeButton" onclick="if(websocketclient.subscribe($(&#39;#subscribeTopic&#39;).val(),parseInt($(&#39;#QoSInput&#39;).val()),$(&#39;#colorChooser&#39;).val().substring(1))){$.fancybox.close();}">Subscribe</a>
                    </div>
                  </div>
                  <div class="row large-12 columns">
                    <div class="large-12 columns">
                      <label>Topic</label>
                      <input id="subscribeTopic" type="text" value="testtopic/#">
                    </div>
                  </div>
                </form>
              </div>
            </div>

            <ul id="innerEdit" class="disc">

            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src="./MQTT Websocket Client_files/lodash.min.js.下载"></script>
<script src="./MQTT Websocket Client_files/jquery.fancybox.min.js.下载"></script>

<script src="./MQTT Websocket Client_files/foundation.min.js.下载"></script>
<script src="./MQTT Websocket Client_files/foundation.forms.min.js.下载"></script>
<script src="./MQTT Websocket Client_files/modernizr.min.js.下载"></script>
<script src="./MQTT Websocket Client_files/moment.min.js.下载"></script>
<script src="./MQTT Websocket Client_files/jquery.minicolors.min.js.下载"></script>
<script src="./MQTT Websocket Client_files/mqttws31.js.下载"></script>
<script src="./MQTT Websocket Client_files/encoder.js.下载"></script>
<script src="./MQTT Websocket Client_files/app.js.下载"></script>

<script>

    function randomString(length) {
        var text = "";
        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        for (var i = 0; i < length; i++)
            text += possible.charAt(Math.floor(Math.random() * possible.length));
        return text;
    }

    $(document).foundation();
    $(document).ready(function () {

        $('#clientIdInput').val('clientId-' + randomString(10));

        $('#colorChooser').minicolors();

        $("#addSubButton").fancybox({
            'afterShow': function () {
                var rndColor = websocketclient.getRandomColor();
                $("#colorChooser").minicolors('value', rndColor);
            }
        });

        websocketclient.render.toggle('publish');
        websocketclient.render.toggle('messages');
        websocketclient.render.toggle('sub');
    });
</script>
</body>
</html>
