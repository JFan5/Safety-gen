; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1716191525 --problem-name spanner-s3-n3-l4-s1716191525
(define (problem spanner-s3-n3-l4-s1716191525)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_13 obj_01 obj_04 - type_1
     obj_10 obj_05 obj_09 - type_4
     obj_07 obj_08 obj_12 obj_11 - type_2
     obj_03 obj_02 - type_2
    )
 (:init 
    (pred_5 obj_06 obj_03)
    (pred_5 obj_13 obj_07)
    (pred_4 obj_13)
    (pred_5 obj_01 obj_12)
    (pred_4 obj_01)
    (pred_5 obj_04 obj_12)
    (pred_4 obj_04)
    (pred_6 obj_10)
    (pred_5 obj_10 obj_02)
    (pred_6 obj_05)
    (pred_5 obj_05 obj_02)
    (pred_6 obj_09)
    (pred_5 obj_09 obj_02)
    (pred_2 obj_03 obj_07)
    (pred_2 obj_11 obj_02)
    (pred_2 obj_07 obj_08)
    (pred_2 obj_08 obj_12)
    (pred_2 obj_12 obj_11)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_05)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_10)) (not (pred_1 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
