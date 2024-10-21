// dart run src/merge_sort/merge_sort.dart
void main() {
  List<int> list = [8, 6, 7, 7, 5, 4, 3, 2, 1]; // for demonstration purpose i used simple list from 8-1
  print("Given Array is :\n$list");
  List<int> sortedList = mergeSort(list);
  print("Sorted Array is :\n$sortedList");
}

List<int> mergeSort(List<int> list) {
  if (list.length <= 1) {
    return list;
  }

  final midPoint = list.length ~/ 2;

  final leftList = mergeSort(list.sublist(0, midPoint));
  final rightList = mergeSort(list.sublist(midPoint));

  return merge(leftList, rightList);
}

List<int> merge(List<int> left, List<int> right) {
  final List<int> result = [];
  int i = 0;
  int j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  while (i < left.length) {
    result.add(left[i]);
    i++;
  }
  while (j < right.length) {
    result.add(right[j]);
    j++;
  }

  return result;
}
