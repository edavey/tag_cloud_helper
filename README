Tag Cloud Helper for Sunspot and ActsAsTaggableOn
=================================================

Fork of `sgarza/tag_cloud_helper` ([http://github.com/sgarza/tag_cloud_helper](http://github.com/sgarza/tag_cloud_helper)) providing functionality for _contexts_ or (sub-sets of tags) in the form of Sunspot search facets (Solr)

Dependency
----------

Tag Cloud Helper depends on 

- `mbleigh/acts-as-taggable-on` at [http://github.com/mbleigh/acts-as-taggable-on](http://github.com/mbleigh/acts-as-taggable-on)

- `outoftime/sunspot_rails` at [http://github.com/outoftime/sunspot_rails/](http://github.com/outoftime/sunspot_rails/)


To use Tag Cloud Helper
-----------------------

1. Install the plugin by running

        script/plugin install git://github.com/edavey/tag_cloud_helper.git
    
    This will install the `plugin in your vendor/plugins directory`.

2. Use the following helper method in your view, e.g.:

	      <%= tag_cloud @keywords, :model => :article, :context => :keyword, :limit => 25 -%>
	
    where the signature is: `tag_cloud(collection_of_facet_rows, {context, model, limit=30})`

I assume the following:

- that your model name corresponds to the name of the controller which your links will use. The example  generates links like:

        /articles?keyword=jobs
    
- that if you are filtering your search results by other facets then you wish to preserve any existing url parameters and get links like:

        /articles?filter=video&keyword=jobs&query=money
    
- that you don't wish to preserve a `page` parameter, i.e. if you add the `jobs` keyword then you want to see the first page of the new results set.



License
-------

Tag Cloud Helper is released under the MIT license.


Credits
-------

Tag Cloud Helper was created by Sergio R. de la Garza of Development and Technology Advisors S.A. de C.V. (http://www.devtech.com.mx/) and adapted for Solr and contextual tagging by edavey.


