function insertQueryAtCaret() {
	var text = "<query>" + $("#query_dummy_id option:selected").val() + "</query>";

    var txtarea = document.getElementById('markItUpHTML');

    var scrollPos = txtarea.scrollTop;
    var strPos = 0;
    var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ?
        "ff" : (document.selection ? "ie" : false ) );
    if (br == "ie") {
        txtarea.focus();
        var range = document.selection.createRange();
        range.moveStart ('character', -txtarea.value.length);
        strPos = range.text.length;
    }
    else if (br == "ff") strPos = txtarea.selectionStart;

    var front = (txtarea.value).substring(0,strPos);
    var back = (txtarea.value).substring(strPos,txtarea.value.length);
    txtarea.value=front+text+back;
    strPos = strPos + text.length;
    if (br == "ie") {
        txtarea.focus();
        var range = document.selection.createRange();
        range.moveStart ('character', -txtarea.value.length);
        range.moveStart ('character', strPos);
        range.moveEnd ('character', 0);
        range.select();
    }
    else if (br == "ff") {
        txtarea.selectionStart = strPos;
        txtarea.selectionEnd = strPos;
        txtarea.focus();
    }
    txtarea.scrollTop = scrollPos;
}


// ----------------------------------------------------------------------------
// ------------------   jQuery functions and etc are below   ------------------
// ----------------------------------------------------------------------------


