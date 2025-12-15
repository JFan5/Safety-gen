; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 676682136 --problem-name spanner-s3-n2-l4-s676682136
(define (problem spanner-s3-n2-l4-s676682136)
 (:domain spanner)
 (:objects 
     obj_11 - type_1
     obj_02 obj_12 obj_06 - type_2
     obj_10 obj_09 - type_3
     obj_05 obj_04 obj_07 obj_08 - type_4
     obj_01 obj_03 - type_4
    )
 (:init 
    (pred_5 obj_11 obj_01)
    (pred_5 obj_02 obj_04)
    (pred_6 obj_02)
    (pred_5 obj_12 obj_05)
    (pred_6 obj_12)
    (pred_5 obj_06 obj_05)
    (pred_6 obj_06)
    (pred_2 obj_10)
    (pred_5 obj_10 obj_03)
    (pred_2 obj_09)
    (pred_5 obj_09 obj_03)
    (pred_3 obj_01 obj_05)
    (pred_3 obj_08 obj_03)
    (pred_3 obj_05 obj_04)
    (pred_3 obj_04 obj_07)
    (pred_3 obj_07 obj_08)
)
 (:goal
  (and
   (pred_4 obj_10)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_09))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
