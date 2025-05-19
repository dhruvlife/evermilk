class ReferralProgram {
  int? id;
  String? minimumRecharge;
  String? referrerBonus;
  String? refereeBonus;

  ReferralProgram({this.id, this.minimumRecharge, this.referrerBonus, this.refereeBonus});

  ReferralProgram.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    minimumRecharge = json['minimum_recharge'];
    referrerBonus = json['referrer_bonus'];
    refereeBonus = json['referee_bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['minimum_recharge'] = minimumRecharge;
    data['referrer_bonus'] = referrerBonus;
    data['referee_bonus'] = refereeBonus;
    return data;
  }
}
