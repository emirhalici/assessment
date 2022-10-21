import 'dart:convert';

class LeadModel {
  String firstName;
  String lastName;
  String address;
  String assignedManagerName;
  LeadModel({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.assignedManagerName,
  });

  LeadModel copyWith({
    String? firstName,
    String? lastName,
    String? address,
    String? assignedManagerName,
  }) {
    return LeadModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      assignedManagerName: assignedManagerName ?? this.assignedManagerName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'assignedManagerName': assignedManagerName,
    };
  }

  factory LeadModel.fromMap(Map<String, dynamic> map) {
    return LeadModel(
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      address: map['address'] as String,
      assignedManagerName: map['assigned_manager']['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeadModel.fromJson(String source) => LeadModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LeadModel(firstName: $firstName, lastName: $lastName, address: $address, assignedManagerName: $assignedManagerName)';
  }

  @override
  bool operator ==(covariant LeadModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.address == address &&
        other.assignedManagerName == assignedManagerName;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^ lastName.hashCode ^ address.hashCode ^ assignedManagerName.hashCode;
  }

  static List<LeadModel> fromMapList(List<dynamic> map) {
    List<LeadModel> list = [];

    try {
      for (final element in map) {
        list.add(LeadModel.fromMap(element));
      }
    } catch (e) {
      return <LeadModel>[];
    }

    return list;
  }
}
