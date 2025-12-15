; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2055820683 --problem-name spanner-s3-n3-l4-s2055820683
(define (problem spanner-s3-n3-l4-s2055820683)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_02 obj_07 obj_03 - type_5
     obj_04 obj_01 obj_13 - type_1
     obj_10 obj_08 obj_11 obj_05 - type_2
     obj_12 obj_09 - type_2
    )
 (:init 
    (pred_5 obj_06 obj_12)
    (pred_5 obj_02 obj_11)
    (pred_6 obj_02)
    (pred_5 obj_07 obj_05)
    (pred_6 obj_07)
    (pred_5 obj_03 obj_08)
    (pred_6 obj_03)
    (pred_1 obj_04)
    (pred_5 obj_04 obj_09)
    (pred_1 obj_01)
    (pred_5 obj_01 obj_09)
    (pred_1 obj_13)
    (pred_5 obj_13 obj_09)
    (pred_2 obj_12 obj_10)
    (pred_2 obj_05 obj_09)
    (pred_2 obj_10 obj_08)
    (pred_2 obj_08 obj_11)
    (pred_2 obj_11 obj_05)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_01)
   (pred_3 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_13))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_12)))
  )
)
)
