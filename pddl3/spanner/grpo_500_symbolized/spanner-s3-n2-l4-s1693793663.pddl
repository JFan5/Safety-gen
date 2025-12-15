; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1693793663 --problem-name spanner-s3-n2-l4-s1693793663
(define (problem spanner-s3-n2-l4-s1693793663)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_10 obj_06 obj_05 - type_5
     obj_07 obj_11 - type_1
     obj_03 obj_02 obj_04 obj_08 - type_3
     obj_12 obj_09 - type_3
    )
 (:init 
    (pred_3 obj_01 obj_12)
    (pred_3 obj_10 obj_08)
    (pred_1 obj_10)
    (pred_3 obj_06 obj_03)
    (pred_1 obj_06)
    (pred_3 obj_05 obj_03)
    (pred_1 obj_05)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_09)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_09)
    (pred_4 obj_12 obj_03)
    (pred_4 obj_08 obj_09)
    (pred_4 obj_03 obj_02)
    (pred_4 obj_02 obj_04)
    (pred_4 obj_04 obj_08)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_12)))
  )
)
)
