; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1574503197 --problem-name spanner-s3-n3-l4-s1574503197
(define (problem spanner-s3-n3-l4-s1574503197)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_12 obj_02 obj_03 - type_2
     obj_11 obj_01 obj_08 - type_5
     obj_05 obj_13 obj_09 obj_06 - type_4
     obj_07 obj_04 - type_4
    )
 (:init 
    (pred_1 obj_10 obj_07)
    (pred_1 obj_12 obj_05)
    (pred_5 obj_12)
    (pred_1 obj_02 obj_05)
    (pred_5 obj_02)
    (pred_1 obj_03 obj_05)
    (pred_5 obj_03)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_04)
    (pred_4 obj_01)
    (pred_1 obj_01 obj_04)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_04)
    (pred_3 obj_07 obj_05)
    (pred_3 obj_06 obj_04)
    (pred_3 obj_05 obj_13)
    (pred_3 obj_13 obj_09)
    (pred_3 obj_09 obj_06)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_01)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
