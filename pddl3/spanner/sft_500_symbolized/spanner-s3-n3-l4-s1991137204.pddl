; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1991137204 --problem-name spanner-s3-n3-l4-s1991137204
(define (problem spanner-s3-n3-l4-s1991137204)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_06 obj_10 obj_02 - type_4
     obj_04 obj_12 obj_09 - type_3
     obj_05 obj_01 obj_08 obj_13 - type_1
     obj_03 obj_11 - type_1
    )
 (:init 
    (pred_3 obj_07 obj_03)
    (pred_3 obj_06 obj_05)
    (pred_1 obj_06)
    (pred_3 obj_10 obj_05)
    (pred_1 obj_10)
    (pred_3 obj_02 obj_08)
    (pred_1 obj_02)
    (pred_6 obj_04)
    (pred_3 obj_04 obj_11)
    (pred_6 obj_12)
    (pred_3 obj_12 obj_11)
    (pred_6 obj_09)
    (pred_3 obj_09 obj_11)
    (pred_2 obj_03 obj_05)
    (pred_2 obj_13 obj_11)
    (pred_2 obj_05 obj_01)
    (pred_2 obj_01 obj_08)
    (pred_2 obj_08 obj_13)
)
 (:goal
  (and
   (pred_4 obj_04)
   (pred_4 obj_12)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_04)) (not (pred_4 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
