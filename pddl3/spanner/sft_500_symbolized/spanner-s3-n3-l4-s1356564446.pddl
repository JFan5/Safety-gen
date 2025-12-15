; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1356564446 --problem-name spanner-s3-n3-l4-s1356564446
(define (problem spanner-s3-n3-l4-s1356564446)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_03 obj_09 obj_08 - type_5
     obj_11 obj_10 obj_04 - type_4
     obj_06 obj_13 obj_12 obj_05 - type_1
     obj_07 obj_02 - type_1
    )
 (:init 
    (pred_5 obj_01 obj_07)
    (pred_5 obj_03 obj_06)
    (pred_6 obj_03)
    (pred_5 obj_09 obj_13)
    (pred_6 obj_09)
    (pred_5 obj_08 obj_12)
    (pred_6 obj_08)
    (pred_2 obj_11)
    (pred_5 obj_11 obj_02)
    (pred_2 obj_10)
    (pred_5 obj_10 obj_02)
    (pred_2 obj_04)
    (pred_5 obj_04 obj_02)
    (pred_4 obj_07 obj_06)
    (pred_4 obj_05 obj_02)
    (pred_4 obj_06 obj_13)
    (pred_4 obj_13 obj_12)
    (pred_4 obj_12 obj_05)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_10)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_07)))
  )
)
)
