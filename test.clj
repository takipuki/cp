#! /usr/bin/env bb
; vim: set ft=clojure ai si :

(require '[babashka.process :refer [shell]])

(defn lines [s]
  (str/split s #" *\n+ *"))

(defn cmp [ans out]
  (let [ans (str/split-lines ans)
        out (str/split-lines out)]
    (doseq [[ansline outline] (map vector ans out)]
      (if (= ansline outline)
        (printf "%-35s   %-35s\n" ansline outline)
        (printf "%-35s | %-35s\n" ansline outline)))))

(defn run [tc in]
  (let [proc (shell {:in in :out :string :err :string :continue true} "./main")]
    (if (not (= 0 (:exit proc)))
      (do
        (printf "TEST#%d FAILED\n" tc)
        (System/exit 1))
      (:out proc))))

(let [tests (as-> (slurp "in.txt") _
              (str/split _ #"[Ii]nput\n")
              (map #(str/split % #"[Oo]utput:?\n") _)
              (map vector (range 1 (inc (count _))) _))]
  (doseq [[tc [in ans]] tests]
    (cmp ans (run tc in))))

