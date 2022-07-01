{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2018 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<script>

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
 FB.api('/me?fields=id,email,name', function(response) {
      var namesplit = response.name.split(" ");
      var firstname = namesplit[0];
      var lastname = namesplit[1];
      $.ajax({
            type: 'POST',
            url: pssocialconnect_frontController,
            data: {
                ajax: true,
                action: "Login",
                lastname: lastname,
                firstname: firstname,
                email: response.email,
                socialnetwork: 1
            },

            success: function(data) {
                location.reload();
            },
            error: function(err) {
                console.log(err);
                console.log(pssocialconnect_frontController);
            },
        });
    });
  }
function login() {
    FB.login(function(response) {
        if (response.authResponse) {
            // connected
        testAPI();
        } else {
            // cancelled
        }
    }, { scope: 'email' });
    }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : pssocialconnect_facebook_api_key,
      cookie     : true,  // enable cookies to allow the server to access
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.11' // use graph api version 2.11
    });
  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/fr_FR/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

</script>
<button class="btn pssocialconnectButton facebook-button
{if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}outline{/if} 
{if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 1}left{/if} 
{if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 3}right{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 1}shadow{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}invert{/if}
 {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}fill{/if}"
 href="#" onclick="login()"
 {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}
      onmouseover="document.getElementById('facebook_logo').src='{$baseUrl}modules/pssocialconnect/views/img/facebook_logo_reverted.svg'" onmouseout="document.getElementById('facebook_logo').src='{$baseUrl}modules/pssocialconnect/views/img/facebook_logo.svg'"
    {else if !$socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}
onmouseover="document.getElementById('facebook_logo').src='{$baseUrl}modules/pssocialconnect/views/img/facebook_logo.svg'" onmouseout="document.getElementById('facebook_logo').src='{$baseUrl}modules/pssocialconnect/views/img/facebook_logo_reverted.svg'"
    {else if !$socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}
onmouseover="document.getElementById('facebook_logo').src='{$baseUrl}modules/pssocialconnect/views/img/facebook_logo.svg'" onmouseout="document.getElementById('facebook_logo').src='{$baseUrl}modules/pssocialconnect/views/img/facebook_logo_reverted.svg'"
      
    {/if}>
  {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}
    <img id="facebook_logo" class="logo_image" src="{$baseUrl}modules/pssocialconnect/views/img/facebook_logo.svg">
    {else}
    <img id="facebook_logo" class="logo_image" src="{$baseUrl}modules/pssocialconnect/views/img/facebook_logo_reverted.svg">      
  {/if}
  <span class="pssocialconnect-label">
      {if isset($short_title) && $short_title ==1}
          {l s='Facebook' mod='pssocialconnect'}
      {else}
          {l s='Continue with Facebook' mod='pssocialconnect'}
      {/if}
  </span>
</button>
