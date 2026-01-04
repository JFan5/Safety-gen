; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1905366472 --problem-name spanner-s3-n3-l4-s1905366472
(define (problem spanner-s3-n3-l4-s1905366472)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_02 obj_05 obj_10 - type_5
     obj_06 obj_13 obj_07 - type_3
     obj_04 obj_11 obj_03 obj_12 - type_2
     obj_09 obj_08 - type_2
    )
 (:init 
    (pred_4 obj_01 obj_09)
    (pred_4 obj_02 obj_12)
    (pred_6 obj_02)
    (pred_4 obj_05 obj_12)
    (pred_6 obj_05)
    (pred_4 obj_10 obj_12)
    (pred_6 obj_10)
    (pred_2 obj_06)
    (pred_4 obj_06 obj_08)
    (pred_2 obj_13)
    (pred_4 obj_13 obj_08)
    (pred_2 obj_07)
    (pred_4 obj_07 obj_08)
    (pred_3 obj_09 obj_04)
    (pred_3 obj_12 obj_08)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_11 obj_03)
    (pred_3 obj_03 obj_12)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_13)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_09)))
  )
)
)
