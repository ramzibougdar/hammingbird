{*
* 2007-2019 PrestaShop
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2018 PrestaShop SA
* @license   http://addons.prestashop.com/en/content/12-terms-and-conditions-of-use
* International Registered Trademark & Property of PrestaShop SA
*}
 <button onclick="call_linkedin()"
    class="pssocialconnectButton linkedin-button mini
    {if $socialconnect_params.PSSOCIALCONNECT_STYLE eq 1}outline{/if} 
    {if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 1}left{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_ALIGN eq 3}right{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 1}shadow{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 2}invert{/if}
    {if $socialconnect_params.PSSOCIALCONNECT_HOVERSTATE eq 3}fill{/if}
    ">
      <i class="fab fa-linkedin"></i>
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
      alert('logout linkedin : DONE');
    }
</script>