; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1745039925 --problem-name spanner-s3-n3-l4-s1745039925
(define (problem spanner-s3-n3-l4-s1745039925)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_05 obj_13 obj_02 - type_4
     obj_04 obj_12 obj_10 - type_1
     obj_11 obj_08 obj_06 obj_03 - type_3
     obj_07 obj_01 - type_3
    )
 (:init 
    (pred_3 obj_09 obj_07)
    (pred_3 obj_05 obj_08)
    (pred_6 obj_05)
    (pred_3 obj_13 obj_08)
    (pred_6 obj_13)
    (pred_3 obj_02 obj_08)
    (pred_6 obj_02)
    (pred_1 obj_04)
    (pred_3 obj_04 obj_01)
    (pred_1 obj_12)
    (pred_3 obj_12 obj_01)
    (pred_1 obj_10)
    (pred_3 obj_10 obj_01)
    (pred_5 obj_07 obj_11)
    (pred_5 obj_03 obj_01)
    (pred_5 obj_11 obj_08)
    (pred_5 obj_08 obj_06)
    (pred_5 obj_06 obj_03)
)
 (:goal
  (and
   (pred_4 obj_04)
   (pred_4 obj_12)
   (pred_4 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_04)) (not (pred_4 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
