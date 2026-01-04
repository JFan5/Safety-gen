; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1663495122 --problem-name spanner-s3-n2-l4-s1663495122
(define (problem spanner-s3-n2-l4-s1663495122)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_01 obj_02 obj_06 - type_1
     obj_04 obj_03 - type_3
     obj_08 obj_10 obj_12 obj_05 - type_4
     obj_11 obj_09 - type_4
    )
 (:init 
    (pred_3 obj_07 obj_11)
    (pred_3 obj_01 obj_10)
    (pred_6 obj_01)
    (pred_3 obj_02 obj_08)
    (pred_6 obj_02)
    (pred_3 obj_06 obj_08)
    (pred_6 obj_06)
    (pred_1 obj_04)
    (pred_3 obj_04 obj_09)
    (pred_1 obj_03)
    (pred_3 obj_03 obj_09)
    (pred_2 obj_11 obj_08)
    (pred_2 obj_05 obj_09)
    (pred_2 obj_08 obj_10)
    (pred_2 obj_10 obj_12)
    (pred_2 obj_12 obj_05)
)
 (:goal
  (and
   (pred_4 obj_04)
   (pred_4 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_04)) (not (pred_4 obj_03))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
