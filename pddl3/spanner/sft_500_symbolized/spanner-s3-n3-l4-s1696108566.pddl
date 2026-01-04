; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1696108566 --problem-name spanner-s3-n3-l4-s1696108566
(define (problem spanner-s3-n3-l4-s1696108566)
 (:domain spanner)
 (:objects 
     obj_07 - type_1
     obj_05 obj_09 obj_04 - type_5
     obj_02 obj_10 obj_08 - type_2
     obj_06 obj_03 obj_13 obj_11 - type_3
     obj_12 obj_01 - type_3
    )
 (:init 
    (pred_6 obj_07 obj_12)
    (pred_6 obj_05 obj_03)
    (pred_2 obj_05)
    (pred_6 obj_09 obj_11)
    (pred_2 obj_09)
    (pred_6 obj_04 obj_13)
    (pred_2 obj_04)
    (pred_1 obj_02)
    (pred_6 obj_02 obj_01)
    (pred_1 obj_10)
    (pred_6 obj_10 obj_01)
    (pred_1 obj_08)
    (pred_6 obj_08 obj_01)
    (pred_5 obj_12 obj_06)
    (pred_5 obj_11 obj_01)
    (pred_5 obj_06 obj_03)
    (pred_5 obj_03 obj_13)
    (pred_5 obj_13 obj_11)
)
 (:goal
  (and
   (pred_3 obj_02)
   (pred_3 obj_10)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
