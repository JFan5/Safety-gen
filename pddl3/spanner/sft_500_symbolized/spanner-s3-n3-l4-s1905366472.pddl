; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1905366472 --problem-name spanner-s3-n3-l4-s1905366472
(define (problem spanner-s3-n3-l4-s1905366472)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_12 obj_13 obj_09 - type_1
     obj_11 obj_06 obj_02 - type_3
     obj_08 obj_05 obj_10 obj_01 - type_4
     obj_03 obj_07 - type_4
    )
 (:init 
    (pred_3 obj_04 obj_03)
    (pred_3 obj_12 obj_01)
    (pred_4 obj_12)
    (pred_3 obj_13 obj_01)
    (pred_4 obj_13)
    (pred_3 obj_09 obj_01)
    (pred_4 obj_09)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_07)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_07)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_07)
    (pred_6 obj_03 obj_08)
    (pred_6 obj_01 obj_07)
    (pred_6 obj_08 obj_05)
    (pred_6 obj_05 obj_10)
    (pred_6 obj_10 obj_01)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_06)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
