; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 533514900 --problem-name spanner-s3-n2-l4-s533514900
(define (problem spanner-s3-n2-l4-s533514900)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_10 obj_12 obj_05 - type_3
     obj_04 obj_03 - type_5
     obj_07 obj_11 obj_06 obj_08 - type_2
     obj_02 obj_01 - type_2
    )
 (:init 
    (pred_6 obj_09 obj_02)
    (pred_6 obj_10 obj_11)
    (pred_4 obj_10)
    (pred_6 obj_12 obj_07)
    (pred_4 obj_12)
    (pred_6 obj_05 obj_11)
    (pred_4 obj_05)
    (pred_5 obj_04)
    (pred_6 obj_04 obj_01)
    (pred_5 obj_03)
    (pred_6 obj_03 obj_01)
    (pred_1 obj_02 obj_07)
    (pred_1 obj_08 obj_01)
    (pred_1 obj_07 obj_11)
    (pred_1 obj_11 obj_06)
    (pred_1 obj_06 obj_08)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
