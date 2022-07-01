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
{* <script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-client_id" content="541001303936-qmle9nua41oifcj7aqa7vp5elui64r24.apps.googleusercontent.com">

<div class="g-signin2" data-onsuccess="onSignIn"></div>

<a href="#" onclick="signOut();">Sign out google</a>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>


<script type="text/javascript">
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
  console.log('Given name: ' + profile.getGivenName());
  console.log('Family name: ' + profile.getFamilyName());
}
</script> *}
  <script src="https://apis.google.com/js/api:client.js"></script>
  <script>
  var googleUser = {};
  var startApp = function() {
    gapi.load('auth2', function(){
      // Retrieve the singleton for the GoogleAuth library and set up the client.
      auth2 = gapi.auth2.init({
        client_id: pssocialconnect_google_api_key+'.apps.googleusercontent.com',
        cookiepolicy: 'single_host_origin',
        // Request scopes in addition to 'profile' and 'email'
        //scope: 'additional_scope'
      });
      attachSignin(document.getElementById('pssocialconnect_google_button'));
    });
  };

  function attachSignin(element) {
    auth2.attachClickHandler(element, {},
        function(googleUser) {
          var profile = googleUser.getBasicProfile();
          $.ajax({
            type: 'POST',
            url: pssocialconnect_frontController,
            data: {
                ajax: true,
                action: "Login",
                lastname: profile.getFamilyName(),
                firstname: profile.getGivenName(),
                email: profile.getEmail(),
                socialnetwork: 2
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
  </script>
  <!-- In the callback, you would hide the gSignInWrapper element on a
  successful sign in -->
    <button id="pssocialconnect_google_button"
    class="btn pssocialconnectButton google-button
    {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}outline{/if} 
    {if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 1}left{/if} 
    {if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 3}right{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 1}shadow{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}invert{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}fill{/if}
    " {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}
      onmouseover="document.getElementById('google_logo').src='{$baseUrl}modules/pssocialconnect/views/img/google_logo_reverted.svg'" onmouseout="document.getElementById('google_logo').src='{$baseUrl}modules/pssocialconnect/views/img/google_logo.svg'"
    {else if !$socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}
onmouseover="document.getElementById('google_logo').src='{$baseUrl}modules/pssocialconnect/views/img/google_logo.svg'" onmouseout="document.getElementById('google_logo').src='{$baseUrl}modules/pssocialconnect/views/img/google_logo_reverted.svg'"
    {else if !$socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}
onmouseover="document.getElementById('google_logo').src='{$baseUrl}modules/pssocialconnect/views/img/google_logo.svg'" onmouseout="document.getElementById('google_logo').src='{$baseUrl}modules/pssocialconnect/views/img/google_logo_reverted.svg'"
      
    {/if}>
  {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}
    <img id="google_logo" class="logo_image" src="{$baseUrl}modules/pssocialconnect/views/img/google_logo.svg">
    {else}
    <img id="google_logo" class="logo_image" src="{$baseUrl}modules/pssocialconnect/views/img/google_logo_reverted.svg">      
  {/if}
    <span class="pssocialconnect-label">
            {if isset($short_title) && $short_title == 1}
                {l s='Google' mod='pssocialconnect'}
            {else}
                {l s='Continue with Google' mod='pssocialconnect'}
            {/if}</span>
    </button>
  <script>startApp();</script>
  {* <a href="#" onclick="signOut();">Sign out google</a> *}
  <script>
    function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function () {
        console.log('User signed out.');
      });
    }
  </script>