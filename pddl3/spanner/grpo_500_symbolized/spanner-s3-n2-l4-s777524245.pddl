; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 777524245 --problem-name spanner-s3-n2-l4-s777524245
(define (problem spanner-s3-n2-l4-s777524245)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_04 obj_06 obj_10 - type_3
     obj_11 obj_08 - type_1
     obj_05 obj_03 obj_07 obj_12 - type_2
     obj_02 obj_01 - type_2
    )
 (:init 
    (pred_6 obj_09 obj_02)
    (pred_6 obj_04 obj_07)
    (pred_5 obj_04)
    (pred_6 obj_06 obj_07)
    (pred_5 obj_06)
    (pred_6 obj_10 obj_07)
    (pred_5 obj_10)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_01)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_01)
    (pred_3 obj_02 obj_05)
    (pred_3 obj_12 obj_01)
    (pred_3 obj_05 obj_03)
    (pred_3 obj_03 obj_07)
    (pred_3 obj_07 obj_12)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
