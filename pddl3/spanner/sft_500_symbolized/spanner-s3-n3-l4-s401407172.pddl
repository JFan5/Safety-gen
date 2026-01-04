; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 401407172 --problem-name spanner-s3-n3-l4-s401407172
(define (problem spanner-s3-n3-l4-s401407172)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_01 obj_07 obj_08 - type_2
     obj_03 obj_11 obj_10 - type_4
     obj_12 obj_05 obj_06 obj_04 - type_5
     obj_02 obj_09 - type_5
    )
 (:init 
    (pred_1 obj_13 obj_02)
    (pred_1 obj_01 obj_05)
    (pred_5 obj_01)
    (pred_1 obj_07 obj_06)
    (pred_5 obj_07)
    (pred_1 obj_08 obj_06)
    (pred_5 obj_08)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_09)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_09)
    (pred_4 obj_10)
    (pred_1 obj_10 obj_09)
    (pred_3 obj_02 obj_12)
    (pred_3 obj_04 obj_09)
    (pred_3 obj_12 obj_05)
    (pred_3 obj_05 obj_06)
    (pred_3 obj_06 obj_04)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_11)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
