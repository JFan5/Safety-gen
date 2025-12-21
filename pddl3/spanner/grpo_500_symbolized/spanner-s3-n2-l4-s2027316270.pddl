; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 2027316270 --problem-name spanner-s3-n2-l4-s2027316270
(define (problem spanner-s3-n2-l4-s2027316270)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_09 obj_07 obj_06 - type_3
     obj_02 obj_08 - type_1
     obj_03 obj_10 obj_04 obj_01 - type_2
     obj_05 obj_12 - type_2
    )
 (:init 
    (pred_6 obj_11 obj_05)
    (pred_6 obj_09 obj_10)
    (pred_5 obj_09)
    (pred_6 obj_07 obj_04)
    (pred_5 obj_07)
    (pred_6 obj_06 obj_03)
    (pred_5 obj_06)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_12)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_12)
    (pred_3 obj_05 obj_03)
    (pred_3 obj_01 obj_12)
    (pred_3 obj_03 obj_10)
    (pred_3 obj_10 obj_04)
    (pred_3 obj_04 obj_01)
)
 (:goal
  (and
   (pred_1 obj_02)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
