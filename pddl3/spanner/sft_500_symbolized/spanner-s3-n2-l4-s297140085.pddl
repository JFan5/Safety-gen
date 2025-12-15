; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 297140085 --problem-name spanner-s3-n2-l4-s297140085
(define (problem spanner-s3-n2-l4-s297140085)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_10 obj_01 obj_03 - type_2
     obj_07 obj_08 - type_3
     obj_12 obj_06 obj_02 obj_04 - type_4
     obj_05 obj_11 - type_4
    )
 (:init 
    (pred_1 obj_09 obj_05)
    (pred_1 obj_10 obj_12)
    (pred_5 obj_10)
    (pred_1 obj_01 obj_02)
    (pred_5 obj_01)
    (pred_1 obj_03 obj_06)
    (pred_5 obj_03)
    (pred_2 obj_07)
    (pred_1 obj_07 obj_11)
    (pred_2 obj_08)
    (pred_1 obj_08 obj_11)
    (pred_3 obj_05 obj_12)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_12 obj_06)
    (pred_3 obj_06 obj_02)
    (pred_3 obj_02 obj_04)
)
 (:goal
  (and
   (pred_4 obj_07)
   (pred_4 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_07)) (not (pred_4 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
