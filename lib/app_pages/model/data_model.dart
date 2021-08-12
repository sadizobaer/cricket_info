// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  late String status;
  late Response response;
  late String etag;
  late String modified;
  late String datetime;
  late String apiVersion;

  DataModel(
      { required this.status,
        required this.response,
        required this.etag,
        required this.modified,
        required this.datetime,
        required this.apiVersion });

  DataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = (json['response'] != null ? new Response.fromJson(json['response']) : null)!;
    etag = json['etag'];
    modified = json['modified'];
    datetime = json['datetime'];
    apiVersion = json['api_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['response'] = this.response.toJson();
    data['etag'] = this.etag;
    data['modified'] = this.modified;
    data['datetime'] = this.datetime;
    data['api_version'] = this.apiVersion;
    return data;
  }
}

class Response {
  late List<Items> items;
  late int totalItems;
  late int totalPages;

  Response({required this.items, required this.totalItems, required this.totalPages});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    totalItems = json['total_items'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = this.items.map((v) => v.toJson()).toList();
    data['total_items'] = this.totalItems;
    data['total_pages'] = this.totalPages;
    return data;
  }
}

class Items {
  late int matchId;
  late String title;
  late String shortTitle;
  late String subtitle;
  late int format;
  late String formatStr;
  late int status;
  late String statusStr;
  late String statusNote;
  late String verified;
  late String preSquad;
  late String oddsAvailable;
  late int gameState;
  late String gameStateStr;
  late String domestic;
  late Competition competition;
  late Teama teama;
  late Teamb teamb;
  late String dateStart;
  late String dateEnd;
  late int timestampStart;
  late int timestampEnd;
  late Venue venue;
  late String umpires;
  late String referee;
  late String equation;
  late String live;
  late String result;
  late String resultType;
  late String winMargin;
  late int winningTeamId;
  late int commentary;
  late int wagon;
  late int latestInningNumber;
  late Toss toss;

  Items(
      { required this.matchId,
        required this.title,
        required this.shortTitle,
        required this.subtitle,
        required this.format,
        required this.formatStr,
        required this.status,
        required this.statusStr,
        required this.statusNote,
        required this.verified,
        required this.preSquad,
        required this.oddsAvailable,
        required this.gameState,
        required this.gameStateStr,
        required this.domestic,
        required this.competition,
        required this.teama,
        required this.teamb,
        required this.dateStart,
        required this.dateEnd,
        required this.timestampStart,
        required this.timestampEnd,
        required this.venue,
        required this.umpires,
        required this.referee,
        required this.equation,
        required this.live,
        required this.result,
        required this.resultType,
        required this.winMargin,
        required this.winningTeamId,
        required this.commentary,
        required this.wagon,
        required this.latestInningNumber,
        required this.toss});

  Items.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    title = json['title'];
    shortTitle = json['short_title'];
    subtitle = json['subtitle'];
    format = json['format'];
    formatStr = json['format_str'];
    status = json['status'];
    statusStr = json['status_str'];
    statusNote = json['status_note'];
    verified = json['verified'];
    preSquad = json['pre_squad'];
    oddsAvailable = json['odds_available'];
    gameState = json['game_state'];
    gameStateStr = json['game_state_str'];
    domestic = json['domestic'];
    competition = (json['competition'] != null ? new Competition.fromJson(json['competition']) : null)!;
    teama = (json['teama'] != null ? new Teama.fromJson(json['teama']) : null)!;
    teamb = (json['teamb'] != null ? new Teamb.fromJson(json['teamb']) : null)!;
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    timestampStart = json['timestamp_start'];
    timestampEnd = json['timestamp_end'];
    venue = (json['venue'] != null ? new Venue.fromJson(json['venue']) : null)!;
    umpires = json['umpires'];
    referee = json['referee'];
    equation = json['equation'];
    live = json['live'];
    result = json['result'];
    resultType = json['result_type'];
    winMargin = json['win_margin'];
    winningTeamId = json['winning_team_id'];
    commentary = json['commentary'];
    wagon = json['wagon'];
    latestInningNumber = json['latest_inning_number'];
    toss = (json['toss'] != null ? new Toss.fromJson(json['toss']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['match_id'] = this.matchId;
    data['title'] = this.title;
    data['short_title'] = this.shortTitle;
    data['subtitle'] = this.subtitle;
    data['format'] = this.format;
    data['format_str'] = this.formatStr;
    data['status'] = this.status;
    data['status_str'] = this.statusStr;
    data['status_note'] = this.statusNote;
    data['verified'] = this.verified;
    data['pre_squad'] = this.preSquad;
    data['odds_available'] = this.oddsAvailable;
    data['game_state'] = this.gameState;
    data['game_state_str'] = this.gameStateStr;
    data['domestic'] = this.domestic;
    data['competition'] = this.competition.toJson();
    data['teama'] = this.teama.toJson();
    data['teamb'] = this.teamb.toJson();
    data['date_start'] = this.dateStart;
    data['date_end'] = this.dateEnd;
    data['timestamp_start'] = this.timestampStart;
    data['timestamp_end'] = this.timestampEnd;
    data['venue'] = this.venue.toJson();
    data['umpires'] = this.umpires;
    data['referee'] = this.referee;
    data['equation'] = this.equation;
    data['live'] = this.live;
    data['result'] = this.result;
    data['result_type'] = this.resultType;
    data['win_margin'] = this.winMargin;
    data['winning_team_id'] = this.winningTeamId;
    data['commentary'] = this.commentary;
    data['wagon'] = this.wagon;
    data['latest_inning_number'] = this.latestInningNumber;
    data['toss'] = this.toss.toJson();
    return data;
  }
}

class Competition {
  late int cid;
  late String title;
  late String abbr;
  late String type;
  late String category;
  late String matchFormat;
  late String status;
  late String season;
  late String datestart;
  late String dateend;
  late String country;
  late String totalMatches;
  late String totalRounds;
  late String totalTeams;

