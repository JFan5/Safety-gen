; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 297140085 --problem-name spanner-s3-n2-l4-s297140085
(define (problem spanner-s3-n2-l4-s297140085)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_08 obj_11 obj_07 - type_3
     obj_12 obj_10 - type_1
     obj_06 obj_01 obj_05 obj_02 - type_2
     obj_09 obj_03 - type_2
    )
 (:init 
    (pred_2 obj_04 obj_09)
    (pred_2 obj_08 obj_06)
    (pred_1 obj_08)
    (pred_2 obj_11 obj_05)
    (pred_1 obj_11)
    (pred_2 obj_07 obj_01)
    (pred_1 obj_07)
    (pred_6 obj_12)
    (pred_2 obj_12 obj_03)
    (pred_6 obj_10)
    (pred_2 obj_10 obj_03)
    (pred_4 obj_09 obj_06)
    (pred_4 obj_02 obj_03)
    (pred_4 obj_06 obj_01)
    (pred_4 obj_01 obj_05)
    (pred_4 obj_05 obj_02)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
