; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1079695746 --problem-name spanner-s3-n3-l4-s1079695746
(define (problem spanner-s3-n3-l4-s1079695746)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_05 obj_10 obj_09 - type_3
     obj_08 obj_04 obj_12 - type_2
     obj_13 obj_03 obj_07 obj_06 - type_5
     obj_02 obj_11 - type_5
    )
 (:init 
    (pred_1 obj_01 obj_02)
    (pred_1 obj_05 obj_03)
    (pred_2 obj_05)
    (pred_1 obj_10 obj_13)
    (pred_2 obj_10)
    (pred_1 obj_09 obj_07)
    (pred_2 obj_09)
    (pred_3 obj_08)
    (pred_1 obj_08 obj_11)
    (pred_3 obj_04)
    (pred_1 obj_04 obj_11)
    (pred_3 obj_12)
    (pred_1 obj_12 obj_11)
    (pred_5 obj_02 obj_13)
    (pred_5 obj_06 obj_11)
    (pred_5 obj_13 obj_03)
    (pred_5 obj_03 obj_07)
    (pred_5 obj_07 obj_06)
)
 (:goal
  (and
   (pred_4 obj_08)
   (pred_4 obj_04)
   (pred_4 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_08)) (not (pred_4 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