  Competition(
      { required this.cid,
        required this.title,
        required this.abbr,
        required this.type,
        required this.category,
        required this.matchFormat,
        required this.status,
        required this.season,
        required this.datestart,
        required this.dateend,
        required this.country,
        required this.totalMatches,
        required this.totalRounds,
        required this.totalTeams });

  Competition.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    title = json['title'];
    abbr = json['abbr'];
    type = json['type'];
    category = json['category'];
    matchFormat = json['match_format'];
    status = json['status'];
    season = json['season'];
    datestart = json['datestart'];
    dateend = json['dateend'];
    country = json['country'];
    totalMatches = json['total_matches'];
    totalRounds = json['total_rounds'];
    totalTeams = json['total_teams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['title'] = this.title;
    data['abbr'] = this.abbr;
    data['type'] = this.type;
    data['category'] = this.category;
    data['match_format'] = this.matchFormat;
    data['status'] = this.status;
    data['season'] = this.season;
    data['datestart'] = this.datestart;
    data['dateend'] = this.dateend;
    data['country'] = this.country;
    data['total_matches'] = this.totalMatches;
    data['total_rounds'] = this.totalRounds;
    data['total_teams'] = this.totalTeams;
    return data;
  }
}

class Teama {
  late int teamId;
  late String name;
  late String shortName;
  late String logoUrl;
  late String scoresFull;
  late String scores;
  late String overs;

  Teama(
      { required this.teamId,
        required this.name,
        required this.shortName,
        required this.logoUrl,
        required this.scoresFull,
        required this.scores,
        required this.overs });

  Teama.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
    name = json['name'];
    shortName = json['short_name'];
    logoUrl = json['logo_url'];
    scoresFull = json['scores_full'];
    scores = json['scores'];
    overs = json['overs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team_id'] = this.teamId;
    data['name'] = this.name;
    data['short_name'] = this.shortName;
    data['logo_url'] = this.logoUrl;
    data['scores_full'] = this.scoresFull;
    data['scores'] = this.scores;
    data['overs'] = this.overs;
    return data;
  }
}

class Teamb {
  late int teamId;
  late String name;
  late String shortName;
  late String logoUrl;
  late String scoresFull;

  Teamb(
      { required this.teamId,
        required this.name,
        required this.shortName,
        required this.logoUrl,
        required this.scoresFull });

  Teamb.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
    name = json['name'];
    shortName = json['short_name'];
    logoUrl = json['logo_url'];
    scoresFull = json['scores_full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team_id'] = this.teamId;
    data['name'] = this.name;
    data['short_name'] = this.shortName;
    data['logo_url'] = this.logoUrl;
    data['scores_full'] = this.scoresFull;
    return data;
  }
}

class Venue {
  late String venueId;
  late String name;
  late String location;
  late String timezone;

  Venue({ required this.venueId,
    required this.name,
    required this.location,
    required this.timezone });

  Venue.fromJson(Map<String, dynamic> json) {
    venueId = json['venue_id'];
    name = json['name'];
    location = json['location'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['venue_id'] = this.venueId;
    data['name'] = this.name;
    data['location'] = this.location;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Toss {
  late String text;
  late int winner;
  late int decision;

  Toss({ required this.text,
    required this.winner,
    required this.decision});

  Toss.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    winner = json['winner'];
    decision = json['decision'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['winner'] = this.winner;
    data['decision'] = this.decision;
    return data;
  }
}
