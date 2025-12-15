; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1730654347 --problem-name spanner-s3-n3-l4-s1730654347
(define (problem spanner-s3-n3-l4-s1730654347)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_11 obj_12 obj_04 - type_1
     obj_13 obj_03 obj_05 - type_3
     obj_07 obj_08 obj_02 obj_10 - type_5
     obj_09 obj_01 - type_5
    )
 (:init 
    (pred_1 obj_06 obj_09)
    (pred_1 obj_11 obj_02)
    (pred_5 obj_11)
    (pred_1 obj_12 obj_08)
    (pred_5 obj_12)
    (pred_1 obj_04 obj_07)
    (pred_5 obj_04)
    (pred_6 obj_13)
    (pred_1 obj_13 obj_01)
    (pred_6 obj_03)
    (pred_1 obj_03 obj_01)
    (pred_6 obj_05)
    (pred_1 obj_05 obj_01)
    (pred_4 obj_09 obj_07)
    (pred_4 obj_10 obj_01)
    (pred_4 obj_07 obj_08)
    (pred_4 obj_08 obj_02)
    (pred_4 obj_02 obj_10)
)
 (:goal
  (and
   (pred_3 obj_13)
   (pred_3 obj_03)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
