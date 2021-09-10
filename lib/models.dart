class DingjianModel {
	 int? totalCount;
	 int? pageSize;
	 int? totalPage;
	 int? currentPage;
	 List<List2>? list2;

	DingjianModel({this.totalCount, this.pageSize, this.totalPage, this.currentPage, this.list2});

	DingjianModel.fromJson(Map<String, dynamic> json) {
		totalCount = json['totalCount'];
		pageSize = json['pageSize'];
		totalPage = json['totalPage'];
		currentPage = json['currentPage'];
		if (json['list2'] != null) {
			list2 = <List2>[];
			json['list2'].forEach((v) { list2?.add(List2.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final  data = <String, dynamic>{};
		data['totalCount'] = totalCount;
		data['pageSize'] = pageSize;
		data['totalPage'] = totalPage;
		data['currentPage'] = currentPage;
		if (list2 != null) {
      data['list2'] = list2?.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class List2 {
	 String? historyData;
	 List<ResDtos>? resDtos;

	List2({this.historyData, this.resDtos});

	List2.fromJson(Map<String, dynamic> json) {
		historyData = json['historyData'];
		if (json['resDtos'] != null) {
			resDtos = <ResDtos>[];
			json['resDtos'].forEach((v) { resDtos?.add(ResDtos.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final  data = <String, dynamic>{};
		data['historyData'] = historyData;
		if (resDtos != null) {
      data['resDtos'] = resDtos?.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ResDtos {
	 String? browsingHistoryData;
	 String? mainUrl;
	 List<MediaList>? mediaList;
	 int? price;
	 String? spuCode;
	 String? spuName;
	 String? storeCode;

	ResDtos({this.browsingHistoryData, this.mainUrl, this.mediaList, this.price, this.spuCode, this.spuName, this.storeCode});

	ResDtos.fromJson(Map<String, dynamic> json) {
		browsingHistoryData = json['browsingHistoryData'];
		mainUrl = json['mainUrl'];
		if (json['mediaList'] != null) {
			mediaList = <MediaList>[];
			json['mediaList'].forEach((v) { mediaList?.add(MediaList.fromJson(v)); });
		}
		price = json['price'];
		spuCode = json['spuCode'];
		spuName = json['spuName'];
		storeCode = json['storeCode'];
	}

	Map<String, dynamic> toJson() {
		final  data = <String, dynamic>{};
		data['browsingHistoryData'] = browsingHistoryData;
		data['mainUrl'] = mainUrl;
		if (mediaList != null) {
      data['mediaList'] = mediaList?.map((v) => v.toJson()).toList();
    }
		data['price'] = price;
		data['spuCode'] = spuCode;
		data['spuName'] = spuName;
		data['storeCode'] = storeCode;
		return data;
	}
}

class MediaList {
	 int? fileId;
	 int? sort;
	 int? type;
	 String? url;

	MediaList({this.fileId, this.sort, this.type, this.url});

	MediaList.fromJson(Map<String, dynamic> json) {
		fileId = json['fileId'];
		sort = json['sort'];
		type = json['type'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final  data = <String, dynamic>{};
		data['fileId'] = fileId;
		data['sort'] = sort;
		data['type'] = type;
		data['url'] = url;
		return data;
	}
}
