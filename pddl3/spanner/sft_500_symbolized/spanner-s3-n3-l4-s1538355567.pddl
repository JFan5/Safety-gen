; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1538355567 --problem-name spanner-s3-n3-l4-s1538355567
(define (problem spanner-s3-n3-l4-s1538355567)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_12 obj_02 obj_04 - type_2
     obj_13 obj_08 obj_06 - type_1
     obj_09 obj_03 obj_10 obj_07 - type_5
     obj_01 obj_05 - type_5
    )
 (:init 
    (pred_1 obj_11 obj_01)
    (pred_1 obj_12 obj_09)
    (pred_5 obj_12)
    (pred_1 obj_02 obj_07)
    (pred_5 obj_02)
    (pred_1 obj_04 obj_10)
    (pred_5 obj_04)
    (pred_4 obj_13)
    (pred_1 obj_13 obj_05)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_05)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_05)
    (pred_3 obj_01 obj_09)
    (pred_3 obj_07 obj_05)
    (pred_3 obj_09 obj_03)
    (pred_3 obj_03 obj_10)
    (pred_3 obj_10 obj_07)
)
 (:goal
  (and
   (pred_2 obj_13)
   (pred_2 obj_08)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
