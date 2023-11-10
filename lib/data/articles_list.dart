
class ArticlesList {
  String? status;
  String? copyright;
  int? numResults;
  List<Results>? results;

  ArticlesList({this.status, this.copyright, this.numResults, this.results});

  ArticlesList.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["copyright"] is String) {
      copyright = json["copyright"];
    }
    if(json["num_results"] is int) {
      numResults = json["num_results"];
    }
    if(json["results"] is List) {
      results = json["results"] == null ? null : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["copyright"] = copyright;
    _data["num_results"] = numResults;
    if(results != null) {
      _data["results"] = results?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Results {
  String? uri;
  String? url;
  int? id;
  int? assetId;
  String? source;
  String? publishedDate;
  String? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adxKeywords;
  dynamic column;
  String? byline;
  String? type;
  String? title;
  String? abstract;
  List<String>? desFacet;
  List<dynamic>? orgFacet;
  List<dynamic>? perFacet;
  List<String>? geoFacet;
  List<Media>? media;
  int? etaId;

  Results({this.uri, this.url, this.id, this.assetId, this.source, this.publishedDate, this.updated, this.section, this.subsection, this.nytdsection, this.adxKeywords, this.column, this.byline, this.type, this.title, this.abstract, this.desFacet, this.orgFacet, this.perFacet, this.geoFacet, this.media, this.etaId});

  Results.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["asset_id"] is int) {
      assetId = json["asset_id"];
    }
    if(json["source"] is String) {
      source = json["source"];
    }
    if(json["published_date"] is String) {
      publishedDate = json["published_date"];
    }
    if(json["updated"] is String) {
      updated = json["updated"];
    }
    if(json["section"] is String) {
      section = json["section"];
    }
    if(json["subsection"] is String) {
      subsection = json["subsection"];
    }
    if(json["nytdsection"] is String) {
      nytdsection = json["nytdsection"];
    }
    if(json["adx_keywords"] is String) {
      adxKeywords = json["adx_keywords"];
    }
    column = json["column"];
    if(json["byline"] is String) {
      byline = json["byline"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["abstract"] is String) {
      abstract = json["abstract"];
    }
    if(json["des_facet"] is List) {
      desFacet = json["des_facet"] == null ? null : List<String>.from(json["des_facet"]);
    }
    if(json["org_facet"] is List) {
      orgFacet = json["org_facet"] ?? [];
    }
    if(json["per_facet"] is List) {
      perFacet = json["per_facet"] ?? [];
    }
    if(json["geo_facet"] is List) {
      geoFacet = json["geo_facet"] == null ? null : List<String>.from(json["geo_facet"]);
    }
    if(json["media"] is List) {
      media = json["media"] == null ? null : (json["media"] as List).map((e) => Media.fromJson(e)).toList();
    }
    if(json["eta_id"] is int) {
      etaId = json["eta_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    _data["url"] = url;
    _data["id"] = id;
    _data["asset_id"] = assetId;
    _data["source"] = source;
    _data["published_date"] = publishedDate;
    _data["updated"] = updated;
    _data["section"] = section;
    _data["subsection"] = subsection;
    _data["nytdsection"] = nytdsection;
    _data["adx_keywords"] = adxKeywords;
    _data["column"] = column;
    _data["byline"] = byline;
    _data["type"] = type;
    _data["title"] = title;
    _data["abstract"] = abstract;
    if(desFacet != null) {
      _data["des_facet"] = desFacet;
    }
    if(orgFacet != null) {
      _data["org_facet"] = orgFacet;
    }
    if(perFacet != null) {
      _data["per_facet"] = perFacet;
    }
    if(geoFacet != null) {
      _data["geo_facet"] = geoFacet;
    }
    if(media != null) {
      _data["media"] = media?.map((e) => e.toJson()).toList();
    }
    _data["eta_id"] = etaId;
    return _data;
  }
}

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadata>? mediaMetadata;

  Media({this.type, this.subtype, this.caption, this.copyright, this.approvedForSyndication, this.mediaMetadata});

  Media.fromJson(Map<String, dynamic> json) {
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["subtype"] is String) {
      subtype = json["subtype"];
    }
    if(json["caption"] is String) {
      caption = json["caption"];
    }
    if(json["copyright"] is String) {
      copyright = json["copyright"];
    }
    if(json["approved_for_syndication"] is int) {
      approvedForSyndication = json["approved_for_syndication"];
    }
    if(json["media-metadata"] is List) {
      mediaMetadata = json["media-metadata"] == null ? null : (json["media-metadata"] as List).map((e) => MediaMetadata.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["subtype"] = subtype;
    _data["caption"] = caption;
    _data["copyright"] = copyright;
    _data["approved_for_syndication"] = approvedForSyndication;
    if(mediaMetadata != null) {
      _data["media-metadata"] = mediaMetadata?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class MediaMetadata {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadata({this.url, this.format, this.height, this.width});

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["format"] is String) {
      format = json["format"];
    }
    if(json["height"] is int) {
      height = json["height"];
    }
    if(json["width"] is int) {
      width = json["width"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["format"] = format;
    _data["height"] = height;
    _data["width"] = width;
    return _data;
  }
}