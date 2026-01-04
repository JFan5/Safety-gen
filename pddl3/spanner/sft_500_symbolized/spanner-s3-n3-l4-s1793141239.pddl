; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1793141239 --problem-name spanner-s3-n3-l4-s1793141239
(define (problem spanner-s3-n3-l4-s1793141239)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_03 obj_07 obj_13 - type_3
     obj_04 obj_01 obj_08 - type_5
     obj_02 obj_12 obj_09 obj_05 - type_2
     obj_11 obj_10 - type_2
    )
 (:init 
    (pred_1 obj_06 obj_11)
    (pred_1 obj_03 obj_02)
    (pred_5 obj_03)
    (pred_1 obj_07 obj_05)
    (pred_5 obj_07)
    (pred_1 obj_13 obj_02)
    (pred_5 obj_13)
    (pred_3 obj_04)
    (pred_1 obj_04 obj_10)
    (pred_3 obj_01)
    (pred_1 obj_01 obj_10)
    (pred_3 obj_08)
    (pred_1 obj_08 obj_10)
    (pred_4 obj_11 obj_02)
    (pred_4 obj_05 obj_10)
    (pred_4 obj_02 obj_12)
    (pred_4 obj_12 obj_09)
    (pred_4 obj_09 obj_05)
)
 (:goal
  (and
   (pred_6 obj_04)
   (pred_6 obj_01)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_04)) (not (pred_6 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