$(document).ready(function(){

	// 	if the browser is Internet Explorer, warn the user about glitches
	if (/MSIE (\d+\.\d+);/.test(navigator.userAgent))
	{
		alert("Using Internet Explorer may result in unexpected interface glitches with this website. \n\n For now, we encourage you to use Mozilla Firefox or Google Chrome. \n\n Thank you!")
	}



// ----------------------------------------------------------------------------
//  Query Builder
// ----------------------------------------------------------------------------

$('.tab').on('click', function(){

	$('.activeTab').removeClass('activeTab');
	$(this).addClass('activeTab');

	if ($(this).attr('id') == "raw")
	{
		$('.andGrouping').removeClass('beingInspected');
		$('tr').removeClass('irrelevantRow');

		$('.formattedQuery').hide();
		$('.rawQuery').show();
	} else{
		$('.rawQuery').hide();
		$('.formattedQuery').show();
	}
});


$('.andGrouping > .conditionString:not(:last-child)').append(' and');



$('.andGrouping').on('click', function(){

	$('.andGrouping').removeClass('beingInspected');
	$(this).addClass('beingInspected');

	$('td').removeClass('sorting_1');
	$('tr').addClass('irrelevantRow');

	$('tr.' + $(this).attr("id")).each(function(){
		$(this).removeClass('irrelevantRow');
	});
});





$('#new_query').on("submit", function()
{

	$('.condition').each(function()
	{
		var i = 1;

		// for each of the hidden inputs in that this condition
		$(this).find('input:hidden').not("script").each(function(){
			// the first iteration SHOULD be the column
			// the second iteration SHOULD be the operator
			// the third iteration SHOULD be the complexOperator (could be empty, of course)
			if (i == 1)
			{
				$(this).val($(this).parents('.condition').find('.columnBlock').text());
			}
			if (i == 2)
			{
				$(this).val($(this).parents('.condition').find('.operatorBlock').attr("oid"));
			}
			if (i == 3)
			{
				$(this).val($(this).parents('.condition').find('.complexOperatorBlock').text());
			}
			i += 1;
		});
	});

});


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - INITIALZE DRAG & DROP - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

$.get("/queries/new.js", function(){
	initializeColumnDrag();
	initializeOperatorDrag();
	initializeColumnDrop();
	initializeOperatorDrop();
	initializeComplexOperatorDrag();
	initializeComplexOperatorDrop();
	resortConditions();
});


var poofX;
var poofY;
$(document).mousemove(function(e){
	// where are these numerical offset values coming from?
	// trial, error, and guesswork, my friend
	poofX = e.pageX - 80;
	poofY = e.pageY - 80;
});


function animatePoof(){
	$('#poof').css({left:poofX , top:poofY});
	$('#poof').sprite({fps:15, no_of_frame: 5, play_frames: 5}).show().delay(250).fadeOut(40);
}



function initializeColumnDrag()
{
	$('.columnBlock').each(function(){
		// if the columnBlock has already been dropped into an acceptor once
		if ($(this).data('dropped'))
		{
			$(this).draggable({
				snap:   ".columnAcceptor",
				cursor: "move",
				containment: '#content',
				revert: function(e)
				{
					// the user is (probably) trying to get rid of it now...
					$(this).remove();
 				   	animatePoof();
				}
			});
		} else {
			$(this).draggable({
				snap: '.columnAcceptor',
				helper: "clone",
				cursor: "move",
				containment: '#content',
				revert: "invalid"
			});
		}
	});
}

function initializeOperatorDrag()
{
	$('.operatorBlock').each(function(){
		if ($(this).data('dropped'))
		{
			$(this).draggable({
				snap:   ".operatorAcceptor",
				cursor: "move",
				containment: '#content',
				revert: function(e)
				{
					// the user is (probably) trying to get rid of it now...
					$(this).remove();
 				   	animatePoof();
				}
			});
		} else {
			$(this).draggable({
				snap: '.operatorAcceptor',
				helper: "clone",
				cursor: "move",
				containment: '#content',
				revert: "invalid"
			});
		}
	});
}



function initializeColumnDrop()
{
	$('.columnAcceptor').droppable({
		accept: '.columnBlock',
		drop: function( e, ui )
		{
			var columnClone = ui.helper.clone();
			columnClone.data('dropped', true);
			$(this).append(columnClone);

			checkIfConditionIsComplete($(this).parents('.condition'));
			initializeColumnDrag();
		}
	});
}


function initializeOperatorDrop()
{
	$('.operatorAcceptor').droppable({
		accept: '.operatorBlock',
		drop: function( event, ui )
		{
			var operatorClone = ui.helper.clone();
			operatorClone.data('dropped', true);
			$(this).append(operatorClone);

			checkIfConditionIsComplete($(this).parents('.condition'));
			initializeOperatorDrag();
		},
	});
}


function initializeComplexOperatorDrag()
{
	$('.complexOperatorBlock').each(function(){
		if ($(this).data('dropped'))
		{
			$(this).draggable({
				snap:   ".complexOperatorAcceptor",
				cursor: "move",
				containment: '#content',
				revert: function(e)
				{
					$(this).hide();
					animatePoof();

					// This would be much, much cleaner/simpler if we could simply .remove() the old condition.
					// Errors abound, however, so I'm left simply stripping all IDs and classes from it...
					//
					// the user is (probably) trying to get rid of it now...
					// fadeOut, remove .condition class, strip condition's ID, strip each child element's ID
					$(this).parents('.condition').fadeOut().removeClass('condition').attr("id", "").find("*").attr("id", "");
					resortConditions();

				}
			});
		} else {
			$(this).draggable({
				snap: '.complexOperatorAcceptor',
				helper: "clone",
				cursor: "move",
				containment: '#content',
				revert: "invalid"
			});
		}
	});
}


function initializeComplexOperatorDrop()
{
	$('.complexOperatorAcceptor').droppable({
		accept: '.complexOperatorBlock',
		tolerance: 'fit',
		drop: function( event, ui )
		{
			// hide the dashed-line shape
			$(event.target).removeClass('preDrop');

			// handle block cloning
			var complexOperatorClone = ui.helper.clone();
			complexOperatorClone.data('dropped', true);
			$(this).append(complexOperatorClone);

			if ($(this).data('dropped') === undefined)
			{
				// this is the first time it is dropped
				$(this).data('dropped', true);

				$.get('/queries/new.js', function(){
					initializeColumnDrop();
					initializeOperatorDrop();
					initializeComplexOperatorDrag();
					initializeComplexOperatorDrop();
					resortConditions();
				});

			} else {
				// this is for subsequent drops...
			}

			checkIfConditionIsComplete($(this).parents('.condition'));
		}
	});
}

	// if we are editing a query (as opposed to creating one) the hidden fields for
	// col_id and operator will already have values, so grab them, and use each in
	// visually initializing the edit page, with blocks placed appropriately
	//
	// these two if-statements need to be declared beneath the draggable/droppable declarations (above)
	// which would otherwise nullify any selective disabling we might be attempting here
	//
	//
	// if ($('#query_condition_animal_attr').val() != "" && $('#query_condition_animal_attr').val() != undefined)
	// {
	// 	var coff = $("#columnAcceptor").offset();
	//
	// 	$('.columnBlock').each(function(){
	// 		if ($(this).attr('cid')==$('#query_condition_animal_attr').val())
	// 		{
	// 			$(this).offset({top:0,left:0}).offset({top:coff.top,left:coff.left});
	// 		} else {
	// 			$(this).draggable('disable');
	// 		}
	// 	});
	// }
	//
	// if ($('#query_condition_operator_id').val() != "" && $('#query_condition_operator_id').val() != undefined)
	// {
	// 	var ooff = $("#operatorAcceptor").offset();
	//
	// 	$('.operatorBlock').each(function(){
	// 		if ($(this).attr('oid') == $('#query_condition_operator_id').val())
	// 		{
	// 			$(this).offset({top:0,left:0}).offset({top:ooff.top,left:ooff.left});
	// 		} else {
	// 			$(this).draggable('disable');
	// 		}
	// 	});
	//
	// }

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - functions for recycling blocks  - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	// some sort of more "official" sorting algorithm needs to be implemented here...
	function resortConditions(conditionBeingRemoved)
	{

		var i = 1;
		$('.condition').each(function(){
			$(this).find('.buildYourQuery > legend').text('Condition #' + i);

			// $(this).attr('id', 'condition' + i);
			//
			// 			var newCA	= 'columnAcceptor' + i;
			// 			var newOA	= 'operatorAcceptor' + i;
			// 			var newCOA	= 'complexOperatorAcceptor' + i;
			//
			// 			$(this).find('div.columnAcceptor').attr("id", newCA);
			// 			$(this).find('div.operatorAcceptor').attr("id", newOA);
			// 			$(this).find('div.complexOperatorAcceptor').attr("id", newCOA);

			$(this).find('input:hidden').not("script").each(function(){
				$(this).attr("id", $(this).attr("id").replace("_0_", "_" + i + "_"));
			});


			i++;
		});
	}

	function checkIfConditionIsComplete(condition)
	{
		if ($(condition).children('.columnAcceptor').children('.columnBlock').length > 0 && $(condition).children('operatorAcceptor').children('operatorBlock').length > 0)
		{
			$(condition).children('.buildYourQuery').addClass('completedCondition');
		} else {
			$(condition).children('.buildYourQuery').removeClass('completedCondition');
		}
	}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -






// ----------------------------------------------------------------------------
//  dataTable stuff
// ----------------------------------------------------------------------------

	var oTable = $('.dataTable').dataTable({
	"iDisplayLength": -1,
	"oLanguage": {
		"sLengthMenu": 'Display <select>'+
			'<option value="10">10</option>'+
			'<option value="20">20</option>'+
			'<option value="100">100</option>'+
			'<option value="-1">All</option>'+
			'</select> records'
				 },
	"bFilter"	: false,
	"bPaginate" : false
	});

	// hide the up/down arrow images in all <th> elements because they tend to block the text...
	$('.dataTable th').css('background-image', 'url()');



// ----------------------------------------------------------------------------
//  select a theme for your page
// ----------------------------------------------------------------------------
	$('.themePreview').click(function(){
		$(".currentThemePreview").removeClass("currentThemePreview");
		$(this).addClass("currentThemePreview");
		$('#page_theme_id').val($(this).attr('themeid'));
	});

// ----------------------------------------------------------------------------
// markItUp is the visual html editor used for page creation/editing
// ----------------------------------------------------------------------------
// markItUp!
// ----------------------------------------------------------------------------
// Copyright (C) 2008 Jay Salvat
// http://markitup.jaysalvat.com/
// ----------------------------------------------------------------------------

	myHtmlSettings = {
	    nameSpace:       "html", // Useful to prevent multi-instances CSS conflict
	    onShiftEnter:    {keepDefault:false, replaceWith:'<br />\n'},
	    onCtrlEnter:     {keepDefault:false, openWith:'\n<p>', closeWith:'</p>\n'},
	    onTab:           {keepDefault:false, openWith:'     '},
	    markupSet:  [
	        {name:'Heading 1', key:'1', openWith:'<h1(!( class="[![Class]!]")!)>', closeWith:'</h1>', placeHolder:'Your title here...' },
	        {name:'Heading 2', key:'2', openWith:'<h2(!( class="[![Class]!]")!)>', closeWith:'</h2>', placeHolder:'Your title here...' },
	        {name:'Heading 3', key:'3', openWith:'<h3(!( class="[![Class]!]")!)>', closeWith:'</h3>', placeHolder:'Your title here...' },
	        {name:'Heading 4', key:'4', openWith:'<h4(!( class="[![Class]!]")!)>', closeWith:'</h4>', placeHolder:'Your title here...' },
	        {name:'Heading 5', key:'5', openWith:'<h5(!( class="[![Class]!]")!)>', closeWith:'</h5>', placeHolder:'Your title here...' },
	        {name:'Heading 6', key:'6', openWith:'<h6(!( class="[![Class]!]")!)>', closeWith:'</h6>', placeHolder:'Your title here...' },
	        {name:'Paragraph', openWith:'<p(!( class="[![Class]!]")!)>', closeWith:'</p>'  },
	        {separator:'---------------' },
	        {name:'Bold', key:'B', openWith:'<strong>', closeWith:'</strong>' },
	        {name:'Italic', key:'I', openWith:'<em>', closeWith:'</em>'  },
	        {name:'Strike through', key:'S', openWith:'<del>', closeWith:'</del>' },

  	        {separator:'---------------' },
	        {name:'Picture', key:'P', replaceWith:'<img src="[![Source:!:]!]">' },
	        {name:'Link', key:'L', openWith:'<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', closeWith:'</a>', placeHolder:'Your text to link...' },
	        {separator:'---------------' },

			{name:'Colors', className:'palette', dropMenu: [
					{name:'Yellow',	openWith:'<span style="color:#FCE94F;">', closeWith:'</span>',	className:"col1-1", placeHolder:'Colored text goes here...' },
					{name:'Yellow',	openWith:'<span style="color:#EDD400;">', closeWith:'</span>', 	className:"col1-2", placeHolder:'Colored text goes here...' },
					{name:'Yellow', openWith:'<span style="color:#C4A000;">', closeWith:'</span>', 	className:"col1-3", placeHolder:'Colored text goes here...' },

					{name:'Orange', openWith:'<span style="color:#FCAF3E;">', closeWith:'</span>', 	className:"col2-1", placeHolder:'Colored text goes here...' },
					{name:'Orange', openWith:'<span style="color:#F57900;">', closeWith:'</span>', 	className:"col2-2", placeHolder:'Colored text goes here...' },
					{name:'Orange', openWith:'<span style="color:#CE5C00;">', closeWith:'</span>', 	className:"col2-3", placeHolder:'Colored text goes here...' },

					{name:'Brown', 	openWith:'<span style="color:#E9B96E;">', closeWith:'</span>', 	className:"col3-1", placeHolder:'Colored text goes here...' },
					{name:'Brown', 	openWith:'<span style="color:#C17D11;">', closeWith:'</span>', 	className:"col3-2", placeHolder:'Colored text goes here...' },
					{name:'Brown',	openWith:'<span style="color:#8F5902;">', closeWith:'</span>', 	className:"col3-3", placeHolder:'Colored text goes here...' },

					{name:'Green', 	openWith:'<span style="color:#8AE234;">', closeWith:'</span>', 	className:"col4-1", placeHolder:'Colored text goes here...' },
					{name:'Green', 	openWith:'<span style="color:#73D216;">', closeWith:'</span>', 	className:"col4-2", placeHolder:'Colored text goes here...' },
					{name:'Green',	openWith:'<span style="color:#4E9A06;">', closeWith:'</span>', 	className:"col4-3", placeHolder:'Colored text goes here...' },

					{name:'Blue', 	openWith:'<span style="color:#729FCF;">', closeWith:'</span>', 	className:"col5-1", placeHolder:'Colored text goes here...' },
					{name:'Blue', 	openWith:'<span style="color:#3465A4;">', closeWith:'</span>', 	className:"col5-2", placeHolder:'Colored text goes here...' },
					{name:'Blue',	openWith:'<span style="color:#204A87;">', closeWith:'</span>', 	className:"col5-3", placeHolder:'Colored text goes here...' },

					{name:'Purple', openWith:'<span style="color:#AD7FA8;">', closeWith:'</span>', 	className:"col6-1", placeHolder:'Colored text goes here...' },
					{name:'Purple', openWith:'<span style="color:#75507B;">', closeWith:'</span>', 	className:"col6-2", placeHolder:'Colored text goes here...' },
					{name:'Purple',	openWith:'<span style="color:#5C3566;">', closeWith:'</span>', 	className:"col6-3", placeHolder:'Colored text goes here...' },

					{name:'Red', 	openWith:'<span style="color:#EF2929;">', closeWith:'</span>', 	className:"col7-1", placeHolder:'Colored text goes here...' },
					{name:'Red', 	openWith:'<span style="color:#CC0000;">', closeWith:'</span>', 	className:"col7-2", placeHolder:'Colored text goes here...' },
					{name:'Red',	openWith:'<span style="color:#A40000;">', closeWith:'</span>', 	className:"col7-3", placeHolder:'Colored text goes here...' },

					{name:'Gray', 	openWith:'<span style="color:#FFFFFF;">', closeWith:'</span>', 	className:"col8-1", placeHolder:'Colored text goes here...' },
					{name:'Gray', 	openWith:'<span style="color:#D3D7CF;">', closeWith:'</span>', 	className:"col8-2", placeHolder:'Colored text goes here...' },
					{name:'Gray',	openWith:'<span style="color:#BABDB6;">', closeWith:'</span>', 	className:"col8-3", placeHolder:'Colored text goes here...' },

					{name:'Gray', 	openWith:'<span style="color:#888A85;">', closeWith:'</span>', 	className:"col9-1", placeHolder:'Colored text goes here...' },
					{name:'Gray', 	openWith:'<span style="color:#555753;">', closeWith:'</span>', 	className:"col9-2", placeHolder:'Colored text goes here...' },
					{name:'Gray',	openWith:'<span style="color:#000000;">', closeWith:'</span>', 	className:"col9-3", placeHolder:'Colored text goes here...' }
				]
			}

			// {separator:'---------------' },
	        // {name:'Clean', replaceWith:function(h) { return h.selection.replace(/<(.*?)>/g, "") } },
	        // {name:'Preview', call:'preview', className:'preview' }
	    ]
	}


    $('#markItUpHTML').markItUp(myHtmlSettings);
});