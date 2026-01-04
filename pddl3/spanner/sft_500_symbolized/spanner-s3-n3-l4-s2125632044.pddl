; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2125632044 --problem-name spanner-s3-n3-l4-s2125632044
(define (problem spanner-s3-n3-l4-s2125632044)
 (:domain spanner)
 (:objects 
     obj_02 - type_1
     obj_05 obj_06 obj_13 - type_5
     obj_11 obj_10 obj_12 - type_2
     obj_04 obj_07 obj_03 obj_09 - type_4
     obj_01 obj_08 - type_4
    )
 (:init 
    (pred_4 obj_02 obj_01)
    (pred_4 obj_05 obj_03)
    (pred_3 obj_05)
    (pred_4 obj_06 obj_07)
    (pred_3 obj_06)
    (pred_4 obj_13 obj_03)
    (pred_3 obj_13)
    (pred_5 obj_11)
    (pred_4 obj_11 obj_08)
    (pred_5 obj_10)
    (pred_4 obj_10 obj_08)
    (pred_5 obj_12)
    (pred_4 obj_12 obj_08)
    (pred_1 obj_01 obj_04)
    (pred_1 obj_09 obj_08)
    (pred_1 obj_04 obj_07)
    (pred_1 obj_07 obj_03)
    (pred_1 obj_03 obj_09)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_10)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_01)))
  )
)
)
