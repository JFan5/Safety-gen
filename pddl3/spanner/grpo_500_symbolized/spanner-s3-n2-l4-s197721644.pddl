; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 197721644 --problem-name spanner-s3-n2-l4-s197721644
(define (problem spanner-s3-n2-l4-s197721644)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_04 obj_03 obj_07 - type_5
     obj_02 obj_01 - type_1
     obj_12 obj_05 obj_09 obj_06 - type_3
     obj_11 obj_10 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_11)
    (pred_3 obj_04 obj_05)
    (pred_1 obj_04)
    (pred_3 obj_03 obj_12)
    (pred_1 obj_03)
    (pred_3 obj_07 obj_09)
    (pred_1 obj_07)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_10)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_10)
    (pred_4 obj_11 obj_12)
    (pred_4 obj_06 obj_10)
    (pred_4 obj_12 obj_05)
    (pred_4 obj_05 obj_09)
    (pred_4 obj_09 obj_06)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
