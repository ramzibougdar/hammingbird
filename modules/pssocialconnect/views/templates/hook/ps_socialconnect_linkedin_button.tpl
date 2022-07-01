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
 <button onclick="call_linkedin()"
    class="pssocialconnectButton linkedin-button 
    {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}outline{/if} 
    {if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 1}left{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 3}right{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 1}shadow{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}invert{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}fill{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_FACEBOOK_SWITCH && $socialconnect_params.PSSOCIALCONNECT_GOOGLE_SWITCH
    || $socialconnect_params.PSSOCIALCONNECT_FACEBOOK_SWITCH && $socialconnect_params.PSSOCIALCONNECT_AMAZON_SWITCH 
    || $socialconnect_params.PSSOCIALCONNECT_FACEBOOK_SWITCH && $socialconnect_params.PSSOCIALCONNECT_PAYPAL_SWITCH 
    || $socialconnect_params.PSSOCIALCONNECT_GOOGLE_SWITCH && $socialconnect_params.PSSOCIALCONNECT_AMAZON_SWITCH 
    || $socialconnect_params.PSSOCIALCONNECT_GOOGLE_SWITCH && $socialconnect_params.PSSOCIALCONNECT_PAYPAL_SWITCH 
    || $socialconnect_params.PSSOCIALCONNECT_AMAZON_SWITCH && $socialconnect_params.PSSOCIALCONNECT_PAYPAL_SWITCH eq 1}mini{/if}
    "
    {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}
      onmouseover="document.getElementById('linkedin_logo').src='{$baseUrl}modules/pssocialconnect/views/img/linkedin_logo_reverted.svg'" onmouseout="document.getElementById('linkedin_logo').src='{$baseUrl}modules/pssocialconnect/views/img/linkedin_logo.svg'"
    {else if !$socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}
onmouseover="document.getElementById('linkedin_logo').src='{$baseUrl}modules/pssocialconnect/views/img/linkedin_logo.svg'" onmouseout="document.getElementById('linkedin_logo').src='{$baseUrl}modules/pssocialconnect/views/img/linkedin_logo_reverted.svg'"
    {else if !$socialconnect_params.PSSOCIALCONNECT_STYLE eq 1 && $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}
onmouseover="document.getElementById('linkedin_logo').src='{$baseUrl}modules/pssocialconnect/views/img/linkedin_logo.svg'" onmouseout="document.getElementById('linkedin_logo').src='{$baseUrl}modules/pssocialconnect/views/img/linkedin_logo_reverted.svg'"
      
    {/if}>
  {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}
    <img id="linkedin_logo" class="logo_image" src="{$baseUrl}modules/pssocialconnect/views/img/linkedin_logo.svg">
    {else}
    <img id="linkedin_logo" class="logo_image" src="{$baseUrl}modules/pssocialconnect/views/img/linkedin_logo_reverted.svg">      
  {/if}
      <span class="pssocialconnect-label">{l s='Continue with LinkedIn' mod='pssocialconnect'}</span>
</button>
{* <button type="button" onclick="logOut()" name="button">LOGOUT LinkedIn</button> *}
{literal}
<script type="text/javascript" src="//platform.linkedin.com/in.js">
    api_key: {/literal}{$socialconnect_params.PSSOCIALCONNECT_LINKEDIN_API_KEY|escape:'htmlall':'UTF-8'}{literal}
    authorize: true
</script>
{/literal}

<script type="text/javascript">
    function call_linkedin() {

        if(IN.User.authorize())
        {
            getProfileData();
        }
        else
        {
            IN.Event.on(IN, "auth", getProfileData);
        }
    }
    // Handle the successful return from the API call
    function onSuccess(data) {
        $.ajax({
        type: 'POST',
        url: pssocialconnect_frontController,
        data: {
            ajax: true,
            action: "Login",
            lastname: data.lastName,
            firstname: data.firstName,
            email: data.emailAddress,
            socialnetwork: 5
        },

        success: function(data) {
            location.reload();
        },
        error: function(err) {
            console.log(err);
            console.log(pssocialconnect_frontController);
        },
    });

    }
    // Handle an error response from the API call
    function onError(error) {
        console.log(error);
    }
    // Use the API call wrapper to request the member's basic profile data
    function getProfileData() {
        IN.API.Raw("/people/~:(id,first-name,last-name,email-address)").result(onSuccess).error(onError);
    }
    function logOut() {
      IN.User.logout();
    }
</script>