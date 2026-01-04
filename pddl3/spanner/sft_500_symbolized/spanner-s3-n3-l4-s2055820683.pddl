; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2055820683 --problem-name spanner-s3-n3-l4-s2055820683
(define (problem spanner-s3-n3-l4-s2055820683)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_02 obj_08 obj_01 - type_5
     obj_09 obj_03 obj_12 - type_4
     obj_06 obj_13 obj_11 obj_10 - type_2
     obj_04 obj_07 - type_2
    )
 (:init 
    (pred_6 obj_05 obj_04)
    (pred_6 obj_02 obj_11)
    (pred_3 obj_02)
    (pred_6 obj_08 obj_10)
    (pred_3 obj_08)
    (pred_6 obj_01 obj_13)
    (pred_3 obj_01)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_07)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_07)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_07)
    (pred_5 obj_04 obj_06)
    (pred_5 obj_10 obj_07)
    (pred_5 obj_06 obj_13)
    (pred_5 obj_13 obj_11)
    (pred_5 obj_11 obj_10)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_03)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
