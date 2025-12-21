; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1079695746 --problem-name spanner-s3-n3-l4-s1079695746
(define (problem spanner-s3-n3-l4-s1079695746)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_07 obj_01 obj_02 - type_3
     obj_09 obj_10 obj_04 - type_1
     obj_13 obj_12 obj_11 obj_05 - type_2
     obj_06 obj_08 - type_2
    )
 (:init 
    (pred_6 obj_03 obj_06)
    (pred_6 obj_07 obj_12)
    (pred_5 obj_07)
    (pred_6 obj_01 obj_13)
    (pred_5 obj_01)
    (pred_6 obj_02 obj_11)
    (pred_5 obj_02)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_08)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_08)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_08)
    (pred_3 obj_06 obj_13)
    (pred_3 obj_05 obj_08)
    (pred_3 obj_13 obj_12)
    (pred_3 obj_12 obj_11)
    (pred_3 obj_11 obj_05)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_10)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
