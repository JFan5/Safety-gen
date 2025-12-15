; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1793141239 --problem-name spanner-s3-n3-l4-s1793141239
(define (problem spanner-s3-n3-l4-s1793141239)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_13 obj_09 obj_08 - type_3
     obj_10 obj_11 obj_05 - type_4
     obj_03 obj_01 obj_02 obj_04 - type_1
     obj_12 obj_06 - type_1
    )
 (:init 
    (pred_2 obj_07 obj_12)
    (pred_2 obj_13 obj_03)
    (pred_4 obj_13)
    (pred_2 obj_09 obj_04)
    (pred_4 obj_09)
    (pred_2 obj_08 obj_03)
    (pred_4 obj_08)
    (pred_6 obj_10)
    (pred_2 obj_10 obj_06)
    (pred_6 obj_11)
    (pred_2 obj_11 obj_06)
    (pred_6 obj_05)
    (pred_2 obj_05 obj_06)
    (pred_1 obj_12 obj_03)
    (pred_1 obj_04 obj_06)
    (pred_1 obj_03 obj_01)
    (pred_1 obj_01 obj_02)
    (pred_1 obj_02 obj_04)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_11)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_12)))
  )
)
)
