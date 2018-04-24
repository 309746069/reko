<div class="text-center">
	<h1>Reko Decompiler {{version}}</h1>
</div>

<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<li><a href"#">Item</a></li>
			<li><a href"#">Item</a></li>
			<li><a href"#">Item</a></li>
			<li><a href"#">Item</a></li>
		</ul>
	</div>
</nav>

<div class="container reko-container">
	<input type="button" id="btn-test" value="Decompile" />
	<div class="panel">		
		<div id="reko-browser" class="reko-browser reko-pane">
			<div class="program">
				<p class="program-name"></p>
				<div class="reko-procedure-list reko-pane">
					{{> main}}
				</div>
			</div>
		</div>
		<input type="button" id="getSearchBtn" value="Search" style="float:left; clear:both;"/>
		<div id="reko-procedure" class="reko-procedure">
				Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				Nunc posuere mauris quis lectus aliquam, accumsan venenatis libero efficitur.
				Ut lectus elit, sagittis at libero et, interdum luctus urna. Suspendisse et lacinia nisl.
		</div>
	</div>
	<div class="results-container">
		<div id="search-results" class="search-results reko-pane">
			{{> searchResults}}
		</div>
	</div>

	<div class="diagnostic-container">
		<table id="reko-messages" class="table table-striped table-responsive reko-messages">
			<thead></thead>
			<tbody></tbody>
		</table>
	</div>
</div>