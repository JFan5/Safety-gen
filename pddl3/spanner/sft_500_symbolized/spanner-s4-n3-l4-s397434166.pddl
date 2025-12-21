; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 397434166 --problem-name spanner-s4-n3-l4-s397434166
(define (problem spanner-s4-n3-l4-s397434166)
 (:domain spanner)
 (:objects 
     obj_09 - type_3
     obj_07 obj_04 obj_05 obj_13 - type_5
     obj_06 obj_14 obj_08 - type_4
     obj_02 obj_03 obj_12 obj_10 - type_2
     obj_11 obj_01 - type_2
    )
 (:init 
    (pred_2 obj_09 obj_11)
    (pred_2 obj_07 obj_02)
    (pred_1 obj_07)
    (pred_2 obj_04 obj_03)
    (pred_1 obj_04)
    (pred_2 obj_05 obj_12)
    (pred_1 obj_05)
    (pred_2 obj_13 obj_02)
    (pred_1 obj_13)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_01)
    (pred_5 obj_14)
    (pred_2 obj_14 obj_01)
    (pred_5 obj_08)
    (pred_2 obj_08 obj_01)
    (pred_6 obj_11 obj_02)
    (pred_6 obj_10 obj_01)
    (pred_6 obj_02 obj_03)
    (pred_6 obj_03 obj_12)
    (pred_6 obj_12 obj_10)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_14)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_14))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_11)))
  )
)
)
