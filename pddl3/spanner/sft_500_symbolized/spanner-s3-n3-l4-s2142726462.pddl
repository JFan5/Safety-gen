; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2142726462 --problem-name spanner-s3-n3-l4-s2142726462
(define (problem spanner-s3-n3-l4-s2142726462)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_04 obj_11 obj_10 - type_1
     obj_13 obj_01 obj_08 - type_3
     obj_07 obj_02 obj_12 obj_06 - type_5
     obj_09 obj_03 - type_5
    )
 (:init 
    (pred_1 obj_05 obj_09)
    (pred_1 obj_04 obj_12)
    (pred_4 obj_04)
    (pred_1 obj_11 obj_02)
    (pred_4 obj_11)
    (pred_1 obj_10 obj_12)
    (pred_4 obj_10)
    (pred_2 obj_13)
    (pred_1 obj_13 obj_03)
    (pred_2 obj_01)
    (pred_1 obj_01 obj_03)
    (pred_2 obj_08)
    (pred_1 obj_08 obj_03)
    (pred_6 obj_09 obj_07)
    (pred_6 obj_06 obj_03)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_02 obj_12)
    (pred_6 obj_12 obj_06)
)
 (:goal
  (and
   (pred_5 obj_13)
   (pred_5 obj_01)
   (pred_5 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_01)) (not (pred_5 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
