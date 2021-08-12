// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  String? status;
  Response? response;
  String? etag;
  String? modified;
  String? datetime;
  String? apiVersion;

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
    data['response'] = this.response!.toJson();
    data['etag'] = this.etag;
    data['modified'] = this.modified;
    data['datetime'] = this.datetime;
    data['api_version'] = this.apiVersion;
    return data;
  }
}

class Response {
  List<Items>? items;
  int? totalItems;
  int? totalPages;

  Response({required this.items, required this.totalItems, required this.totalPages});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalItems = json['total_items'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = this.items!.map((v) => v.toJson()).toList();
    data['total_items'] = this.totalItems;
    data['total_pages'] = this.totalPages;
    return data;
  }
}

class Items {
   int? matchId;
   String? title;
   String? shortTitle;
   String? subtitle;
   int? format;
   String? formatStr;
   int? status;
   String? statusStr;
   String? statusNote;
   String? verified;
   String? preSquad;
   String? oddsAvailable;
   int? gameState;
   String? gameStateStr;
   String? domestic;
   Competition? competition;
   Teama? teama;
   Teamb? teamb;
   String? dateStart;
   String? dateEnd;
   int? timestampStart;
   int? timestampEnd;
   Venue? venue;
   String? umpires;
   String? referee;
   String? equation;
   String? live;
   String? result;
   String? resultType;
   String? winMargin;
   int? winningTeamId;
   int? commentary;
   int? wagon;
   int? latestInningNumber;
   Toss? toss;

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
    data['competition'] = this.competition!.toJson();
    data['teama'] = this.teama!.toJson();
    data['teamb'] = this.teamb!.toJson();
    data['date_start'] = this.dateStart;
    data['date_end'] = this.dateEnd;
    data['timestamp_start'] = this.timestampStart;
    data['timestamp_end'] = this.timestampEnd;
    data['venue'] = this.venue!.toJson();
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
    data['toss'] = this.toss!.toJson();
    return data;
  }
}

class Competition {
   int? cid;
   String? title;
   String? abbr;
   String? type;
   String? category;
   String? matchFormat;
   String? status;
   String? season;
   String? datestart;
   String? dateend;
   String? country;
   String? totalMatches;
   String? totalRounds;
   String? totalTeams;

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
  int? teamId;
  String? name;
  String? shortName;
  String? logoUrl;
  String? scoresFull;
  String? scores;
  String? overs;

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
   int? teamId;
   String? name;
   String? shortName;
   String? logoUrl;
   String? scoresFull;

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
   String? venueId;
   String? name;
   String? location;
   String? timezone;

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
   String? text;
   int? winner;
   int? decision;

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
