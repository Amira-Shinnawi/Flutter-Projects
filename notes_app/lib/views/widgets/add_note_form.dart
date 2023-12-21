import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/helper/show_snakbar.dart';
import 'package:notes_app/models/note_model.dart';

import '../../cubits/add_note_cubit/add_note_cubit.dart';
import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field..dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    validationUser(context);
                    showSnackBar(context, 'Adding notes successfully');
                  },
                  buttonName: 'Add');
            },
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  void validationUser(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var noteModel = NoteModel(
          title: title!,
          subTitle: subTitle!,
          date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
          color: Colors.amber.value);
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
