class ValidateCustom {
  String? validatorEmpty({required String? value}) {
    if (value?.isEmpty == true) {
      return 'Không được để trống';
    }
    return null;
  }
}
