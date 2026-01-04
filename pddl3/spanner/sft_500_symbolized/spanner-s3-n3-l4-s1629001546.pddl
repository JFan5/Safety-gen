; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1629001546 --problem-name spanner-s3-n3-l4-s1629001546
(define (problem spanner-s3-n3-l4-s1629001546)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_01 obj_12 obj_10 - type_4
     obj_06 obj_08 obj_02 - type_1
     obj_05 obj_13 obj_03 obj_11 - type_2
     obj_07 obj_04 - type_2
    )
 (:init 
    (pred_5 obj_09 obj_07)
    (pred_5 obj_01 obj_05)
    (pred_1 obj_01)
    (pred_5 obj_12 obj_11)
    (pred_1 obj_12)
    (pred_5 obj_10 obj_03)
    (pred_1 obj_10)
    (pred_3 obj_06)
    (pred_5 obj_06 obj_04)
    (pred_3 obj_08)
    (pred_5 obj_08 obj_04)
    (pred_3 obj_02)
    (pred_5 obj_02 obj_04)
    (pred_2 obj_07 obj_05)
    (pred_2 obj_11 obj_04)
    (pred_2 obj_05 obj_13)
    (pred_2 obj_13 obj_03)
    (pred_2 obj_03 obj_11)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_08)
   (pred_6 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_06)) (not (pred_6 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_07)))
  )
)
)
