; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 418868998 --problem-name spanner-s3-n2-l4-s418868998
(define (problem spanner-s3-n2-l4-s418868998)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_01 obj_07 obj_10 - type_5
     obj_09 obj_08 - type_1
     obj_03 obj_11 obj_04 obj_12 - type_3
     obj_02 obj_06 - type_3
    )
 (:init 
    (pred_3 obj_05 obj_02)
    (pred_3 obj_01 obj_03)
    (pred_1 obj_01)
    (pred_3 obj_07 obj_11)
    (pred_1 obj_07)
    (pred_3 obj_10 obj_04)
    (pred_1 obj_10)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_06)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_06)
    (pred_4 obj_02 obj_03)
    (pred_4 obj_12 obj_06)
    (pred_4 obj_03 obj_11)
    (pred_4 obj_11 obj_04)
    (pred_4 obj_04 obj_12)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_02)))
  )
)
)
