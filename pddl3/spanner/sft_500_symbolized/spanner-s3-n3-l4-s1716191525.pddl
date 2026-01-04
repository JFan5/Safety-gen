; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1716191525 --problem-name spanner-s3-n3-l4-s1716191525
(define (problem spanner-s3-n3-l4-s1716191525)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_03 obj_13 obj_11 - type_4
     obj_08 obj_12 obj_09 - type_3
     obj_06 obj_01 obj_04 obj_05 - type_2
     obj_10 obj_02 - type_2
    )
 (:init 
    (pred_2 obj_07 obj_10)
    (pred_2 obj_03 obj_06)
    (pred_3 obj_03)
    (pred_2 obj_13 obj_04)
    (pred_3 obj_13)
    (pred_2 obj_11 obj_04)
    (pred_3 obj_11)
    (pred_6 obj_08)
    (pred_2 obj_08 obj_02)
    (pred_6 obj_12)
    (pred_2 obj_12 obj_02)
    (pred_6 obj_09)
    (pred_2 obj_09 obj_02)
    (pred_1 obj_10 obj_06)
    (pred_1 obj_05 obj_02)
    (pred_1 obj_06 obj_01)
    (pred_1 obj_01 obj_04)
    (pred_1 obj_04 obj_05)
)
 (:goal
  (and
   (pred_4 obj_08)
   (pred_4 obj_12)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_08)) (not (pred_4 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
