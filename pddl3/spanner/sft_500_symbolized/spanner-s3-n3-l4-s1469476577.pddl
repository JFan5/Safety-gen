; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1469476577 --problem-name spanner-s3-n3-l4-s1469476577
(define (problem spanner-s3-n3-l4-s1469476577)
 (:domain spanner)
 (:objects 
     obj_02 - type_1
     obj_01 obj_13 obj_04 - type_3
     obj_07 obj_10 obj_08 - type_4
     obj_03 obj_05 obj_06 obj_09 - type_2
     obj_12 obj_11 - type_2
    )
 (:init 
    (pred_4 obj_02 obj_12)
    (pred_4 obj_01 obj_05)
    (pred_6 obj_01)
    (pred_4 obj_13 obj_05)
    (pred_6 obj_13)
    (pred_4 obj_04 obj_05)
    (pred_6 obj_04)
    (pred_2 obj_07)
    (pred_4 obj_07 obj_11)
    (pred_2 obj_10)
    (pred_4 obj_10 obj_11)
    (pred_2 obj_08)
    (pred_4 obj_08 obj_11)
    (pred_1 obj_12 obj_03)
    (pred_1 obj_09 obj_11)
    (pred_1 obj_03 obj_05)
    (pred_1 obj_05 obj_06)
    (pred_1 obj_06 obj_09)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_10)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
