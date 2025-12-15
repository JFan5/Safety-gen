; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1629001546 --problem-name spanner-s3-n3-l4-s1629001546
(define (problem spanner-s3-n3-l4-s1629001546)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_04 obj_07 obj_05 - type_1
     obj_06 obj_13 obj_03 - type_3
     obj_01 obj_12 obj_11 obj_10 - type_2
     obj_08 obj_02 - type_2
    )
 (:init 
    (pred_2 obj_09 obj_08)
    (pred_2 obj_04 obj_01)
    (pred_4 obj_04)
    (pred_2 obj_07 obj_10)
    (pred_4 obj_07)
    (pred_2 obj_05 obj_11)
    (pred_4 obj_05)
    (pred_6 obj_06)
    (pred_2 obj_06 obj_02)
    (pred_6 obj_13)
    (pred_2 obj_13 obj_02)
    (pred_6 obj_03)
    (pred_2 obj_03 obj_02)
    (pred_1 obj_08 obj_01)
    (pred_1 obj_10 obj_02)
    (pred_1 obj_01 obj_12)
    (pred_1 obj_12 obj_11)
    (pred_1 obj_11 obj_10)
)
 (:goal
  (and
   (pred_5 obj_06)
   (pred_5 obj_13)
   (pred_5 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_06)) (not (pred_5 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
