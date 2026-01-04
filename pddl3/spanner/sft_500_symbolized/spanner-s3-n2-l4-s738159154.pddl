; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 738159154 --problem-name spanner-s3-n2-l4-s738159154
(define (problem spanner-s3-n2-l4-s738159154)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_07 obj_05 obj_09 - type_1
     obj_06 obj_01 - type_4
     obj_12 obj_03 obj_04 obj_11 - type_2
     obj_02 obj_10 - type_2
    )
 (:init 
    (pred_3 obj_08 obj_02)
    (pred_3 obj_07 obj_11)
    (pred_4 obj_07)
    (pred_3 obj_05 obj_11)
    (pred_4 obj_05)
    (pred_3 obj_09 obj_11)
    (pred_4 obj_09)
    (pred_1 obj_06)
    (pred_3 obj_06 obj_10)
    (pred_1 obj_01)
    (pred_3 obj_01 obj_10)
    (pred_5 obj_02 obj_12)
    (pred_5 obj_11 obj_10)
    (pred_5 obj_12 obj_03)
    (pred_5 obj_03 obj_04)
    (pred_5 obj_04 obj_11)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_06)) (not (pred_6 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_02)))
  )
)
)
