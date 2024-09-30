import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:quiz_admin/Soreboard.dart';
import 'package:quiz_admin/constants.dart';

Uint8List imageBytes = Uint8List(0);
int responseCode = 0;
String api = "https://mzcet.in/techquest24/QuizApi/Admin";

Future get_login() async {
  final response = await http.get(
    Uri.parse('$api/Teams.php'),
  );
  if (response.statusCode == 200) {
    teams = json.decode(response.body);
    print(teams);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future<void> update_login() async {
  final response = await http.post(
    Uri.parse('$api/updatestatus.php'),
    body: json.encode({"team_id": team_id}),
    headers: {
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    print("Success");
    print(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
    print(response.body);
  }
}

Future delete_login() async {
  final response = await http.post(
    Uri.parse('$api/Deleteteam.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'team_id': team_id}),
  );

  if (response.statusCode == 200) {
    print('Delete successful');
  } else {
    print('Error: ${response.statusCode}');
    print('Response: ${response.body}');
  }
}

Future insert_qustion_r1(question, question_no, option1, option2, option3,
    option4, answer, img) async {
  print(question);
  final response = await http.post(
    Uri.parse('$api/InsertR1.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode({
      "question": question,
      "question_no": question_no,
      "option1": option1,
      "option2": option2,
      "option3": option3,
      "option4": option4,
      "answer": answer,
      "img": img.toString()
    }),
  );

  print(response.body);
  if (response.statusCode == 200) {
    responseCode = 200;
  } else {
    responseCode = 500;
    //dialogue
    print('Request failed with status: ${response.statusCode}');
  }
}

Future insert_qustion_r2(question_no, answer, pic_count) async {
  final response = await http.post(
    Uri.parse('$api/InsertR2.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode({
      "question_no": question_no,
      "pic1": image1,
      "pic2": image2,
      "pic3": image3,
      "pic4": image4,
      "answer": answer.toString().toUpperCase(),
      "count": pic_count
    }),
  );

  if (response.statusCode == 200) {
    responseCode = 200;
  } else {
    responseCode = 500;
  }
}

Future insert_qustion_r3(
    question, question_no, option1, option2, option3, option4, answer) async {
  final response = await http.post(
    Uri.parse('$api/InsertR3.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode({
      "question": question,
      "question_no": question_no,
      "option1": option1,
      "option2": option2,
      "option3": option3,
      "option4": option4,
      "answer": answer
    }),
  );
  print(response.body);
  if (response.statusCode == 200) {
    responseCode = 200;
  } else {
    responseCode = 500;
    print('Request failed with status: ${response.statusCode}');
  }
}

Future get_Score() async {
  final response = await http.post(
    Uri.parse('$api/Scoreboard.php'),
    body: ({
      "round": score_round,
    }),
  );
  if (response.statusCode == 200) {
    score_board = jsonDecode(response.body);
    print(score_board);
    print("success");
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future update_qno(q_no) async {
  final response = await http.post(
    Uri.parse('$api/updateQues.php'),
    body: ({
      "no": q_no.toString(),
    }),
  );
  if (response.statusCode == 200) {
    print("success");
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future getr3() async {
  final response = await http.get(
    Uri.parse('$api/Scorer3.php'),
  );
  if (response.statusCode == 200) {
    ro = json.decode(response.body);
    print(ro);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future update_round(currentround) async {
  final response = await http.post(
    Uri.parse('$api/updateRound.php'),
    body: ({
      "round": currentround,
    }),
  );
  if (response.statusCode == 200) {
    print("success");
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future getQues() async {
  final response = await http.get(
    Uri.parse('$api/getQuestion.php'),
  );
  if (response.statusCode == 200) {
    cur_ques = json.decode(response.body);
    print(cur_ques[0]['question_no']);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future getr3info(qnumber) async {
  final response = await http.post(
    Uri.parse('$api/RapidControl.php'),
    body: ({
      "no": qnumber,
    }),
  );
  if (response.statusCode == 200) {
    rapidinfo = json.decode(response.body);
    print("success");
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}









// Future tests() async {
//   final response = await http.get(
//     Uri.parse('$api/test'),
//   );
//   if (response.statusCode == 200) {
//     res = json.decode(response.body);
//     urls = res[0]['PICTURE_1']['data'];
//   } else {
//     print('Request failed with status: ${response.statusCode}');
//   }
// }
