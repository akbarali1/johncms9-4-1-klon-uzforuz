/*
 * Cyrillic to Latin converter
 * @modificator Rustam Aminov 2015
 * @cyr2lat rustik version ;)
 * @fb/xorazmiy
 * @email uzad@bk.ru
 */


/*
 * @author Danijel Petrovic
 * @copyright Danijel Petrovic, 2014
 * @version 0.6.1
 */

//ignore exact words, and if value set, replace it with value
var CyrLatIgnoreList = {
	"plugin" : '',
	"jquery" : 'jQuery',
	"default" : '',
	"copyright" : '',
	"trademark" : '',
	"web" : '',
	"browser" : '',
	"javascript" : '',
	"microsoft" : 'Microsoft',
	"firefox" : 'Firefox',
	"opera" : 'Opera',
	"safari" : 'Safari',
	"chrome" : 'Chrome',
	"ie" : 'IE',
	"download" : '',
	"windows" : '',
	"linux" : '',
	"office" : '',
 	"cookie" : '',
 	"cyrlatconverter" : '',
 	"cyrlatconvert" : '',
 	"cyrlatignore" : ''
};

//ignore EXACT words from double letters chaining into one
var CyrLatIgnore_doubleletters = {
	"OVDE-UNETI-TAČNU-REČ-ZA-IGNORISANJE-SPAJANJA-DVA-SLOVA-U-JEDNO" : '',
	"njemačku" : ''
};

//ignore all words BASED on words in the list from double letters chaining into one
var CyrLatIgnore_doubleletters_base = {
	budzašto	: ''
};

