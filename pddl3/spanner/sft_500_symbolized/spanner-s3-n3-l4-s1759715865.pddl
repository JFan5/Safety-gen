; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1759715865 --problem-name spanner-s3-n3-l4-s1759715865
(define (problem spanner-s3-n3-l4-s1759715865)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_12 obj_04 obj_13 - type_3
     obj_11 obj_08 obj_01 - type_5
     obj_10 obj_03 obj_07 obj_05 - type_1
     obj_02 obj_09 - type_1
    )
 (:init 
    (pred_2 obj_06 obj_02)
    (pred_2 obj_12 obj_10)
    (pred_1 obj_12)
    (pred_2 obj_04 obj_07)
    (pred_1 obj_04)
    (pred_2 obj_13 obj_07)
    (pred_1 obj_13)
    (pred_3 obj_11)
    (pred_2 obj_11 obj_09)
    (pred_3 obj_08)
    (pred_2 obj_08 obj_09)
    (pred_3 obj_01)
    (pred_2 obj_01 obj_09)
    (pred_4 obj_02 obj_10)
    (pred_4 obj_05 obj_09)
    (pred_4 obj_10 obj_03)
    (pred_4 obj_03 obj_07)
    (pred_4 obj_07 obj_05)
)
 (:goal
  (and
   (pred_6 obj_11)
   (pred_6 obj_08)
   (pred_6 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
