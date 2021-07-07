class Caster {
  static T Cast<T>(x) => x is T ? x : null;
}
