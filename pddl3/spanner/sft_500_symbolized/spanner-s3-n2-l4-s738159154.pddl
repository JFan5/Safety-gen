; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 738159154 --problem-name spanner-s3-n2-l4-s738159154
(define (problem spanner-s3-n2-l4-s738159154)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_02 obj_10 obj_03 - type_2
     obj_01 obj_09 - type_1
     obj_06 obj_08 obj_11 obj_04 - type_3
     obj_07 obj_12 - type_3
    )
 (:init 
    (pred_5 obj_05 obj_07)
    (pred_5 obj_02 obj_04)
    (pred_6 obj_02)
    (pred_5 obj_10 obj_04)
    (pred_6 obj_10)
    (pred_5 obj_03 obj_04)
    (pred_6 obj_03)
    (pred_1 obj_01)
    (pred_5 obj_01 obj_12)
    (pred_1 obj_09)
    (pred_5 obj_09 obj_12)
    (pred_3 obj_07 obj_06)
    (pred_3 obj_04 obj_12)
    (pred_3 obj_06 obj_08)
    (pred_3 obj_08 obj_11)
    (pred_3 obj_11 obj_04)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_07)))
  )
)
)
