; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1590242648 --problem-name spanner-s3-n3-l4-s1590242648
(define (problem spanner-s3-n3-l4-s1590242648)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_02 obj_08 obj_10 - type_1
     obj_01 obj_11 obj_06 - type_2
     obj_13 obj_07 obj_05 obj_04 - type_4
     obj_12 obj_09 - type_4
    )
 (:init 
    (pred_4 obj_03 obj_12)
    (pred_4 obj_02 obj_05)
    (pred_1 obj_02)
    (pred_4 obj_08 obj_07)
    (pred_1 obj_08)
    (pred_4 obj_10 obj_05)
    (pred_1 obj_10)
    (pred_6 obj_01)
    (pred_4 obj_01 obj_09)
    (pred_6 obj_11)
    (pred_4 obj_11 obj_09)
    (pred_6 obj_06)
    (pred_4 obj_06 obj_09)
    (pred_3 obj_12 obj_13)
    (pred_3 obj_04 obj_09)
    (pred_3 obj_13 obj_07)
    (pred_3 obj_07 obj_05)
    (pred_3 obj_05 obj_04)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_11)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
