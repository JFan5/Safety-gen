; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1796886045 --problem-name spanner-s3-n3-l4-s1796886045
(define (problem spanner-s3-n3-l4-s1796886045)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_04 obj_13 obj_06 - type_1
     obj_03 obj_12 obj_07 - type_4
     obj_01 obj_09 obj_02 obj_10 - type_3
     obj_11 obj_05 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_11)
    (pred_3 obj_04 obj_01)
    (pred_1 obj_04)
    (pred_3 obj_13 obj_10)
    (pred_1 obj_13)
    (pred_3 obj_06 obj_09)
    (pred_1 obj_06)
    (pred_4 obj_03)
    (pred_3 obj_03 obj_05)
    (pred_4 obj_12)
    (pred_3 obj_12 obj_05)
    (pred_4 obj_07)
    (pred_3 obj_07 obj_05)
    (pred_2 obj_11 obj_01)
    (pred_2 obj_10 obj_05)
    (pred_2 obj_01 obj_09)
    (pred_2 obj_09 obj_02)
    (pred_2 obj_02 obj_10)
)
 (:goal
  (and
   (pred_5 obj_03)
   (pred_5 obj_12)
   (pred_5 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_03)) (not (pred_5 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
