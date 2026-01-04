; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1327424073 --problem-name spanner-s3-n3-l4-s1327424073
(define (problem spanner-s3-n3-l4-s1327424073)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_03 obj_07 obj_08 - type_1
     obj_11 obj_04 obj_09 - type_4
     obj_06 obj_05 obj_13 obj_10 - type_2
     obj_12 obj_02 - type_2
    )
 (:init 
    (pred_5 obj_01 obj_12)
    (pred_5 obj_03 obj_06)
    (pred_3 obj_03)
    (pred_5 obj_07 obj_05)
    (pred_3 obj_07)
    (pred_5 obj_08 obj_06)
    (pred_3 obj_08)
    (pred_6 obj_11)
    (pred_5 obj_11 obj_02)
    (pred_6 obj_04)
    (pred_5 obj_04 obj_02)
    (pred_6 obj_09)
    (pred_5 obj_09 obj_02)
    (pred_2 obj_12 obj_06)
    (pred_2 obj_10 obj_02)
    (pred_2 obj_06 obj_05)
    (pred_2 obj_05 obj_13)
    (pred_2 obj_13 obj_10)
)
 (:goal
  (and
   (pred_4 obj_11)
   (pred_4 obj_04)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_11)) (not (pred_4 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_12)))
  )
)
)
