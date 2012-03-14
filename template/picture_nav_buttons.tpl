{if $DISPLAY_NAV_BUTTONS}
<div class="navButtons">
{if isset($U_SLIDESHOW_STOP)}
  <a href="{$U_SLIDESHOW_STOP}" title="{'stop the slideshow'|@translate}">{'Stop'|@translate}</a>
{/if}
{if isset($slideshow.U_START_PLAY)}
  <a href="{$slideshow.U_START_PLAY}" title="{'Play of slideshow'|@translate}">Play</a>
{/if}
{if isset($slideshow)}
  {if isset($slideshow.U_STOP_PLAY)}
    <a href="{$slideshow.U_STOP_PLAY}" title="{'Pause of slideshow'|@translate}">Pause</a>
  {/if}
  {if isset($slideshow.U_DEC_PERIOD)}
    <a href="{$slideshow.U_DEC_PERIOD}" title="{'Accelerate diaporama speed'|@translate}">&nbsp;+&nbsp;</a>
  {/if}
  {if isset($slideshow.U_INC_PERIOD)}
    <a href="{$slideshow.U_INC_PERIOD}" title="{'Reduce diaporama speed'|@translate}">&nbsp;-&nbsp;</a>
  {/if}
{/if}
{if isset($first)}
  <a href="{$first.U_IMG}" title="{'First'|@translate} : {$first.TITLE}" rel="first">&laquo;</a>
{/if}
{if isset($previous)}
  <a href="{$previous.U_IMG}" title="{'Previous'|@translate} : {$previous.TITLE}" rel="prev">&lsaquo;</a>
{/if}
{if isset($next)}
  <a href="{$next.U_IMG}" title="{'Next'|@translate} : {$next.TITLE}" rel="next">&rsaquo;</a>
{/if}
{if isset($last)}
  <a href="{$last.U_IMG}" title="{'Last'|@translate} : {$last.TITLE}" rel="last">&raquo;</a>
{/if}
</div>
{/if}

<script type="text/javascript">// <![CDATA[
{literal}
function keyboardNavigation(e)
{
        if(!e) e=window.event;
        if (e.altKey) return true;
        var target = e.target || e.srcElement;
        if (target && target.type) return true; //an input editable element
        var keyCode=e.keyCode || e.which;
        var docElem = document.documentElement;
        switch(keyCode) {
{/literal}
{if isset($next)}
        case 63235: case 39: if (e.ctrlKey || docElem.scrollLeft==docElem.scrollWidth-docElem.clientWidth ){ldelim}window.location="{$next.U_IMG}".replace( "&amp;", "&" ); return false; } break;
{/if}
{if isset($previous)}
        case 63234: case 37: if (e.ctrlKey || docElem.scrollLeft==0){ldelim}window.location="{$previous.U_IMG|@escape:jasvascript}".replace("&amp;","&"); return false; } break;
{/if}
{if isset($first)}
        /*Home*/case 36: if (e.ctrlKey){ldelim}window.location="{$first.U_IMG|@escape:jasvascript}".replace("&amp;","&"); return false; } break;
{/if}
{if isset($last)}
        /*End*/case 35: if (e.ctrlKey){ldelim}window.location="{$last.U_IMG|@escape:jasvascript}".replace("&amp;","&"); return false; } break;
{/if}
{if isset($U_UP) and !isset($slideshow)}
        /*Up*/case 38: if (e.ctrlKey){ldelim}window.location="{$U_UP|@escape:jasvascript}".replace("&amp;","&"); return false; } break;
{/if}

{if isset($slideshow.U_START_PLAY)}
        /*Pause*/case 32: {ldelim}window.location="{$slideshow.U_START_PLAY|@escape:jasvascript}".replace("&amp;","&"); return false; } break;
{/if}
{if isset($slideshow.U_STOP_PLAY)}
        /*Play*/case 32: {ldelim}window.location="{$slideshow.U_STOP_PLAY|@escape:jasvascript}".replace("&amp;","&"); return false; } break;
{/if}
        }
        return true;
}
document.onkeydown=keyboardNavigation;
// ]]></script>
