class AnswersController < ApplicationController
    # 回答の登録
    def create
        # Question modelを初期化
        p params
        @question = Question.find(params[:question_id])
        # p @question
        @question.answers.create(answer_params)
        redirect_to question_path(@question)

        # Question modelをdbへ保存
        #if @question.save

            # showへリダイレクト
            #redirect_to @question
        #else 

            # validationに引っ掛かったらnewへ
            # render → viewファイルを指定してレンダーできるメソッド
            # unprocessable_entity → validation error時のstatus code (422)
            #render 'new' ,status: :unprocessable_entity
        #end

    end


    # 回答の削除
    def destroy
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
        @answer.destroy
        redirect_to @question, status: :see_other
    end

    private
    def answer_params
        params.require(:answer).permit(:name, :content)
    end
end
