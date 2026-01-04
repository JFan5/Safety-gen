; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 397434166 --problem-name spanner-s4-n3-l4-s397434166
(define (problem spanner-s4-n3-l4-s397434166)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_14 obj_11 obj_09 obj_02 - type_1
     obj_07 obj_06 obj_13 - type_3
     obj_12 obj_05 obj_01 obj_10 - type_4
     obj_08 obj_03 - type_4
    )
 (:init 
    (pred_4 obj_04 obj_08)
    (pred_4 obj_14 obj_12)
    (pred_3 obj_14)
    (pred_4 obj_11 obj_05)
    (pred_3 obj_11)
    (pred_4 obj_09 obj_01)
    (pred_3 obj_09)
    (pred_4 obj_02 obj_12)
    (pred_3 obj_02)
    (pred_6 obj_07)
    (pred_4 obj_07 obj_03)
    (pred_6 obj_06)
    (pred_4 obj_06 obj_03)
    (pred_6 obj_13)
    (pred_4 obj_13 obj_03)
    (pred_1 obj_08 obj_12)
    (pred_1 obj_10 obj_03)
    (pred_1 obj_12 obj_05)
    (pred_1 obj_05 obj_01)
    (pred_1 obj_01 obj_10)
)
 (:goal
  (and
   (pred_5 obj_07)
   (pred_5 obj_06)
   (pred_5 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_07)) (not (pred_5 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_08)))
  )
)
)
