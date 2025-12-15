; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1327424073 --problem-name spanner-s3-n3-l4-s1327424073
(define (problem spanner-s3-n3-l4-s1327424073)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_11 obj_03 obj_12 - type_2
     obj_10 obj_02 obj_04 - type_3
     obj_05 obj_09 obj_13 obj_07 - type_5
     obj_08 obj_06 - type_5
    )
 (:init 
    (pred_1 obj_01 obj_08)
    (pred_1 obj_11 obj_05)
    (pred_4 obj_11)
    (pred_1 obj_03 obj_09)
    (pred_4 obj_03)
    (pred_1 obj_12 obj_05)
    (pred_4 obj_12)
    (pred_5 obj_10)
    (pred_1 obj_10 obj_06)
    (pred_5 obj_02)
    (pred_1 obj_02 obj_06)
    (pred_5 obj_04)
    (pred_1 obj_04 obj_06)
    (pred_3 obj_08 obj_05)
    (pred_3 obj_07 obj_06)
    (pred_3 obj_05 obj_09)
    (pred_3 obj_09 obj_13)
    (pred_3 obj_13 obj_07)
)
 (:goal
  (and
   (pred_6 obj_10)
   (pred_6 obj_02)
   (pred_6 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_10)) (not (pred_6 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_08)))
  )
)
)
