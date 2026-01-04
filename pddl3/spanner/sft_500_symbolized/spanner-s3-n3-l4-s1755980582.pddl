; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1755980582 --problem-name spanner-s3-n3-l4-s1755980582
(define (problem spanner-s3-n3-l4-s1755980582)
 (:domain spanner)
 (:objects 
     obj_03 - type_4
     obj_07 obj_06 obj_05 - type_5
     obj_10 obj_11 obj_12 - type_2
     obj_04 obj_02 obj_09 obj_08 - type_3
     obj_01 obj_13 - type_3
    )
 (:init 
    (pred_1 obj_03 obj_01)
    (pred_1 obj_07 obj_04)
    (pred_4 obj_07)
    (pred_1 obj_06 obj_02)
    (pred_4 obj_06)
    (pred_1 obj_05 obj_04)
    (pred_4 obj_05)
    (pred_6 obj_10)
    (pred_1 obj_10 obj_13)
    (pred_6 obj_11)
    (pred_1 obj_11 obj_13)
    (pred_6 obj_12)
    (pred_1 obj_12 obj_13)
    (pred_5 obj_01 obj_04)
    (pred_5 obj_08 obj_13)
    (pred_5 obj_04 obj_02)
    (pred_5 obj_02 obj_09)
    (pred_5 obj_09 obj_08)
)
 (:goal
  (and
   (pred_2 obj_10)
   (pred_2 obj_11)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
