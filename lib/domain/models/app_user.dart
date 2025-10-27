class AppUser {
  final String id;
  final String? email;
  final String? phone;
  final String? name;
  final String? role;
  final String createdAt;
  final String? updatedAt;

  AppUser({
    required this.id,
    this.email,
    this.phone,
    this.name,
    this.role,
    required this.createdAt,
    this.updatedAt,
  });

  AppUser copyWith({
    String? id,
    String? email,
    String? phone,
    String? name,
    String? role,
    String? createdAt,
    String? updatedAt,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'phone': phone,
      'name': name,
      'role': role,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  @override
  String toString() {
    return 'AppUser(id: $id, email: $email, phone: $phone, name: $name)';
  }
}
