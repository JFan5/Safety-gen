; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1991137204 --problem-name spanner-s3-n3-l4-s1991137204
(define (problem spanner-s3-n3-l4-s1991137204)
 (:domain spanner)
 (:objects 
     obj_07 - type_1
     obj_05 obj_01 obj_11 - type_3
     obj_04 obj_12 obj_02 - type_5
     obj_09 obj_10 obj_08 obj_13 - type_4
     obj_03 obj_06 - type_4
    )
 (:init 
    (pred_1 obj_07 obj_03)
    (pred_1 obj_05 obj_09)
    (pred_6 obj_05)
    (pred_1 obj_01 obj_09)
    (pred_6 obj_01)
    (pred_1 obj_11 obj_08)
    (pred_6 obj_11)
    (pred_5 obj_04)
    (pred_1 obj_04 obj_06)
    (pred_5 obj_12)
    (pred_1 obj_12 obj_06)
    (pred_5 obj_02)
    (pred_1 obj_02 obj_06)
    (pred_3 obj_03 obj_09)
    (pred_3 obj_13 obj_06)
    (pred_3 obj_09 obj_10)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_08 obj_13)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_12)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_03)))
  )
)
)
