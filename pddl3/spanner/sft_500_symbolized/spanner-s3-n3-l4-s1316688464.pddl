; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1316688464 --problem-name spanner-s3-n3-l4-s1316688464
(define (problem spanner-s3-n3-l4-s1316688464)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_06 obj_02 obj_05 - type_4
     obj_03 obj_07 obj_08 - type_2
     obj_04 obj_10 obj_01 obj_12 - type_5
     obj_11 obj_09 - type_5
    )
 (:init 
    (pred_1 obj_13 obj_11)
    (pred_1 obj_06 obj_10)
    (pred_4 obj_06)
    (pred_1 obj_02 obj_04)
    (pred_4 obj_02)
    (pred_1 obj_05 obj_01)
    (pred_4 obj_05)
    (pred_2 obj_03)
    (pred_1 obj_03 obj_09)
    (pred_2 obj_07)
    (pred_1 obj_07 obj_09)
    (pred_2 obj_08)
    (pred_1 obj_08 obj_09)
    (pred_3 obj_11 obj_04)
    (pred_3 obj_12 obj_09)
    (pred_3 obj_04 obj_10)
    (pred_3 obj_10 obj_01)
    (pred_3 obj_01 obj_12)
)
 (:goal
  (and
   (pred_6 obj_03)
   (pred_6 obj_07)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_03)) (not (pred_6 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
