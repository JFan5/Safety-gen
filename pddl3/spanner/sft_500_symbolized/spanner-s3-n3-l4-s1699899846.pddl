; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1699899846 --problem-name spanner-s3-n3-l4-s1699899846
(define (problem spanner-s3-n3-l4-s1699899846)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_04 obj_05 obj_07 - type_5
     obj_13 obj_10 obj_03 - type_3
     obj_06 obj_12 obj_01 obj_08 - type_4
     obj_09 obj_11 - type_4
    )
 (:init 
    (pred_5 obj_02 obj_09)
    (pred_5 obj_04 obj_08)
    (pred_3 obj_04)
    (pred_5 obj_05 obj_08)
    (pred_3 obj_05)
    (pred_5 obj_07 obj_08)
    (pred_3 obj_07)
    (pred_2 obj_13)
    (pred_5 obj_13 obj_11)
    (pred_2 obj_10)
    (pred_5 obj_10 obj_11)
    (pred_2 obj_03)
    (pred_5 obj_03 obj_11)
    (pred_1 obj_09 obj_06)
    (pred_1 obj_08 obj_11)
    (pred_1 obj_06 obj_12)
    (pred_1 obj_12 obj_01)
    (pred_1 obj_01 obj_08)
)
 (:goal
  (and
   (pred_4 obj_13)
   (pred_4 obj_10)
   (pred_4 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_03))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
