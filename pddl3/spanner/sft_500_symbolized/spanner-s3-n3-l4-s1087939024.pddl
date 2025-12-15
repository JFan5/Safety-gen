; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1087939024 --problem-name spanner-s3-n3-l4-s1087939024
(define (problem spanner-s3-n3-l4-s1087939024)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_09 obj_04 obj_03 - type_3
     obj_08 obj_05 obj_11 - type_1
     obj_12 obj_01 obj_10 obj_06 - type_5
     obj_07 obj_13 - type_5
    )
 (:init 
    (pred_4 obj_02 obj_07)
    (pred_4 obj_09 obj_10)
    (pred_1 obj_09)
    (pred_4 obj_04 obj_10)
    (pred_1 obj_04)
    (pred_4 obj_03 obj_01)
    (pred_1 obj_03)
    (pred_5 obj_08)
    (pred_4 obj_08 obj_13)
    (pred_5 obj_05)
    (pred_4 obj_05 obj_13)
    (pred_5 obj_11)
    (pred_4 obj_11 obj_13)
    (pred_3 obj_07 obj_12)
    (pred_3 obj_06 obj_13)
    (pred_3 obj_12 obj_01)
    (pred_3 obj_01 obj_10)
    (pred_3 obj_10 obj_06)
)
 (:goal
  (and
   (pred_6 obj_08)
   (pred_6 obj_05)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_05)) (not (pred_6 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_07)))
  )
)
)
