// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

EventModel eventFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventToJson(EventModel data) => json.encode(data.toJson());

class EventModel {

    String uid;
    String companyId;
    String projectId;
    int latitude;
    int longitude;
    DateTime eventDate;
    DateTime resolvedDate;
    bool resolved;

    EventModel({
        this.uid,
        this.companyId,
        this.projectId,
        this.latitude,
        this.longitude,
        this.eventDate,
        this.resolvedDate,
        this.resolved,
    });

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        uid           : json["uid"],
        companyId     : json["companyId"],
        projectId     : json["projectId"],
        latitude      : json["latitude"],
        longitude     : json["longitude"],
        eventDate     : json["eventDate"],
        resolvedDate  : json["resolvedDate"],
        resolved      : json["resolved"],
    );

    Map<String, dynamic> toJson() => {
        "uid"           : uid,
        "companyId"     : companyId,
        "projectId"     : projectId,
        "latitude"      : latitude,
        "longitude"     : longitude,
        "eventDate"     : eventDate,
        "resolvedDate"  : resolvedDate,
        "resolved"      : resolved,
    };  
}