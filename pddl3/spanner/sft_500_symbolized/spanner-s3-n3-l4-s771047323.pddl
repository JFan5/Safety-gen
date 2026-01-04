; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 771047323 --problem-name spanner-s3-n3-l4-s771047323
(define (problem spanner-s3-n3-l4-s771047323)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_02 obj_12 obj_06 - type_2
     obj_10 obj_13 obj_04 - type_1
     obj_05 obj_08 obj_01 obj_07 - type_5
     obj_09 obj_03 - type_5
    )
 (:init 
    (pred_2 obj_11 obj_09)
    (pred_2 obj_02 obj_01)
    (pred_5 obj_02)
    (pred_2 obj_12 obj_01)
    (pred_5 obj_12)
    (pred_2 obj_06 obj_08)
    (pred_5 obj_06)
    (pred_6 obj_10)
    (pred_2 obj_10 obj_03)
    (pred_6 obj_13)
    (pred_2 obj_13 obj_03)
    (pred_6 obj_04)
    (pred_2 obj_04 obj_03)
    (pred_4 obj_09 obj_05)
    (pred_4 obj_07 obj_03)
    (pred_4 obj_05 obj_08)
    (pred_4 obj_08 obj_01)
    (pred_4 obj_01 obj_07)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_13)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
