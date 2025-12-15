; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1165142660 --problem-name spanner-s3-n3-l4-s1165142660
(define (problem spanner-s3-n3-l4-s1165142660)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_02 obj_07 obj_06 - type_5
     obj_01 obj_03 obj_05 - type_1
     obj_13 obj_08 obj_11 obj_09 - type_3
     obj_12 obj_04 - type_3
    )
 (:init 
    (pred_3 obj_10 obj_12)
    (pred_3 obj_02 obj_11)
    (pred_4 obj_02)
    (pred_3 obj_07 obj_11)
    (pred_4 obj_07)
    (pred_3 obj_06 obj_11)
    (pred_4 obj_06)
    (pred_6 obj_01)
    (pred_3 obj_01 obj_04)
    (pred_6 obj_03)
    (pred_3 obj_03 obj_04)
    (pred_6 obj_05)
    (pred_3 obj_05 obj_04)
    (pred_1 obj_12 obj_13)
    (pred_1 obj_09 obj_04)
    (pred_1 obj_13 obj_08)
    (pred_1 obj_08 obj_11)
    (pred_1 obj_11 obj_09)
)
 (:goal
  (and
   (pred_5 obj_01)
   (pred_5 obj_03)
   (pred_5 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_03)) (not (pred_5 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_12)))
  )
)
)
