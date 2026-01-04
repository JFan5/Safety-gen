; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1840783542 --problem-name spanner-s3-n3-l4-s1840783542
(define (problem spanner-s3-n3-l4-s1840783542)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_02 obj_09 obj_06 - type_3
     obj_10 obj_11 obj_01 - type_2
     obj_08 obj_13 obj_03 obj_05 - type_4
     obj_12 obj_07 - type_4
    )
 (:init 
    (pred_1 obj_04 obj_12)
    (pred_1 obj_02 obj_03)
    (pred_2 obj_02)
    (pred_1 obj_09 obj_05)
    (pred_2 obj_09)
    (pred_1 obj_06 obj_03)
    (pred_2 obj_06)
    (pred_4 obj_10)
    (pred_1 obj_10 obj_07)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_07)
    (pred_4 obj_01)
    (pred_1 obj_01 obj_07)
    (pred_3 obj_12 obj_08)
    (pred_3 obj_05 obj_07)
    (pred_3 obj_08 obj_13)
    (pred_3 obj_13 obj_03)
    (pred_3 obj_03 obj_05)
)
 (:goal
  (and
   (pred_5 obj_10)
   (pred_5 obj_11)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_11)) (not (pred_5 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_12)))
  )
)
)