(function($) {
	var config = {
		cookie_duration : 7,
		parent_class_ignore : '',
		permalink_hash_lat : "#lat",
		permalink_hash_cyr : "#cyr",
		permalink_hash : "off",
		ignore_list_include_unicode : "on",
		benchmark : 'off',
		benchmark_eval : "console.log('Execution time: %s%')",
		button_cyr : '',
		button_lat : '',
		button_default : ''
	};

	var SELECTOR = '.CyrLatConvert';

	var Lat2Cyr = {
		"a" : "а",
		"b" : "б",
		"c" : "с",
		"d" : "д",
		"e" : "е",
		"f" : "ф",
		"g" : "г",
		"h" : "ҳ",
		"i" : "и",
		"j" : "ж",
		"k" : "к",
		"l" : "л",
		"m" : "м",
		"n" : "н",
		"o" : "о",
		"p" : "п",
		"q" : "қ",
		"r" : "р",
		"s" : "с",
		"t" : "т",
		"u" : "у",
		"v" : "в",
		"w" : "w",
		"x" : "х",
		"y" : "й",
		"z" : "з",

		"A" : "А",
		"B" : "Б",
		"C" : "С",
		"D" : "Д",
		"E" : "Э",
		"F" : "Ф",
		"G" : "Г",
		"H" : "Ҳ",
		"I" : "И",
		"J" : "Ж",
		"K" : "К",
		"L" : "Л",
		"M" : "М",
		"N" : "Н",
		"O" : "О",
		"P" : "П",
		"Q" : "Қ",
		"R" : "Р",
		"S" : "С",
		"T" : "Т",
		"U" : "У",
		"V" : "В",
		"W" : "В",
		"X" : "Х",
		"Y" : "Й",
		"Z" : "З",
		"H" : "Ҳ"
	};

	var Cyr2Lat = {
		 "а" : "a",
		 "б" : "b",
		 "ц" : "ts",
		 "д" : "d",
		 "е" : "e",
		 "ф" : "f",
		 "г" : "g",
		 "ҳ" : "h",
		 "и" : "i",
		 "ж" : "j",
		 "к" : "k",
		 "л" : "l",
		 "м" : "m",
		 "н" : "n",
		 "о" : "o",
		 "п" : "p",
		 "р" : "r",
		 "с" : "s",
		 "т" : "t",
		 "у" : "u",
		 "в" : "v",
		 "з" : "z",
		 "й" : "y",
		"қ" : "q",
		"ў" : "o'",
		"ҳ" : "h",
		"ғ" : "g'",
		"ш" : "sh",
		"ч" : "ch",
		"я" : "ya",
		"ю" : "yu",
		"ъ" : "'",

		 "А" : "A",
		 "Б" : "B",
		 "Ц" : "Ts",
		 "Д" : "D",
		 "Е" : "E",
		 "Э" : "E",
		 "Ф" : "F",
		 "Г" : "G",
		 "Х" : "X",
		 "И" : "I",
		 "Ж" : "J",
		 "К" : "K",
		 "Л" : "L",
		 "М" : "M",
		 "Н" : "N",
		 "О" : "O",
		 "П" : "P",
		 "Р" : "R",
		 "С" : "S",
		 "Т" : "T",
		 "У" : "U",
		 "В" : "V",
		 "З" : "Z",
		 "Й" : "Y",
		"Қ" : "Q",
		"Ў" : "O'",
		"Ҳ" : "H",
		"Ғ" : "G'",
		"Ч" : "Ch",
		"Ш" : "SH",
		"Я" : "Ya",
		"Ю" : "Yu",
		"Ъ" : "'"
	};

	var Lat2Cyr_chained = {
		"S" : {
			"H" : "Ш",
			"h" : "Ш"
		},
		"C" : {
			"H" : "Ч",
			"h" : "Ч"
		},
		"O" : {
			"'" : "Ў",
			"`" : "Ў",
			"‘" : "Ў",
			"’" : "Ў"
		},
		"G" : {
			"'" : "Ғ",
			"`" : "Ғ",
			"‘" : "Ғ",
			"’" : "Ғ"
		},
		"Y" : {
			"a" : "Я",
			"A" : "Я",
			"o" : "Ё",
			"O" : "Ё",
			"u" : "Ю",
			"U" : "Ю"
		},
		"A" : {
			"'" : "Aъ",
			"`" : "Aъ",
			"‘" : "Aъ",
			"’" : "Aъ"
		},
		"a" : {
			"'" : "aъ",
			"`" : "aъ",
			"‘" : "aъ",
			"’" : "aъ"
		},
		"s" : {
			"h" : "ш"
		},
		"c" : {
			"h" : "ч"
		},
		"o" : {
			"'" : "ў",
			"`" : "ў",
			"‘" : "ў",
			"’" : "ў"
		},
		"g" : {
			"'" : "ғ",
			"`" : "ғ",
			"‘" : "ғ",
			"’" : "ў"
		},
		"y" : {
			"a" : "я",
			"o" : "ё",
			"u" : "ю"
		}
	};

	function do_hash()
	{
		if(window.location.hash == config.permalink_hash_lat)
			methods['C2L'].call(this);
		if(window.location.hash == config.permalink_hash_cyr)
			methods['L2C'].call(this);

		//console.log('HASH: ' + window.location.hash);
	}

	function initHash()
	{
		if(!("onhashchange" in window)) {
		    var oldHref = location.href;
		    setInterval(function() {
		        var newHref = location.href;
		        if (oldHref !== newHref) {
		            oldHref = newHref;
		            do_hash();
		        }
		    }, 100);
		} else if (window.addEventListener) {
		    window.addEventListener("hashchange", do_hash, false);
		}
		else if (window.attachEvent) {
		    window.attachEvent("onhashchange", do_hash);
		}

		do_hash();

		//if permalink is already set on page load (init hash function) we will return true so no translation is called from cookie.
		if(window.location.hash == config.permalink_hash_lat || window.location.hash == config.permalink_hash_cyr)
			return true;

		return false;
	}

	function setCookie(value) {
		var expires = "; ";
		if (config.cookie_duration) {
			var date = new Date();
			date.setDate(date.getDate() + config.cookie_duration);
			expires = "; expires=" + date.toGMTString() + "; ";
		}
		document.cookie = "CyrLatConverterSelected=" + value + expires + "path=/";
	}

	function getCookie() {
		var name = "CyrLatConverterSelected=";
		var c_arr = document.cookie.split(';');
		for (var i = 0; i < c_arr.length; i++) {
			var c = c_arr[i];
			while (c.charAt(0) == ' ')
				c = c.substring(1, c.length);

			if (c.indexOf(name) == 0)
				return c.substring(name.length, c.length);
		}
		return null;
	}

	/**
	 * splitWords
	 *
	 * Cross browser function to split words and preserve delimiters.
	 */
	function splitWords(str) {

	    if(config.ignore_list_include_unicode == 'on')
			var pattern = "[^0-9a-zA-Z\u0400-\u04FF_\u010D\u010C\u0107\u0106\u017E\u017D\u0161\u0160\u0111\u0110'`‘’]+"; //unicode for all cyrillic letters, and čČćĆžŽšŠđĐ
		else
			var pattern = "[^0-9a-zA-Z_\u010D\u010C\u0107\u0106\u017E\u017D\u0161\u0160\u0111\u0110]+"; //unicode for čČćĆžŽšŠđĐ

		//test does browser natively support split with keeping delimiters.
		var test = "test string";
		if(test.split(/([^a-z])/).length == 3)
		{
			return str.split(new RegExp("(" + pattern + ")", "i"));
		}

		regex = new RegExp(pattern, "gi");

		var i = 0;
		var matches    = str.split(regex),
	        separators = str.match(regex),
	        ret        = [];

		if(matches.length == 0)
			return separators;

		if(separators == null)
			return matches;

		if(separators.length == matches.length + 1) //separators from both sides
		{
			for(i = 0; i < matches.length; i++)
			{
				ret.push(separators[i]);
				ret.push(matches[i]);
			}
			ret.push(separators[i]);
		}
		else if(separators.length == matches.length) //separator from one of the sides
		{
			if(matches[0].indexOf(separators[0]) > -1) //separator is 1st
			{
				for(var i = 0; i < separators.length; i++)
				{
					ret.push(separators[i]);
					ret.push(matches[i]);
				}
			}
			else //separator is last
			{
				for(var i = 0; i < separators.length; i++)
				{
					ret.push(matches[i]);
					ret.push(separators[i]);
				}
			}
		}
		else //no separators from the sides
		{
			ret.push(matches[0]);
			for(i = 0; i < separators.length; i++)
			{
				ret.push(separators[i]);
				ret.push(matches[i+1]);
			}
		}

	    return ret;
	}
	/* End of splitWords */


	function replace_L2C(txt) {
		var value;
		var chainedFlag;
		var c2;
		var baseFlagIgnore = false;
		var validDoubleChain;


		var words = splitWords(txt);

		//iterate through all words
		$.each(words, function(i, w) {

			//if list of words to ifnore exist...
			if((typeof CyrLatIgnoreList != 'undefined') && (w.toString().toLowerCase() in CyrLatIgnoreList))
				words[i] = CyrLatIgnoreList[w.toString().toLowerCase()] == '' ? w : CyrLatIgnoreList[w.toString().toLowerCase()];
			else
			{
				validDoubleChain = true;

				if(typeof CyrLatIgnore_doubleletters != 'undefined' && (w.toString().toLowerCase() in CyrLatIgnore_doubleletters))
					validDoubleChain = false;

				//iterate through list of base words to ignore
				if(typeof CyrLatIgnore_doubleletters_base != 'undefined') {
					$.each(CyrLatIgnore_doubleletters_base, function(base, v) {
						if(w.toString().toLowerCase().indexOf(base) > -1) //ignore it
						{
							validDoubleChain = false;
							return false;
						}

					});
				}

				//split words in letters...
				value = w.split('');

				$.each(value, function(i, c) {
					chainedFlag = false;

					//if word shoult be doubleletters chained...
					if (Lat2Cyr_chained[c] && validDoubleChain) {
						c2 = value[i + 1];
						if (c2 && Lat2Cyr_chained[c][c2]) {
							value[i] = Lat2Cyr_chained[c][c2];
							value[i + 1] = '';
							chainedFlag = true;
						}
					}

					if (!chainedFlag)
						value[i] = (Lat2Cyr[c] && Lat2Cyr[c] != "") ? Lat2Cyr[c] : c;
				});

				words[i] = value.join('');
			}

		});

		return words.join(''); //join with NO space, as spaces are preserved in split function.
	}

	function replace_C2L(txt) {

		var value;

		//if list of words to ifnore exist...
		if (typeof CyrLatIgnoreList != 'undefined')
		{
			var words = splitWords(txt);

			//console.log(words);
			$.each(words, function(i, w) {
				if(!(w.toString().toLowerCase() in CyrLatIgnoreList)) //if word not set in ignore list
				{
					value = w.split('');

					$.each(value, function(i, c) {
						value[i] = (Cyr2Lat[c] && Cyr2Lat[c] != "") ? Cyr2Lat[c] : c;
					});

					words[i] = value.join('');
				}
				else
					words[i] = CyrLatIgnoreList[w.toString().toLowerCase()] == '' ? w : CyrLatIgnoreList[w.toString().toLowerCase()];
			});

			return words.join(''); //join with NO space, as spaces are preserved in split function.
		}
		else // there's no ignore dictionary
		{
			value = txt.split('');

			$.each(value, function(i, c) {
				value[i] = (Cyr2Lat[c] && Cyr2Lat[c] != "") ? Cyr2Lat[c] : c;
			});

			return value.join('');
		}
	}

	function recursiveCheckParent(el)
	{
		var parent_class_ignore = config.parent_class_ignore.split(',');
		$.each(parent_class_ignore, function(i, c) {
			parent_class_ignore[i] = $.trim(c);
		});

		function scan(element)
		{
			while(element.parentNode)
			{
				if(element.className && jQuery.inArray(element.className, parent_class_ignore) >= 0)
					return true;

				element = element.parentNode;
			}
			return false;
		}

		return scan(el);
	}

	function convert_L2C(el) {

		$(el).wrapInner('<span id="CyrLatWrap" />');

		$(el).find(':not(iframe,script,style,pre,code,.CyrLatIgnore)').contents().filter(function() {
			if (this.nodeType == 3)
				if(!recursiveCheckParent(this)){
					if(typeof this.textContent != 'undefined')
						this.textContent = replace_L2C(this.textContent);
					else if(typeof this.innerText != 'undefined')
						this.innerText = replace_L2C(this.innerText);
					else if(typeof this.nodeValue != 'undefined')
						this.nodeValue = replace_L2C(this.nodeValue);

					return true;
				}
			return false;
		});

		$(el).find("#CyrLatWrap").contents().unwrap();
	};

	function convert_C2L(el) {

		$(el).wrapInner('<span id="CyrLatWrap" />');

		var textNodes = $(el).find(':not(iframe,script,style,pre,code,.CyrLatIgnore)').contents().filter(function() {
			if (this.nodeType == 3){
				if(typeof this.textContent != 'undefined')
						this.textContent = replace_C2L(this.textContent);
					else if(typeof this.innerText != 'undefined')
						this.innerText = replace_C2L(this.innerText);
					else if(typeof this.nodeValue != 'undefined')
						this.nodeValue = replace_C2L(this.nodeValue);

				return true;
			}
			return false;
		});

		$(el).find("#CyrLatWrap").contents().unwrap();
	};

	var init_benchmark_active = false;
	var methods = {
		init : function(customSettings) {
			//console.log(customSettings);
			if (customSettings) {
				$.extend(config, customSettings);
			}

			//console.log(CyrLatIgnore);

			if(config.button_cyr != '')
			{
				if(config.button_cyr.charAt(0) != '#')
					config.button_cyr = '#' + config.button_cyr;

				$(config.button_cyr).click(function(){
			        $( SELECTOR ).CyrLatConverter('L2C');
			    });
			}

			if(config.button_lat != '')
			{
				if(config.button_lat.charAt(0) != '#')
					config.button_lat = '#' + config.button_lat;

				$(config.button_lat).click(function(){
			        $( SELECTOR ).CyrLatConverter('C2L');
			    });
			}

			if(config.button_default != '')
			{
				if(config.button_default.charAt(0) != '#')
					config.button_default = '#' + config.button_default;

				$(config.button_default).click(function(){
			        $( SELECTOR ).CyrLatConverter('default');
			    });
			}

			//start benchmark
			if(config.benchmark.toString().toLowerCase() == 'on')
			{
				var start = new Date().getTime();
				init_benchmark_active = true;
			}

			var hash_set = false;
			if(config.permalink_hash.toLowerCase() == "on")
			{
				hash_set = initHash(); //return hash translation status (translated or not)
			}

			var direction = '';
			if(config.cookie_duration > 0)
				direction = getCookie();

			if (hash_set == false && (direction == "L2C" || direction == "C2L")) {
				methods[direction].call(this);
			}

			//end benchmark
			if(config.benchmark.toString().toLowerCase() == 'on')
			{
				eval(config.benchmark_eval.replace('%s%', (new Date().getTime() - start) + 'ms'));
				init_benchmark_active = false;
			}

			return true;
		},
		L2C : function() {
			//start benchmark
			if(config.benchmark.toString().toLowerCase() == 'on' && !init_benchmark_active)
				var start = new Date().getTime();

			$( SELECTOR ).each(function() {
				convert_L2C(this);
			});
			setCookie('L2C');

			//end benchmark
			if(config.benchmark.toString().toLowerCase() == 'on' && !init_benchmark_active)
				eval(config.benchmark_eval.replace('%s%', (new Date().getTime() - start) + 'ms'));

			if(typeof(config.onL2C) != 'undefined')
				config.onL2C.call();

			var foo = $('.tagline').html().split('аксиядорлик').join('акциядорлик');
		    $('.tagline').html(foo);

			return true;
		},
		C2L : function() {

			//start benchmark
			if(config.benchmark.toString().toLowerCase() == 'on' && !init_benchmark_active)
				var start = new Date().getTime();

			$( SELECTOR ).each(function() {
				convert_C2L(this);
			});
			setCookie('C2L');

			//end benchmark
			if(config.benchmark.toString().toLowerCase() == 'on' && !init_benchmark_active)
				eval(config.benchmark_eval.replace('%s%', (new Date().getTime() - start) + 'ms'));

			if(typeof(config.onC2L) != 'undefined')
				config.onC2L.call();

			var foo = $('.tagline').html().split('aktsiyadorlik').join('aksiyadorlik');
		    $('.tagline').html(foo);

			return true;
		}
	}

	$.fn.CyrLatConverter = function(method) {

		SELECTOR = this.selector;

		if (typeof method === 'undefined' || typeof method === 'object' || !method) {
			methods.init.apply(this, arguments);
		}
		else if(method.toString().toLowerCase() == 'default')
		{
			setCookie('default'); //set to default, so no C2L or L2C will be called
			if(config.permalink_hash = 'on')
				window.location.hash = '';
			location.reload(true); //reload from server, not cache
			return false;
		}
		else if (methods[method]) {
			if(config.permalink_hash.toLowerCase() == "on")
			{
				if(method.toString().toUpperCase() == 'L2C')
					window.location.hash = config.permalink_hash_cyr;
				else if(method.toString().toUpperCase() == 'C2L')
					window.location.hash = config.permalink_hash_lat;
			}
			else
				methods[method].call(this);
		}
		else {
			$.error('Unknown call to ' + method);
		}

		return this;
	};

	/**
	 * Backward compatibile with previous versions.
	 */
	$.CyrLatConverter = function(method) {
	    return $( SELECTOR ).CyrLatConverter(method);
	};

})(jQuery);
