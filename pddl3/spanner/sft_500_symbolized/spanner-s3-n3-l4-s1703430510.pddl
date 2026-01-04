; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1703430510 --problem-name spanner-s3-n3-l4-s1703430510
(define (problem spanner-s3-n3-l4-s1703430510)
 (:domain spanner)
 (:objects 
     obj_12 - type_1
     obj_04 obj_01 obj_09 - type_5
     obj_11 obj_03 obj_08 - type_4
     obj_05 obj_13 obj_06 obj_10 - type_2
     obj_02 obj_07 - type_2
    )
 (:init 
    (pred_5 obj_12 obj_02)
    (pred_5 obj_04 obj_06)
    (pred_1 obj_04)
    (pred_5 obj_01 obj_10)
    (pred_1 obj_01)
    (pred_5 obj_09 obj_05)
    (pred_1 obj_09)
    (pred_3 obj_11)
    (pred_5 obj_11 obj_07)
    (pred_3 obj_03)
    (pred_5 obj_03 obj_07)
    (pred_3 obj_08)
    (pred_5 obj_08 obj_07)
    (pred_6 obj_02 obj_05)
    (pred_6 obj_10 obj_07)
    (pred_6 obj_05 obj_13)
    (pred_6 obj_13 obj_06)
    (pred_6 obj_06 obj_10)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_03)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_02)))
  )
)
)
