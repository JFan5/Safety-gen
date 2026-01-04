; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1537838237 --problem-name spanner-s3-n3-l4-s1537838237
(define (problem spanner-s3-n3-l4-s1537838237)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_12 obj_10 obj_06 - type_2
     obj_07 obj_04 obj_01 - type_1
     obj_02 obj_11 obj_05 obj_13 - type_3
     obj_03 obj_09 - type_3
    )
 (:init 
    (pred_4 obj_08 obj_03)
    (pred_4 obj_12 obj_02)
    (pred_2 obj_12)
    (pred_4 obj_10 obj_11)
    (pred_2 obj_10)
    (pred_4 obj_06 obj_05)
    (pred_2 obj_06)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_09)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_09)
    (pred_3 obj_01)
    (pred_4 obj_01 obj_09)
    (pred_1 obj_03 obj_02)
    (pred_1 obj_13 obj_09)
    (pred_1 obj_02 obj_11)
    (pred_1 obj_11 obj_05)
    (pred_1 obj_05 obj_13)
)
 (:goal
  (and
   (pred_5 obj_07)
   (pred_5 obj_04)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_07)) (not (pred_5 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_03)))
  )
)
)
