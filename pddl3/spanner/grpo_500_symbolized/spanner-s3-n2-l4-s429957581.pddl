; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 429957581 --problem-name spanner-s3-n2-l4-s429957581
(define (problem spanner-s3-n2-l4-s429957581)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_07 obj_10 obj_08 - type_3
     obj_01 obj_11 - type_1
     obj_09 obj_04 obj_03 obj_05 - type_2
     obj_12 obj_06 - type_2
    )
 (:init 
    (pred_6 obj_02 obj_12)
    (pred_6 obj_07 obj_05)
    (pred_5 obj_07)
    (pred_6 obj_10 obj_03)
    (pred_5 obj_10)
    (pred_6 obj_08 obj_05)
    (pred_5 obj_08)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_06)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_06)
    (pred_3 obj_12 obj_09)
    (pred_3 obj_05 obj_06)
    (pred_3 obj_09 obj_04)
    (pred_3 obj_04 obj_03)
    (pred_3 obj_03 obj_05)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
