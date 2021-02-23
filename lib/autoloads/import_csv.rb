class ImportCsv
  #csvデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    #インポートする配列を格納する空配列
    list = []
    #csvからインポートしたデータを配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    #メソッドの戻り値をインポートしたデータの配列とする
    list
  end

  def self.user_data
    #インポートクラスメソッドを呼び出し、ユーザーデータの配列を生成
    list = import('db/csv_data/user_data.csv')

    puts "インポート処理開始"
    User.create!(list)
    puts "インポート処理終了"
  end
end
