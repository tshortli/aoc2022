import XCTest
import aoc

final class Day04Tests: XCTestCase {
  let exampleInput = """
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
    """

  func testPart1Example() {
    let solver = Day04(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 2)
  }

  func testPart1() {
    let solver = Day04(input: puzzleInput)
    XCTAssertEqual(solver.part1Solution, 487)
  }

  func testPart2Example() {
    let solver = Day04(input: exampleInput)
    XCTAssertEqual(solver.part2Solution, 4)
  }

  func testPart2() {
    let solver = Day04(input: puzzleInput)
    XCTAssertEqual(solver.part2Solution, 849)
  }
}

fileprivate let puzzleInput = """
  51-88,52-87
  41-55,22-56
  6-74,74-86
  51-98,52-86
  8-77,3-94
  76-76,77-97
  29-42,29-35
  59-97,60-60
  9-86,27-86
  58-85,59-85
  23-41,26-39
  87-91,74-93
  13-83,83-84
  16-82,15-82
  15-95,14-96
  1-1,2-93
  3-87,2-74
  6-47,7-78
  47-68,47-92
  4-64,5-68
  14-14,8-45
  38-52,52-53
  8-19,25-85
  34-80,35-81
  64-64,64-80
  28-54,53-64
  10-97,16-98
  9-94,93-95
  15-67,16-67
  7-83,8-83
  6-95,90-99
  2-4,3-52
  21-50,20-50
  47-49,15-47
  4-38,7-38
  5-72,13-59
  7-82,2-7
  3-85,4-91
  11-79,6-9
  87-94,77-88
  10-10,8-12
  44-59,58-60
  94-97,5-90
  30-73,29-30
  1-87,10-78
  16-53,6-9
  26-88,27-53
  21-68,67-69
  49-62,50-61
  20-32,10-34
  28-29,21-31
  47-55,89-98
  84-85,23-85
  10-54,11-54
  52-92,19-51
  66-85,48-98
  43-44,44-85
  44-97,43-58
  24-76,68-70
  35-52,13-53
  46-62,43-80
  2-99,21-58
  29-73,28-29
  56-71,56-71
  16-80,14-81
  22-64,16-63
  42-59,42-74
  39-79,39-79
  21-98,20-98
  48-49,49-97
  9-88,10-88
  72-73,51-72
  7-81,6-82
  68-70,15-69
  98-99,70-75
  82-82,16-82
  38-42,38-80
  96-99,1-95
  46-92,45-45
  38-44,37-45
  94-97,93-96
  7-59,43-58
  2-86,85-87
  17-26,22-26
  6-68,5-10
  8-91,91-99
  7-93,13-93
  61-92,61-81
  40-67,30-68
  25-53,38-50
  2-64,3-98
  58-70,58-68
  57-89,57-89
  32-69,31-76
  14-90,4-90
  58-82,32-86
  47-70,46-69
  5-82,3-5
  7-47,42-43
  98-98,1-99
  60-84,60-83
  10-38,9-91
  12-98,10-99
  57-74,56-56
  11-96,10-11
  25-92,24-24
  61-82,99-99
  52-67,54-56
  2-81,1-81
  48-49,1-47
  22-68,36-69
  2-90,7-89
  24-57,31-56
  1-65,46-63
  1-87,39-86
  78-82,80-99
  66-68,35-74
  13-92,14-93
  32-80,32-40
  98-98,4-99
  98-98,2-7
  28-28,28-81
  27-53,15-54
  3-84,1-1
  3-34,9-31
  40-97,19-96
  13-60,7-60
  24-76,40-75
  91-92,5-91
  40-42,8-41
  73-75,28-74
  95-95,44-96
  13-16,16-74
  22-71,21-71
  7-7,5-15
  1-80,4-81
  36-71,37-72
  84-85,68-85
  16-63,12-12
  11-50,4-49
  30-94,10-95
  2-73,2-98
  10-85,10-85
  49-58,30-59
  48-67,15-32
  31-69,32-68
  71-94,70-98
  10-93,9-93
  5-5,6-95
  71-89,70-71
  41-66,6-42
  7-90,6-90
  78-79,17-78
  83-84,2-84
  2-99,1-99
  65-86,66-82
  44-49,44-46
  58-90,90-91
  7-38,8-97
  14-74,88-99
  54-91,53-88
  34-56,34-76
  13-55,14-55
  64-64,63-76
  24-89,4-92
  69-83,68-70
  11-92,10-95
  41-63,35-63
  42-65,43-64
  26-64,64-78
  25-47,16-20
  14-54,13-55
  77-77,76-93
  15-15,16-85
  67-71,66-70
  9-17,12-18
  12-95,12-95
  70-76,29-70
  6-13,7-12
  9-77,8-12
  57-94,7-57
  86-87,87-90
  45-89,63-98
  45-55,63-93
  81-82,7-81
  7-77,76-78
  19-58,9-19
  1-93,2-92
  57-83,56-58
  2-98,4-98
  1-18,1-9
  39-74,27-44
  5-73,3-95
  36-62,94-95
  62-73,61-81
  33-63,53-62
  34-45,33-33
  13-25,12-12
  91-92,25-91
  19-23,41-85
  4-10,24-92
  29-35,35-80
  19-23,22-76
  4-70,5-52
  4-90,3-89
  49-84,19-85
  7-65,6-6
  37-81,31-37
  18-77,76-76
  20-88,87-89
  16-91,79-90
  82-84,39-83
  3-23,39-47
  26-94,95-99
  8-98,7-9
  4-54,21-27
  5-78,20-79
  21-52,22-35
  4-53,2-77
  26-71,18-71
  11-71,12-12
  10-77,9-9
  88-97,41-87
  60-97,96-98
  2-7,8-60
  59-63,60-63
  81-82,31-81
  92-92,86-93
  75-82,16-75
  32-76,33-33
  69-93,70-93
  25-59,24-57
  56-57,41-69
  56-94,55-74
  6-94,28-58
  44-93,45-92
  44-44,44-92
  33-45,46-56
  4-55,11-54
  11-98,12-99
  35-61,37-61
  2-3,8-99
  2-2,4-29
  29-49,21-49
  4-17,19-85
  47-75,47-92
  11-12,11-98
  84-85,21-84
  55-99,54-96
  24-28,4-32
  22-88,21-23
  12-93,11-92
  13-80,13-79
  89-91,3-90
  16-72,57-59
  16-82,82-82
  26-39,13-19
  72-78,73-77
  18-87,96-98
  73-90,60-73
  44-44,3-95
  5-94,4-95
  28-68,29-49
  13-72,14-73
  10-99,5-98
  25-38,11-48
  30-98,97-99
  12-91,13-92
  1-85,2-20
  6-6,8-98
  16-86,86-94
  6-99,3-99
  77-81,3-76
  1-30,9-14
  43-74,42-43
  33-93,32-92
  3-68,4-69
  2-96,2-21
  65-81,80-88
  19-19,20-93
  14-41,32-34
  34-80,34-82
  3-81,9-82
  72-96,72-99
  16-43,42-60
  8-88,54-60
  92-94,93-95
  80-95,80-95
  81-82,29-81
  12-85,13-43
  5-93,91-92
  34-78,51-65
  10-75,9-75
  61-65,33-77
  18-18,19-97
  69-80,70-81
  90-92,68-91
  4-29,5-30
  71-80,70-83
  4-85,5-84
  99-99,26-87
  8-35,35-97
  64-66,30-65
  24-85,21-86
  4-9,10-92
  4-29,3-5
  11-72,11-72
  76-78,62-80
  38-80,48-79
  30-86,2-90
  14-98,15-87
  11-39,7-39
  6-99,7-7
  45-87,13-18
  13-84,12-12
  79-80,79-94
  22-81,23-29
  6-7,7-54
  8-75,9-19
  62-89,62-76
  54-99,53-99
  21-74,5-75
  44-44,46-81
  34-92,34-92
  94-94,11-95
  4-95,13-94
  65-68,67-97
  13-52,12-13
  3-17,17-18
  24-94,67-95
  57-74,56-56
  31-58,18-41
  71-78,70-71
  80-90,80-89
  64-75,4-65
  19-70,46-69
  2-5,4-79
  52-95,73-96
  28-57,15-90
  21-59,53-58
  10-27,6-10
  21-98,58-97
  81-93,82-93
  81-84,50-82
  19-29,20-25
  95-97,1-96
  3-65,38-39
  24-98,25-97
  42-69,15-43
  50-51,37-50
  17-97,16-84
  26-58,41-57
  25-66,24-24
  21-61,57-69
  7-83,6-84
  43-76,51-75
  26-30,32-87
  55-55,56-56
  41-58,57-87
  49-82,48-83
  25-46,45-45
  7-88,1-94
  8-89,7-8
  9-18,11-12
  19-94,94-97
  2-98,1-1
  40-60,41-85
  13-14,13-99
  30-34,29-33
  22-22,21-21
  27-28,25-27
  5-23,16-22
  37-54,54-72
  16-21,25-42
  33-70,47-70
  57-65,57-64
  78-78,15-79
  44-49,44-98
  27-56,20-33
  81-85,71-95
  91-92,1-92
  52-76,50-51
  21-94,21-94
  20-94,21-28
  57-60,59-98
  21-42,22-62
  48-48,42-52
  27-86,21-94
  63-96,63-96
  1-71,1-71
  5-48,47-80
  90-91,28-90
  13-67,13-65
  97-97,13-98
  6-20,7-55
  1-65,2-65
  83-98,98-99
  11-46,45-69
  6-68,6-55
  52-73,53-74
  77-82,77-80
  89-98,6-98
  63-65,17-64
  8-26,1-8
  11-79,3-12
  7-95,2-99
  92-99,50-93
  14-84,83-83
  1-99,1-99
  47-76,46-77
  3-55,2-56
  43-79,79-94
  14-64,43-65
  58-63,59-62
  5-99,2-5
  64-66,6-65
  17-91,16-90
  82-92,91-93
  15-77,16-47
  27-98,59-91
  18-93,17-90
  11-26,17-82
  75-83,66-83
  14-66,2-8
  21-73,74-89
  21-88,22-89
  40-40,60-84
  6-61,13-62
  9-96,7-7
  12-84,7-99
  14-70,9-17
  44-44,15-43
  1-55,2-56
  26-91,25-92
  76-87,36-86
  1-52,52-93
  28-41,27-40
  51-95,67-71
  49-78,34-79
  30-38,30-31
  7-99,6-6
  49-80,14-50
  7-98,9-92
  15-80,14-80
  10-86,8-11
  28-35,27-74
  1-9,10-60
  4-63,9-62
  36-37,36-36
  54-73,54-94
  24-91,92-92
  48-50,16-49
  26-41,26-41
  18-20,19-46
  11-16,16-88
  40-79,27-40
  4-53,4-53
  30-40,56-59
  97-99,2-98
  92-94,10-93
  12-64,12-64
  78-84,13-67
  25-27,26-65
  50-87,27-88
  32-57,18-33
  92-93,24-93
  1-12,12-33
  7-99,6-97
  14-58,3-57
  17-45,18-90
  9-35,29-34
  2-78,46-77
  3-39,23-39
  82-87,10-94
  64-75,64-74
  26-99,25-99
  15-97,96-98
  44-45,26-44
  52-97,34-38
  19-42,7-20
  9-72,31-73
  12-12,11-53
  4-4,6-90
  76-99,98-98
  53-55,54-95
  64-69,8-73
  11-97,14-98
  43-82,83-83
  14-47,13-47
  60-64,59-78
  87-88,1-87
  3-82,5-65
  4-4,5-98
  10-85,84-86
  37-99,37-99
  15-89,16-88
  10-97,9-99
  35-92,97-97
  77-97,78-98
  1-79,5-80
  26-35,27-65
  3-98,4-98
  63-63,1-64
  63-97,67-84
  5-7,9-69
  16-32,17-44
  12-98,13-13
  6-87,49-86
  91-91,24-92
  23-87,23-87
  10-26,16-26
  48-72,3-73
  38-39,38-61
  79-79,54-80
  42-42,43-48
  4-99,11-96
  17-70,18-49
  46-96,85-95
  13-77,14-14
  33-35,34-37
  38-43,42-43
  19-94,5-94
  24-26,25-91
  4-90,4-90
  94-99,30-40
  29-89,30-93
  63-95,20-96
  5-71,4-4
  31-54,21-54
  88-89,4-88
  5-88,2-98
  6-98,19-46
  2-63,96-98
  61-95,61-95
  22-79,21-65
  44-87,43-86
  18-93,34-92
  35-42,41-43
  5-73,16-72
  76-80,52-76
  11-20,7-75
  1-92,9-92
  81-83,45-82
  56-86,55-56
  27-62,18-22
  13-13,12-80
  30-69,31-87
  8-96,1-3
  53-53,52-78
  59-99,58-94
  48-71,5-48
  21-40,40-41
  37-64,40-65
  5-84,6-83
  4-98,12-99
  73-85,69-87
  46-79,21-47
  25-27,26-26
  9-17,8-90
  19-19,20-34
  59-98,58-58
  1-9,9-78
  3-3,4-92
  88-89,46-88
  3-91,2-91
  34-44,45-84
  1-88,2-89
  18-96,6-99
  48-79,39-83
  73-88,41-73
  3-93,6-60
  15-94,93-93
  12-80,11-79
  14-23,51-77
  23-24,3-28
  36-60,6-60
  43-48,44-57
  13-96,6-92
  54-91,53-92
  6-76,5-64
  5-28,26-29
  3-63,5-64
  20-49,30-49
  8-97,6-9
  4-72,8-71
  57-67,56-88
  51-65,25-65
  1-8,3-9
  64-91,64-99
  82-93,92-94
  53-74,4-96
  40-40,41-76
  11-85,52-84
  33-44,44-89
  3-95,95-96
  15-49,48-90
  17-96,95-97
  94-96,3-95
  2-92,3-93
  66-70,65-66
  6-82,53-82
  1-36,3-37
  78-84,71-85
  21-74,15-21
  21-68,42-89
  36-92,65-92
  59-83,59-81
  8-80,93-93
  16-93,5-13
  6-40,5-41
  2-13,13-98
  59-73,25-60
  52-75,68-74
  31-43,32-67
  22-71,22-70
  26-26,27-79
  21-22,23-87
  56-98,17-57
  48-49,13-48
  19-54,19-92
  11-38,10-11
  39-51,46-71
  2-58,57-57
  20-87,45-84
  25-37,21-26
  82-83,4-82
  72-96,73-96
  28-90,27-95
  1-4,3-98
  57-77,1-78
  27-88,21-88
  11-51,51-81
  40-94,79-93
  6-52,52-53
  17-98,18-77
  33-33,4-34
  15-38,8-8
  2-16,22-42
  1-95,96-96
  90-95,13-90
  10-63,9-97
  5-7,5-11
  6-94,93-93
  19-46,46-99
  19-72,20-73
  54-55,55-64
  10-96,7-7
  2-80,1-80
  8-96,6-9
  3-27,1-2
  6-77,5-76
  22-42,3-18
  4-5,3-4
  28-67,66-68
  1-94,99-99
  11-13,10-12
  79-80,74-79
  31-83,35-84
  63-63,59-67
  86-88,45-87
  2-93,2-52
  1-6,6-39
  16-70,27-37
  72-95,94-98
  3-82,3-81
  8-77,7-78
  7-8,9-96
  64-65,64-65
  35-88,34-89
  8-97,7-98
  2-94,4-95
  50-51,4-50
  5-98,1-4
  56-93,1-92
  33-33,34-98
  46-88,66-87
  35-97,34-97
  4-96,1-4
  68-72,69-72
  58-85,59-95
  18-96,72-97
  19-32,20-94
  16-63,15-63
  47-47,9-46
  96-97,18-97
  21-89,5-21
  9-42,20-41
  34-94,19-93
  60-76,59-80
  76-80,77-78
  13-94,23-94
  30-88,22-89
  34-34,35-87
  92-98,40-93
  20-99,20-99
  5-90,6-29
  6-78,40-79
  46-73,44-74
  1-96,37-95
  21-91,91-95
  6-85,3-85
  13-64,79-89
  41-82,81-90
  7-84,8-36
  23-30,23-30
  28-29,29-55
  98-99,13-98
  28-89,88-98
  95-98,94-94
  78-78,79-97
  81-81,81-82
  2-89,1-90
  27-29,28-62
  17-95,36-86
  1-99,3-97
  10-99,11-46
  24-53,23-83
  34-47,17-33
  7-66,7-89
  24-55,20-32
  40-41,18-40
  17-59,33-60
  59-82,60-62
  4-4,3-60
  25-94,24-94
  30-42,41-43
  69-69,5-68
  23-84,24-83
  13-71,13-76
  10-84,7-7
  57-86,51-61
  66-68,62-67
  9-85,10-86
  29-97,4-98
  95-96,46-95
  2-50,1-3
  24-72,6-24
  61-61,29-60
  24-28,24-72
  5-97,2-98
  1-88,16-72
  38-38,37-38
  18-94,66-93
  35-36,36-48
  45-98,45-99
  17-84,85-98
  26-26,25-34
  78-80,29-79
  31-43,30-30
  25-35,29-73
  20-93,27-92
  28-90,29-91
  17-32,31-32
  14-56,7-55
  39-96,3-12
  97-97,35-98
  18-34,35-51
  32-79,9-84
  30-32,13-31
  27-95,31-96
  30-30,31-44
  37-82,38-81
  8-85,7-62
  4-99,5-5
  11-13,12-64
  20-96,19-79
  52-72,29-53
  40-74,73-74
  15-54,16-36
  3-96,4-95
  13-14,16-87
  22-41,39-42
  60-65,59-59
  74-80,15-74
  61-61,4-60
  38-84,39-84
  6-16,6-6
  1-96,96-97
  1-98,97-98
  2-99,1-99
  25-96,12-24
  30-62,30-63
  4-88,5-89
  8-86,7-7
  12-97,4-97
  81-88,80-88
  8-82,6-6
  94-96,3-95
  2-98,1-99
  53-92,75-85
  18-18,19-95
  23-39,23-39
  5-94,93-93
  62-96,26-97
  1-98,35-97
  39-53,8-53
  10-67,9-66
  85-90,14-81
  10-69,11-39
  69-74,39-96
  12-35,12-35
  25-56,24-64
  20-76,75-77
  13-78,10-13
  3-43,43-80
  52-71,21-84
  40-48,33-96
  3-98,9-98
  29-38,37-39
  18-27,26-26
  6-82,4-89
  18-56,19-57
  28-76,6-77
  12-73,11-46
  10-40,11-41
  99-99,34-91
  32-91,91-94
  38-53,27-60
  36-88,35-89
  3-68,2-53
  6-85,6-85
  47-49,6-56
  31-92,30-92
  6-42,11-43
  1-1,9-64
  48-65,24-47
  18-65,2-5
  28-86,1-27
  4-26,5-94
  15-75,14-15
  11-48,10-19
  13-75,14-75
  51-90,47-89
  60-92,13-95
  14-57,14-57
  5-96,4-5
  27-33,20-32
  15-49,1-48
  44-70,43-56
  62-90,88-88
  38-58,13-80
  9-94,8-93
  42-88,42-52
  39-91,42-92
  4-74,75-81
  73-75,72-77
  49-78,50-67
  22-64,9-23
  3-89,55-60
  64-88,76-87
  29-60,60-92
  56-99,98-98
  45-96,19-95
  48-65,49-66
  59-88,90-91
  43-78,20-20
  24-65,15-24
  70-76,67-70
  24-99,25-98
  76-98,75-77
  34-56,34-56
  70-86,85-86
  33-98,32-99
  27-30,28-29
  72-99,72-97
  4-33,1-33
  22-95,21-96
  13-19,22-59
  59-77,6-59
  5-59,3-5
  20-61,60-62
  9-98,10-99
  11-91,19-86
  2-93,4-42
  33-41,61-65
  4-98,4-72
  50-68,13-51
  97-98,21-97
  21-72,22-71
  37-84,2-85
  2-85,18-85
  42-96,41-97
  29-84,52-66
  20-98,57-89
  3-91,3-91
  38-80,39-79
  89-89,11-88
  10-40,40-70
  39-80,38-87
  62-63,52-62
  1-52,2-52
  97-97,2-97
  5-59,58-58
  31-59,28-70
  27-88,21-24
  13-41,13-84
  3-42,3-42
  70-94,69-93
  16-53,15-52
  90-96,13-57
  63-75,60-76
  87-87,4-55
  3-44,4-85
  7-98,10-87
  2-65,3-65
  27-93,27-92
  35-54,34-53
  40-75,98-99
  14-14,13-53
  16-16,17-97
  39-96,41-96
  70-72,71-97
  35-35,32-36
  48-84,85-95
  7-81,11-81
  31-94,31-94
  1-2,4-72
  3-99,3-99
  92-94,21-28
  39-73,38-83
  6-57,6-57
  68-90,67-98
  9-81,10-82
  57-81,57-81
  16-59,57-60
  10-42,2-43
  14-77,12-15
  88-88,3-87
  88-89,13-89
  68-69,7-69
  63-92,92-98
  37-87,85-86
  4-56,5-22
  15-52,51-51
  92-93,74-92
  9-98,7-10
  17-17,18-53
  55-88,61-72
  38-81,65-78
  98-99,59-73
  17-22,18-22
  69-94,68-69
  84-85,6-84
  12-12,13-95
  8-34,7-8
  2-38,3-38
  20-29,28-80
  21-52,22-52
  36-91,90-92
  5-90,4-91
  1-41,1-36
  3-76,10-98
  14-41,2-14
  18-64,19-64
  37-93,83-92
  31-36,32-60
  53-83,47-84
  2-89,70-77
  28-83,84-84
  31-59,58-71
  10-98,10-87
  19-80,20-81
  11-17,9-18
  29-76,48-52
  10-33,33-65
  20-83,68-99
  14-43,13-13
  44-71,62-70
  59-63,49-64
  14-94,94-95
  5-89,2-2
  83-95,84-95
  2-9,8-93
  63-69,68-68
  73-75,5-74
  82-92,91-93
  5-5,4-57
  35-39,35-83
  71-83,56-83
  87-87,8-88
  95-98,2-30
  10-60,59-89
  13-23,25-93
  73-86,22-85
  32-47,46-90
  5-79,3-16
  20-92,28-69
  30-31,19-31
  41-70,9-36
  1-49,2-98
  1-96,41-96
  44-50,44-71
  1-28,2-27
  13-93,74-92
  37-38,31-37
  4-79,3-80
  14-50,37-37
  5-68,46-68
  23-63,22-63
  3-94,1-3
  """
